# -*- mode: python -*-
# vi: set ft=python :

load(
    "@drake//tools/workspace:github.bzl",
    "github_archive",
)

def opencv_repository(
        name,
        mirrors = None):
    github_archive(
        name = name,
        repository = "opencv/opencv",
        commit = "3.4.19",
        sha256 = "9b913e74299ce4416a5c94000da577c592bf670fd53bad16220eb115a0821529",  # noqa
        build_file = "//tools/workspace/opencv:package.BUILD.bazel",
        mirrors = mirrors,
    )
