#!/bin/bash
#
# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause-Clear
#

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# dependency version
TensorFlow_VER="2.16.1"

BUILD_ARG=()

BUILD_ARG+=("--build-arg TensorFlow_VER=${TensorFlow_VER}")

docker build ${BUILD_ARG[@]} \
  -t qrb_ros:latest \
  -f ../dockerfile/qrb_ros.dockerfile .