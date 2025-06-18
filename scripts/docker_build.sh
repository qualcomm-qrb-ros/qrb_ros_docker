#!/bin/bash
#
# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause-Clear
#

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

docker build \
  -t qrb_ros:latest \
  -f ../dockerfile/qrb_ros.dockerfile .
