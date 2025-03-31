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

# libs and head flies of QNN SDK
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnBackend.h:${CONTAINER_INCLUDE_PATH}/QnnBackend.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnCommon.h:${CONTAINER_INCLUDE_PATH}/QnnCommon.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnContext.h:${CONTAINER_INCLUDE_PATH}/QnnContext.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnDevice.h:${CONTAINER_INCLUDE_PATH}/QnnDevice.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnError.h:${CONTAINER_INCLUDE_PATH}/QnnError.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnGraph.h:${CONTAINER_INCLUDE_PATH}/QnnGraph.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnInterface.h:${CONTAINER_INCLUDE_PATH}/QnnInterface.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnLog.h:${CONTAINER_INCLUDE_PATH}/QnnLog.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnMem.h:${CONTAINER_INCLUDE_PATH}/QnnMem.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnOpDef.h:${CONTAINER_INCLUDE_PATH}/QnnOpDef.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnOpPackage.h:${CONTAINER_INCLUDE_PATH}/QnnOpPackage.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnProfile.h:${CONTAINER_INCLUDE_PATH}/QnnProfile.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnProperty.h:${CONTAINER_INCLUDE_PATH}/QnnProperty.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnSdkBuildId.h:${CONTAINER_INCLUDE_PATH}/QnnSdkBuildId.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnSignal.h:${CONTAINER_INCLUDE_PATH}/QnnSignal.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnTensor.h:${CONTAINER_INCLUDE_PATH}/QnnTensor.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/QnnTypes.h:${CONTAINER_INCLUDE_PATH}/QnnTypes.h")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/CPU/:${CONTAINER_INCLUDE_PATH}/CPU/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/DSP/:${CONTAINER_INCLUDE_PATH}/DSP/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/GenAiTransformer/:${CONTAINER_INCLUDE_PATH}/GenAiTransformer/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/GPU/:${CONTAINER_INCLUDE_PATH}/GPU/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/HTA/:${CONTAINER_INCLUDE_PATH}/HTA/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/HTP/:${CONTAINER_INCLUDE_PATH}/HTP/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/HTPQEMU/:${CONTAINER_INCLUDE_PATH}/HTPQEMU/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/LPAI/:${CONTAINER_INCLUDE_PATH}/LPAI/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/Saver/:${CONTAINER_INCLUDE_PATH}/Saver/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/System/:${CONTAINER_INCLUDE_PATH}/System/")
HOST_FILES+=("-v ${HOST_INCLUDE_PATH}/TFLiteDelegate/:${CONTAINER_INCLUDE_PATH}/TFLiteDelegate/")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libcalculator.so:${CONTAINER_LIB_PATH}/libcalculator.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libGenie.so:${CONTAINER_LIB_PATH}/libGenie.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libhta_hexagon_runtime_snpe.so:${CONTAINER_LIB_PATH}/libhta_hexagon_runtime_snpe.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libPlatformValidatorShared.so:${CONTAINER_LIB_PATH}/libPlatformValidatorShared.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnChrometraceProfilingReader.so:${CONTAINER_LIB_PATH}/libQnnChrometraceProfilingReader.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnCpu.so:${CONTAINER_LIB_PATH}/libQnnCpu.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnDsp.so:${CONTAINER_LIB_PATH}/libQnnDsp.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnDspNetRunExtensions.so:${CONTAINER_LIB_PATH}/libQnnDspNetRunExtensions.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnDspV66CalculatorStub.so:${CONTAINER_LIB_PATH}/libQnnDspV66CalculatorStub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnDspV66Stub.so:${CONTAINER_LIB_PATH}/libQnnDspV66Stub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnGenAiTransformer.so:${CONTAINER_LIB_PATH}/libQnnGenAiTransformer.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnGenAiTransformerCpuOpPkg.so:${CONTAINER_LIB_PATH}/libQnnGenAiTransformerCpuOpPkg.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnGenAiTransformerModel.so:${CONTAINER_LIB_PATH}/libQnnGenAiTransformerModel.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnGpu.so:${CONTAINER_LIB_PATH}/libQnnGpu.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnGpuNetRunExtensions.so:${CONTAINER_LIB_PATH}/libQnnGpuNetRunExtensions.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnGpuProfilingReader.so:${CONTAINER_LIB_PATH}/libQnnGpuProfilingReader.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtp.so:${CONTAINER_LIB_PATH}/libQnnHtp.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpNetRunExtensions.so:${CONTAINER_LIB_PATH}/libQnnHtpNetRunExtensions.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpOptraceProfilingReader.so:${CONTAINER_LIB_PATH}/libQnnHtpOptraceProfilingReader.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpPrepare.so:${CONTAINER_LIB_PATH}/libQnnHtpPrepare.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpProfilingReader.so:${CONTAINER_LIB_PATH}/libQnnHtpProfilingReader.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpV68CalculatorStub.so:${CONTAINER_LIB_PATH}/libQnnHtpV68CalculatorStub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpV68Stub.so:${CONTAINER_LIB_PATH}/libQnnHtpV68Stub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpV69CalculatorStub.so:${CONTAINER_LIB_PATH}/libQnnHtpV69CalculatorStub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpV69Stub.so:${CONTAINER_LIB_PATH}/libQnnHtpV69Stub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpV73CalculatorStub.so:${CONTAINER_LIB_PATH}/libQnnHtpV73CalculatorStub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpV73Stub.so:${CONTAINER_LIB_PATH}/libQnnHtpV73Stub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnHtpV75Stub.so:${CONTAINER_LIB_PATH}/libQnnHtpV75Stub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnJsonProfilingReader.so:${CONTAINER_LIB_PATH}/libQnnJsonProfilingReader.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnSaver.so:${CONTAINER_LIB_PATH}/libQnnSaver.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnSystem.so:${CONTAINER_LIB_PATH}/libQnnSystem.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libQnnTFLiteDelegate.so:${CONTAINER_LIB_PATH}/libQnnTFLiteDelegate.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSNPE.so:${CONTAINER_LIB_PATH}/libSNPE.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeDspV66Stub.so:${CONTAINER_LIB_PATH}/libSnpeDspV66Stub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeHta.so:${CONTAINER_LIB_PATH}/libSnpeHta.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeHtpPrepare.so:${CONTAINER_LIB_PATH}/libSnpeHtpPrepare.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeHtpV68CalculatorStub.so:${CONTAINER_LIB_PATH}/libSnpeHtpV68CalculatorStub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeHtpV68Stub.so:${CONTAINER_LIB_PATH}/libSnpeHtpV68Stub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeHtpV73CalculatorStub.so:${CONTAINER_LIB_PATH}/libSnpeHtpV73CalculatorStub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeHtpV73Stub.so:${CONTAINER_LIB_PATH}/libSnpeHtpV73Stub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeHtpV75CalculatorStub.so:${CONTAINER_LIB_PATH}/libSnpeHtpV75CalculatorStub.so")
HOST_FILES+=("-v ${HOST_LIB_PATH}/libSnpeHtpV75Stub.so:${CONTAINER_LIB_PATH}/libSnpeHtpV75Stub.so")

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

docker run -it --rm \
  --privileged \
  --network host \
  -v /home/qrb_ros_ws/:/workspace/qrb_ros_ws \
  ${HOST_FILES[@]} \
  --name "qrb_ros_container" \
  --hostname "qrb_ros" \
  --workdir /workspace/qrb_ros_ws \
  qrb_ros:latest
