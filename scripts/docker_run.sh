#!/bin/bash
#
# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause-Clear
#

HOST_FILES=()

HOST_LIB_PATH="/usr/lib"
HOST_INCLUDE_PATH="/usr/include"
CONTAINER_LIB_PATH="/usr/local/lib"
CONTAINER_INCLUDE_PATH="/usr/local/include"

# libs for QNN TFLite GPU delegate
HOST_FILES+=("-v ${HOST_LIB_PATH}/libadreno_utils.so:${CONTAINER_LIB_PATH}/libadreno_utils.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libCB.so:${CONTAINER_LIB_PATH}/libCB.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libOpenCL.so:${CONTAINER_LIB_PATH}/libOpenCL.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libOpenCL_adreno.so:${CONTAINER_LIB_PATH}/libOpenCL_adreno.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libdmabufheap.so.0:${CONTAINER_LIB_PATH}/libdmabufheap.so.0")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libdmabufheap.so.0.0.0:${CONTAINER_LIB_PATH}/libdmabufheap.so.0.0.0")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libgsl.so:${CONTAINER_LIB_PATH}/libgsl.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libpropertyvault.so.0:${CONTAINER_LIB_PATH}/libpropertyvault.so.0")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libpropertyvault.so.0.0.0:${CONTAINER_LIB_PATH}/libpropertyvault.so.0.0.0")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libllvm-qcom.so:${CONTAINER_LIB_PATH}/libllvm-qcom.so")

# lib for building qrb_ros_camera node
HOST_FILES+=("-v ${HOST_LIB_PATH}/libcamera_metadata.so:${CONTAINER_LIB_PATH}/libcamera_metadata.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libqmmf_recorder_client.so:${CONTAINER_LIB_PATH}/libqmmf_recorder_client.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libqmmf_recorder_service.so:${CONTAINER_LIB_PATH}/libqmmf_recorder_service.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libqmmf_camera_metadata.so:${CONTAINER_LIB_PATH}/libqmmf_camera_metadata.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libqmmf_memory_interface.so:${CONTAINER_LIB_PATH}/libqmmf_memory_interface.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libgbm.so:${CONTAINER_LIB_PATH}/libgbm.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libqmmf_proto.so:${CONTAINER_LIB_PATH}/libqmmf_proto.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libprotobuf.so.30:${CONTAINER_LIB_PATH}/libprotobuf.so.30")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libglib-2.0.so:${CONTAINER_LIB_PATH}/libglib-2.0.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libpcre.so.1:${CONTAINER_LIB_PATH}/libpcre.so.1")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libqmmf_utils.so:${CONTAINER_LIB_PATH}/libqmmf_utils.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libqmmf_camera_adaptor.so:${CONTAINER_LIB_PATH}/libqmmf_camera_adaptor.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libcamera_hardware.so:${CONTAINER_LIB_PATH}/libcamera_hardware.so")

# libs and head files for building libqrc
HOST_FILES+=("-v ${HOST_LIB_PATH}/libgpiod.so:${CONTAINER_LIB_PATH}/libgpiod.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libgpiod.so.2:${CONTAINER_LIB_PATH}/libgpiod.so.2")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/gpiod.h:${CONTAINER_INCLUDE_PATH}/gpiod.h")

# libs for building qrb_ros_audio_common
HOST_FILES+=("-v ${HOST_LIB_PATH}/libpulse.so.0:${CONTAINER_LIB_PATH}/libpulse.so.0")
HOST_FILES+=("-v ${HOST_LIB_PATH}/pulseaudio/libpulsecommon-15.0.so:${CONTAINER_LIB_PATH}/libpulsecommon-15.0.so")

# socket for qrb_ros_imu
HOST_FILES+=("-v /dev/shm/server_socket:/dev/shm/server_socket")

# socket for qrb_ros_battery
HOST_FILES+=("-v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket")

# socket for qrb_ros_audio_common
HOST_FILES+=("-v /var/run/pulse/native:/var/run/pulse/native")

docker run -it --rm \
  --privileged \
  --network host \
  -v /home/qrb_ros_ws/:/workspace/qrb_ros_ws \
  ${HOST_FILES[@]} \
  --name "qrb_ros_container" \
  --hostname "qrb_ros" \
  --workdir /workspace/qrb_ros_ws \
  qrb_ros:latest
