# -*- mode: python -*-
# vi: set ft=python :

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)

# ================ USING A GITHUB COPY OF DRAKE ================

# Specify which revision of Drake to use.
#
# To change which commit Bazel will download, the steps are:
# 1. Update the first string below to the new commit.
# 2. Update the second string below to be the empty string.
# 3. Run `bazel build`; a checksum error will appear.
# 4. Update the second string below to the suggested new checksum.
# 5. Run `bazel build`; it should successfully download now.
#
(DRAKE_COMMIT, DRAKE_CHECKSUM) = (
    "ddb32f9dba9db9984b9292ad5227a8911a5950e7",
    "3774824b5be3fb58a7f6adf0447f50ab7d45eaf3f42e65e5d2d9ca12b0d40efb",
)

# ================ IMPLEMENTATION DETAILS ================

def drake_repository():
    # Download a specific commit of Drake, from github.
    http_archive(
        name = "drake",
        sha256 = DRAKE_CHECKSUM or ("0" * 64),
        strip_prefix = "drake-{}".format(DRAKE_COMMIT),
        urls = [x.format(DRAKE_COMMIT) for x in [
            "https://github.com/RobotLocomotion/drake/archive/{}.tar.gz",
        ]],
    )
