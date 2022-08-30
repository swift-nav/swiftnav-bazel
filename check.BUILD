load("@rules_cc//cc:defs.bzl", "cc_library")
load("@root//:bazel/configure_file.bzl", "configure_file")

CONFIG = {
    "HAVE_INT16_T": "",
    "HAVE_INT32_T": "",
    "HAVE_INT64_T": "",
    "HAVE_INTMAX_T": "",
    "HAVE_UINT8_T": "",
    "HAVE_UINT16_T": "",
    "HAVE_UINT32_T": "",
    "HAVE_UINT64_T": "",
    "HAVE_UINTMAX_T": "",
    "HAVE___INT64": "0",
    "HAVE_U_INT64_T": "0",
    "HAVE_UNSIGNED___INT64": "0",
    "SIZE_OF_SHORT_CODE": "#define SIZE_OF_SHORT 2",
    "SIZE_OF_INT_CODE": "#define SIZE_OF_INT 4",
    "SIZE_OF_LONG_CODE": "#define SIZE_OF_LONG 8",
    "SIZE_OF_LONG_LONG_CODE": "#define SIZE_OF_LONG_LONG 8",
    "SIZE_OF_UNSIGNED_SHORT_CODE": "#define SIZE_OF_UNSIGNED_SHORT 2",
    "SIZE_OF_UNSIGNED_CODE": "#define SIZE_OF_UNSIGNED 4",
    "SIZE_OF_UNSIGNED_LONG_CODE": "#define SIZE_OF_UNSIGNED_LONG 8",
    "SIZE_OF_UNSIGNED_LONG_LONG_CODE": "#define SIZE_OF_UNSIGNED_LONG_LONG 8",
    "HAVE_DECL_INT64_MAX": "0",
    "HAVE_DECL_INT64_MIN": "0",
    "HAVE_DECL_SIZE_MAX": "0",
    "HAVE_DECL_SSIZE_MAX": "0",
    "HAVE_DECL_UINT32_MAX": "0",
    "HAVE_DECL_UINT64_MAX": "0",
    "HAVE_ERRNO_H": "",
    "HAVE_FORK": "",
    "HAVE_GETPID": "",
    "HAVE_GETTIMEOFDAY": "",
    "HAVE_INTTYPES_H": "",
    "HAVE_LIMITS_H": "",
    "HAVE_DECL_LOCALTIME_R": "",
    "HAVE_LOCALTIME_S": "0",
    "HAVE_LONG_LONG_INT": "0",
    "HAVE_MALLOC": "0",
    "HAVE_REALLOC": "",
    "HAVE_DECL_SETENV": "",
    "HAVE_SIGNAL_H": "",
    "HAVE_SIGACTION": "",
    "HAVE_STDARG_H": "",
    "HAVE_STDINT_H": "",
    "HAVE_STDLIB_H": "",
    "HAVE_DECL_STRDUP": "",
    "HAVE_STRING_H": "",
    "HAVE_STRINGS_H": "",
    "HAVE_DECL_STRSIGNAL": "",
    "HAVE_SYS_TIME_H": "",
    "HAVE_SYS_TYPES_H": "",
    "HAVE_TIME_H": "",
    "HAVE_UNISTD_H": "",
    "HAVE_WINDOWS_H": "0",
    "HAVE_SYNCHAPI_H": "0",
    "HAVE_INIT_ONCE_BEGIN_INITIALIZE": "0",
    "HAVE_INIT_ONCE_COMPLETE": "0",
    "HAVE_UNSIGNED_LONG_LONG": "0",
    "HAVE_UNSIGNED_LONG_LONG_INT": "0",
    "HAVE_WCHAR_T": "0",
    "HAVE__GETPID": "0",
    "HAVE__LOCALTIME64_S": "0",
    "HAVE__STRDUP": "0",
    "HAVE_PTHREAD": "",
    "CHECK_VERSION": "0",
    "SIZEOF_WCHAR_T": "0",
    "STRERROR_R_CHAR_P": "0",
    "TIME_WITH_SYS_TIME": "0",
    "SAFE_TO_DEFINE_EXTENSIONS": "0",
    "_FILE_OFFSET_BITS": "0",
    "_LARGEFILE_SOURCE": "0",
    "_LARGE_FILES": "0",
    "_WIN32_WINNT": "0",
    "WINVER": "0",
    "const": "0",
    "clockid_t": "0",
    "gid_t": "0",
    "id_t": "0",
    "mode_t": "0",
    "off_t": "0",
    "pid_t": "0",
    "size_t": "0",
    "ssize_t": "0",
    "timer_t": "0",
    "uid_t": "0",
    "intptr_t": "0",
    "uintptr_t": "0",
}

configure_file(
    name = "config",
    out = "config.h",
    template = "cmake/config.h.in",
    vars = CONFIG,
)

CHECK = {
    "CHECK_MAJOR_VERSION": "(0)",
    "CHECK_MINOR_VERSION": "(15)",
    "CHECK_MICRO_VERSION": "(2)",
    "HAVE_FORK": "1",
    "ENABLE_SUBUNIT": "1",
}

configure_file(
    name = "check_header",
    out = "check.h",
    template = "src/check.h.in",
    vars = CHECK,
)

cc_library(
    name = "check",
    srcs = [
        "lib/libcompat.h",
        "src/check.c",
        "src/check_error.c",
        "src/check_list.c",
        "src/check_log.c",
        "src/check_msg.c",
        "src/check_pack.c",
        "src/check_print.c",
        "src/check_run.c",
        "src/check_str.c",
        ":config",
    ],
    hdrs = [
        "src/check_error.h",
        "src/check_impl.h",
        "src/check_list.h",
        "src/check_log.h",
        "src/check_msg.h",
        "src/check_pack.h",
        "src/check_print.h",
        "src/check_str.h",
        ":check_header",
    ],
    includes = [
        "lib",
        "src",
    ],
    local_defines = ["HAVE_PTHREAD"],
    visibility = ["//visibility:public"],
)
