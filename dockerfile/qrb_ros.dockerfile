FROM --platform=linux/arm64/v8 docker-registry.qualcomm.com/nasong/ros:humble

LABEL maintainer="Na Song <quic_nasong@quicinc.com>"
LABEL version="1.0"
LABEL description="this docker file is for running QRB ROS applications on QCOM Linux Yocto BSP releases."

# version of dependency, provided in docker_build.sh
ARG Lebai_SDK_VER
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

# install the python dependency
RUN python3 -m pip install -U \
		opencv-python

# note: you can delete the dependency of irrelevant packages to reduce image building time.

# download dependency of qrb_ros_nn_inference
RUN git clone --branch v${TensorFlow_VER} https://github.com/tensorflow/tensorflow.git /opt/tensorflow && \
		cd /opt/tensorflow && \
		mkdir tflite-build && cd tflite-build && \
		cmake ../tensorflow/lite/c && \
		cmake --build . -j8 && \
		cp ./libtensorflowlite_c.so /usr/local/lib

# download dependency of qrb_ros_transport
RUN --mount=type=cache,target=/var/cache/apt \
		apt-get install -y \
		ros-humble-pcl-conversions \
		ros-humble-robot-localization

# download dependency of qrb_ros_robot_base
RUN --mount=type=cache,target=/var/cache/apt \
		apt-get install -y \
		ros-humble-nav2-msgs \
		ros-humble-xacro \
		ros-humble-nav2-costmap-2d \
		ros-humble-robot-state-publisher

# download dependency of qrb_ros_battery
RUN --mount=type=cache,target=/var/cache/apt \
		apt-get update && \
		apt-get install -y \
		dbus \
		libdbus-1-dev

# download dependency of qrb_ros_vision_service
RUN --mount=type=cache,target=/var/cache/apt \
		apt-get install -y \
		ros-humble-cv-bridge \
		libyaml-cpp-dev \
		libzbar-dev \
		libopencv-dev

# download dependency of qrb_ros_audio_common
RUN --mount=type=cache,target=/var/cache/apt \
		apt-get install -y \
		libpulse-dev \
		libsndfile1-dev \
		libwrap0

# download dependency of qrb_ros_manipulator
RUN git clone -b master https://github.com/lebai-robotics/lebai-sdk.git /opt/lebai-sdk-${Lebai_SDK_VER} && \
		cd /opt/lebai-sdk-${Lebai_SDK_VER} && git checkout tags/v${Lebai_SDK_VER} && \
		mkdir -p /opt/lebai-sdk-${Lebai_SDK_VER}/build && cd /opt/lebai-sdk-${Lebai_SDK_VER}/build && \
		cmake ..; cmake --build . -j8; cmake --install . && \
		rm -rf /opt/lebai-sdk-${Lebai_SDK_VER}

# download dependency of qrb_ros_amr_service
RUN --mount=type=cache,target=/var/cache/apt \
		apt-get install -y \
		ros-humble-nav-2d-msgs
