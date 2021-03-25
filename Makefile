ONNX_PROTO := bazel-onnx_go/external/com_github_onnx_onnx/onnx/onnx.proto3
PROTOC := bazel-bin/external/com_google_protobuf/protoc

all: gen_py gen_cpp gen_golang

${ONNX_PROTO}:
	bazel build @com_github_onnx_onnx//:proto3

${PROTOC}:
	bazel build @com_google_protobuf//:protoc

.PHONY: localize_onnx
localize_onnx: ${ONNX_PROTO}
	cp ${ONNX_PROTO} onnx/onnx.proto

.PHONY: gen_py
gen_py: ${PROTOC} localize_onnx
	./${PROTOC} --python_out=. -I . onnx/onnx.proto

.PHONY: gen_cpp
gen_cpp: ${PROTOC} localize_onnx
	./${PROTOC} --cpp_out=. -I . onnx/onnx.proto

.PHONY: gen_golang
gen_golang: ${PROTOC} localize_onnx
	./${PROTOC} --go_out=. -I . onnx/onnx.proto

.PHONY: clean
clean:
	rm onnx/*
	bazel clean
