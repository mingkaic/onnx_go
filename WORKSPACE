workspace(name = "com_github_mingkaic_onnx_go")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "com_github_mingkaic_tenncor",
    commit = "c1e277b30ce8a79a1b30d09ab05d1617f5e479f5",
    remote = "https://gitlab.com/mingkaic/tenncor.git",
)

load("@com_github_mingkaic_tenncor//third_party:all.bzl", tenncor_deps = "dependencies")

tenncor_deps()

# === load cppkg dependencies ===

load("@com_github_mingkaic_cppkg//third_party:all.bzl", cppkg_deps="dependencies")
cppkg_deps()

# === load grpc depedencies ===

# common dependencies
load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_toolchains", "rules_proto_grpc_repos")
rules_proto_grpc_toolchains()
rules_proto_grpc_repos()
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")
grpc_deps()
