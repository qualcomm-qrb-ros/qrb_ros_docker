#!/bin/bash

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# dependency version
QNN_SDK_VER="2.27.0.240926"
Lebai_SDK_VER="1.1.27"
TensorFlow_VER="2.16.1"

BUILD_ARG=()

BUILD_ARG+=("--build-arg QNN_SDK_VER=${QNN_SDK_VER}")
BUILD_ARG+=("--build-arg Lebai_SDK_VER=${Lebai_SDK_VER}")
BUILD_ARG+=("--build-arg TensorFlow_VER=${TensorFlow_VER}")

docker build ${BUILD_ARG[@]} \
  -t qrb_ros:latest \
  -f ../dockerfile/qrb_ros.dockerfile .