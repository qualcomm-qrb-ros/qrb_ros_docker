FROM ros:jazzy

LABEL maintainer="Na Song <quic_nasong@quicinc.com>"
LABEL description="this docker file is for running QRB ROS applications on QCOM Linux Yocto BSP releases."

# version of dependency, provided in docker_build.sh
ARG TensorFlow_VER

# disable terminal interaction for apt
ENV DEBIAN_FRONTEND="noninteractive"
ENV SHELL="/bin/bash"
SHELL ["/bin/bash", "-c"]

# environment variables used in docker container
ENV LD_LIBRARY_PATH=/usr/local/lib
ENV QRB_ROS_WS="/workspace/qrb_ros_ws"

# install debian dependency
RUN --mount=type=cache,target=/var/cache/apt \
		apt-get update && \
		apt-get install -y \
		git \
		gcc \
		g++ \
		cmake \
		wget \
		unzip \
		python3-pip \
		python3-rosdep

# note: you can delete the dependency of irrelevant packages to reduce image building time.

# download dependency of qrb_ros_nn_inference
RUN git clone --branch v${TensorFlow_VER} https://github.com/tensorflow/tensorflow.git /opt/tensorflow && \
		cd /opt/tensorflow && \
		mkdir tflite-build && cd tflite-build && \
		cmake ../tensorflow/lite/c && \
		cmake --build . -j8 && \
		cp ./libtensorflowlite_c.so /usr/local/lib
