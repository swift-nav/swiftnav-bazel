# Copyright (c) 2023 Synopsys, Inc. All rights reserved worldwide.
#
# This file describes the rule that users will add to their BUILD file.
# This rule takes a series of targets in the "deps" argument, and produces
# a Coverity-compatible build.json containing all of the compile commands
# that would have been to produce those targets
load("collect_actions.bzl", "collect_actions", "ActionInfo")
load("compile_mnemonics.bzl", "CompileMnemonicInfo")
load("link_mnemonics.bzl", "LinkMnemonicInfo")
load("enable_link.bzl", "EnableLinkInfo")
load(
    "@rules_cc//cc:action_names.bzl", "C_COMPILE_ACTION_NAME", "CPP_COMPILE_ACTION_NAME"
)
load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain")

TOOLCHAIN = "@rules_swiftnav//coverity/private:toolchain_type"


def _gen_script_impl(ctx):
    # Collect the depsets of actions that the collect_actions aspect added to each of
    # the dependencies into one depset with all of the actions (deduplicated if there
    # are any shared actions)
    actions = depset(
        transitive=[x[ActionInfo].actions for x in ctx.attr.deps if ActionInfo in x]
    )

    # Filter the actions into a list of just actions that are compile/link actions
    relevant_actions = find_compile_actions(ctx, actions)
    if (
        (ctx.attr.enable_link != None)
        and (EnableLinkInfo in ctx.attr.enable_link)
        and (ctx.attr.enable_link[EnableLinkInfo].link_enabled)
    ):
        relevant_actions.extend(find_used_link_actions(ctx, actions))

    # If there were no relevant actions in any of the deps, don't produce anything
    if not relevant_actions:
        return None

    # Loop over the relevant actions and extract the argument and environment
    # files for each
    arg_files, env_files = [], []
    for idx, relevant_action in enumerate(relevant_actions):
        arg_file, env_file = extract_args_and_env(ctx, relevant_action, idx)
        arg_files.append(arg_file)
        env_files.append(env_file)

    # Collect the arg and env files into a depset
    required_files = depset(direct=arg_files + env_files)

    # Write arg and env file lists to respective files
    arg_files_file = declare_cov_file(ctx, "arg-files")
    ctx.actions.write(arg_files_file, "\n".join([x.path for x in arg_files] + [""]))
    env_files_file = declare_cov_file(ctx, "env-files")
    ctx.actions.write(env_files_file, "\n".join([x.path for x in env_files] + [""]))

    # Write the build.json and return it as the default output so Bazel
    # displays it to the user
    build_json = write_build_json(ctx, arg_files_file, env_files_file, required_files)
    return [DefaultInfo(files=depset([build_json]))]


gen_script = rule(
    implementation=_gen_script_impl,
    attrs={
        "deps": attr.label_list(aspects=[collect_actions]),
        "extra_compile_mnemonics": attr.label(),
        "extra_link_mnemonics": attr.label(),
        "enable_link": attr.label(),
        "_xcode_config": attr.label(
            default=Label("@bazel_tools//tools/osx:current_xcode_config")
        ),
        "_cc_toolchain": attr.label(
            default=Label("@bazel_tools//tools/cpp:current_cc_toolchain")
        ),
        "_agent_jar": attr.label(
            default=Label("@rules_swiftnav//coverity/private:cov-bazel-agent.jar"),
            allow_single_file=True,
        ),
    },
    toolchains=[TOOLCHAIN, "@bazel_tools//tools/cpp:toolchain_type"],
    fragments=["apple", "cpp"],
)


def extract_args_and_env(ctx, action, idx):
    # Extract the arguments from the action to a file. Typically, either the argv value
    # will contain the full argument list as a list of strings (most custom actions), or
    # the args list will contain a single entry - an opaque args object that write
    # knows how to handle internally (the actions generated by the default C/C++ rules)
    args_orig = declare_cov_file(ctx, "args-orig", str(idx))
    if action.argv == None and len(action.args) != 1:
        fail(
            "[ERROR] Argument format for action with mnemonic:\n"
            + "{}\n".format(action.mnemonic)
            + "is different than expected.\n"
            + "If this is the mnemonic for a custom action, please contact"
            + "software-integrity-support@synopsys.com\n"
            + "with the rule definition for the rule that created this action."
        )
    elif action.argv != None:
        ctx.actions.write(args_orig, "\n".join(action.argv + [""]))
    else:
        ctx.actions.write(args_orig, action.args[0])

    # Get extra environment variables and input files based on the C/C++ toolchain
    # if we're compiling C or C++
    extra_cpp_env = {}
    extra_cpp_inputs = depset()
    if action.mnemonic == "CppCompile":
        # Since this is a CppCompile, there must be a C/C++ toolchain; add
        # the environment variables it would use to the environment for
        # update-build-command so anything hidden in there will propagate
        cc_toolchain = find_cpp_toolchain(ctx)

        # Determine if the compile is for C or C++; the action doesn't know
        # which it is at this point, so we'll have to assume based on the
        # extension of the inputs. Bazel considers a number of extensions
        # as C++, but only ".c" as C, so consider anything that compiles
        # a file with that extension as a C compile (implicitly, CppCompile
        # actions have only one source file; if there's a ".c" file, there
        # won't be a ".cpp" file)
        action_name = CPP_COMPILE_ACTION_NAME
        input_names = [x.basename for x in action.inputs.to_list()]
        if any([x for x in input_names if x.endswith(".c")]):
            action_name = C_COMPILE_ACTION_NAME
        feature_configuration = cc_common.configure_features(
            ctx=ctx,
            cc_toolchain=cc_toolchain,
            requested_features=ctx.features,
            unsupported_features=ctx.disabled_features,
        )

        extra_cpp_env = cc_common.get_environment_variables(
            action_name=action_name,
            feature_configuration=feature_configuration,
            variables=cc_common.create_compile_variables(
                feature_configuration=feature_configuration, cc_toolchain=cc_toolchain
            ),
        )

        # If there are any include directories that look like they're from MSVC,
        # add the original action outputs to the inputs for our action
        # because cov-emit needs one of the files produced by cl alongside
        # the actual source files
        if any(["VC" in x for x in cc_toolchain.built_in_include_directories]):
            extra_cpp_inputs = action.outputs

    # Write the action environment map as a JSON object
    env_dict = dict(action.env)
    env_dict.update(extra_cpp_env)
    env_orig = declare_cov_file(ctx, "env-orig", str(idx))
    ctx.actions.write(env_orig, json.encode(env_dict))

    # Declare the normal inputs for our action
    inputs = depset(
        direct=[args_orig, env_orig], transitive=[action.inputs, extra_cpp_inputs]
    )

    # Set env variables required for update-build-command
    update_env = {}
    xcode_config = ctx.attr._xcode_config[apple_common.XcodeVersionConfig]
    if xcode_config.xcode_version() != None:
        sdk_platform = ctx.fragments.apple.single_arch_platform
        sdk_version = xcode_config.sdk_version_for_platform(sdk_platform)

        update_env["APPLE_SDK_PLATFORM"] = sdk_platform.name_in_plist
        update_env["XCODE_VERSION_OVERRIDE"] = str(xcode_config.xcode_version())
        update_env["APPLE_SDK_VERSION_OVERRIDE"] = str(sdk_version)

    # Update the build command files (arg and env) to account
    # for Bazel toolchains that produce imperfect commands
    args = declare_cov_file(ctx, "args", str(idx))
    env = declare_cov_file(ctx, "env", str(idx))
    bazel_helper = ctx.toolchains[TOOLCHAIN].helper.files.to_list()[0]
    ctx.actions.run(
        inputs=inputs,
        outputs=[args, env],
        tools=[bazel_helper, ctx.file._agent_jar],
        executable=bazel_helper,
        env=update_env,
        arguments=[
            ctx.actions.args()
            .add("update-build-command")
            .add("--input-arg")
            .add(args_orig)
            .add("--input-env")
            .add(env_orig)
            .add("--output-arg")
            .add(args)
            .add("--output-env")
            .add(env)
        ],
        mnemonic="CovUpdateBuildCommand",
    )

    return args, env


def write_build_json(ctx, arg_files_file, env_files_file, inputs):
    # Run the appropriate version of cov-internal-bazel-helper generate-json-build
    # for the platform as determined by the toolchain
    build_json_file = declare_cov_file(ctx, "build.json")
    bazel_helper = ctx.toolchains[TOOLCHAIN].helper.files.to_list()[0]
    ctx.actions.run(
        inputs=depset(direct=[arg_files_file, env_files_file], transitive=[inputs]),
        outputs=[build_json_file],
        tools=[bazel_helper],
        executable=bazel_helper,
        arguments=[
            ctx.actions.args()
            .add("generate-json-build")
            .add("--output-file")
            .add(build_json_file)
            .add("--arg-file-list")
            .add(arg_files_file)
            .add("--env-file-list")
            .add(env_files_file)
        ],
        mnemonic="CovGenerateJsonBuild",
    )
    return build_json_file


def declare_cov_file(ctx, *args):
    return ctx.actions.declare_file((ctx.label.name + "/{}" * len(args)).format(*args))


# Find all actions collected from the action graph that match one of the
# compile mnemonics for this build; this is conceptually the set of all compile
# actions that COULD be run by all of the dependencies, but is in practice the
# set of compile that WILL be run, since Bazel assumes that all of the compiles
# specified by the dependencies will need to be done.
def find_compile_actions(ctx, actions):
    compile_mnemonics = ["CppCompile", "Javac", "Compile"]
    extra_compile_mnemonics = ctx.attr.extra_compile_mnemonics
    if extra_compile_mnemonics and CompileMnemonicInfo in extra_compile_mnemonics:
        compile_mnemonics.extend(extra_compile_mnemonics[CompileMnemonicInfo].mnemonics)

    return [x for x in actions.to_list() if x.mnemonic in compile_mnemonics]


# Find all actions collected from the action graph that match one of the link
# mnemonics for this build that contribute (directly or indirectly) to the
# default output files of the direct dependencies of the target generated by
# this rule. This is required because Bazel generates extra linking targets
# that aren't necessarily used or even valid, so we need to filter down to
# just the ones that are actually used in generating the targets that
# we're trying to capture.
def find_used_link_actions(ctx, actions):
    link_mnemonics = ["CppLink"]
    extra_link_mnemonics = ctx.attr.extra_link_mnemonics
    if extra_link_mnemonics and LinkMnemonicInfo in extra_link_mnemonics:
        link_mnemonics.extend(extra_link_mnemonics[LinkMnemonicInfo].mnemonics)

    # Get the list of direct outputs of the targets we depend on
    dep_outputs = []
    for target in ctx.attr.deps:
        dep_outputs.extend(target.files.to_list())

    # Generate a dict mapping files to actions that generate them
    file_to_action = {}
    for action in actions.to_list():
        for file in action.outputs.to_list():
            file_to_action[file] = action

    # Rebuild the actions depset to contain only the actions that generate
    # the dependency outputs, and then the actions that generate the files
    # needed to generate the outputs, etc up to 1000 levels deep (infinite
    # loops are not allowed in starlark but dependency trees are not typically
    # anywhere near that deep - 1000 is just an arbitrary choice and can be
    # increased without an issue if that turns out to be incorrect)
    needed_files = dep_outputs
    needed_actions = []
    for i in range(0, 1000):
        next_action_level = [file_to_action.get(x, None) for x in needed_files]
        next_action_level = [x for x in next_action_level if x != None]
        needed_actions.extend(next_action_level)

        needed_files = []
        for action in next_action_level:
            needed_files.extend(action.inputs.to_list())

        if len(needed_files) == 0:
            break

        if i == 999:
            fail(
                "[ERROR] Action dependency graph is too deep to capture link invocations\n"
                + "Please contact software-integrity-support@synopsys.com for support"
            )

    return [x for x in needed_actions if x.mnemonic in link_mnemonics]
