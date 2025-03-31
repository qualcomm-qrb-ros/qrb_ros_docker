#!/bin/bash
#
# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause-Clear
#

# This dockerfile doesn't contain dependecies of other QRB ROS packages.
docker run -it --rm \
  --privileged \
  --network host \
  -v /home/qrb_ros_ws/:/workspace/qrb_ros_ws \
  --name "qrb_ros_container" \
  --hostname "qrb_ros" \
  --workdir /workspace/qrb_ros_ws \
  qrb_ros:latest
