load("//cc:defs.bzl", "UNIT", "swift_cc_binary")

swift_cc_binary(
    name = "check_iec559",
    srcs = ["CheckIec559.cpp"],
    visibility = ["//visibility:public"],
)