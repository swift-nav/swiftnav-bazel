# Copyright (C) 2022 Swift Navigation Inc.
# Contact: Swift Navigation <dev@swift-nav.com>
#
# This source is subject to the license found in the file 'LICENSE' which must
# be be distributed together with this source. All other rights reserved.
#
# THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
# EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
load("@rules_cc//cc:defs.bzl", "cc_library")
load("@rules_swiftnav//tools:configure_file.bzl", "configure_file")

configure_file(
    name = "config_h",
    out = "config.h",
    template = "cmake/config.h.in",
    vars = {
        "HAVE_INT16_T": "1",
        "HAVE_INT32_T": "1",
        "HAVE_INT64_T": "1",
        "HAVE_INTMAX_T": "1",
        "HAVE_UINT8_T": "1",
        "HAVE_UINT16_T": "1",
        "HAVE_UINT32_T": "1",
        "HAVE_UINT64_T": "1",
        "HAVE_UINTMAX_T": "1",
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
        "HAVE_ERRNO_H": "1",
        "HAVE_FORK": "1",
        "HAVE_GETPID": "1",
        "HAVE_GETTIMEOFDAY": "1",
        "HAVE_INTTYPES_H": "1",
        "HAVE_LIMITS_H": "1",
        "HAVE_DECL_LOCALTIME_R": "1",
        "HAVE_LOCALTIME_S": "0",
        "HAVE_LONG_LONG_INT": "0",
        "HAVE_MALLOC": "1",
        "HAVE_REALLOC": "1",
        "HAVE_DECL_SETENV": "1",
        "HAVE_SIGNAL_H": "1",
        "HAVE_SIGACTION": "1",
        "HAVE_STDARG_H": "1",
        "HAVE_STDINT_H": "1",
        "HAVE_STDLIB_H": "1",
        "HAVE_DECL_STRDUP": "1",
        "HAVE_STRINGS_H": "1",
        "HAVE_STRING_H": "1",
        "HAVE_DECL_STRSIGNAL": "1",
        "HAVE_SYS_TIME_H": "1",
        "HAVE_SYS_TYPES_H": "1",
        "HAVE_TIME_H": "1",
        "HAVE_UNISTD_H": "1",
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
        "HAVE_PTHREAD": "1",
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
    },
)

configure_file(
    name = "check_h",
    out = "check.h",
    template = "src/check.h.in",
    vars = {
        "CHECK_MAJOR_VERSION": "(0)",
        "CHECK_MINOR_VERSION": "(15)",
        "CHECK_MICRO_VERSION": "(2)",
        "HAVE_FORK": "1",
        "ENABLE_SUBUNIT": "0",
    },
)

configure_file(
    name = "check_stdint_h",
    out = "check_stdint.h",
    template = "cmake/check_stdint.h.in",
    vars = {
        "HAVE_STDINT_H": "1",
    },
)

cc_library(
    name = "check",
    srcs = [
        "lib/fpclassify.c",
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
        ":config_h",
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
        ":check_h",
        ":check_stdint_h",
    ],
    include_prefix = ".",
    includes = [
        "src",
    ],
    linkopts = ["-lpthread"],
    local_defines = ["HAVE_PTHREAD"],
    visibility = ["//visibility:public"],
)
