FROM ros:humble

LABEL maintainer="Na Song <quic_nasong@quicinc.com>"
LABEL version="1.0"
LABEL description="this docker file is for testing QUIC_QRB_ROS on RB3 gen2 LE, more details: https://github.com/quic-qrb-ros"

# version of dependency, provided in docker_build.sh
ARG QNN_SDK_VER
ARG Lebai_SDK_VER
ARG TensorFlow_VER

# disable terminal interaction for apt
ENV DEBIAN_FRONTEND="noninteractive"
ENV SHELL="/bin/bash"
SHELL ["/bin/bash", "-c"]

# environment variables used in docker container
ENV QNN_GCC_VER="aarch64-oe-linux-gcc11.2"
ENV QNN_HEXAGON_VER="hexagon-v68"
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

# download dependency of qrb_ros_nn_inference
RUN wget -P /opt/qcom https://softwarecenter.qualcomm.com/api/download/software/qualcomm_neural_processing_sdk/v${QNN_SDK_VER}.zip && \
		cd /opt/qcom && unzip v${QNN_SDK_VER}.zip -d /opt/qcom/qnn_sdk_v${QNN_SDK_VER} && rm -rf v${QNN_SDK_VER}.zip && \
		cp -R /opt/qcom/qnn_sdk_v${QNN_SDK_VER}/qairt/${QNN_SDK_VER}/lib/${QNN_GCC_VER}/* /usr/local/lib && \
		cp -R /opt/qcom/qnn_sdk_v${QNN_SDK_VER}/qairt/${QNN_SDK_VER}/bin/${QNN_GCC_VER}/* /usr/local/bin && \
		cp -R /opt/qcom/qnn_sdk_v${QNN_SDK_VER}/qairt/${QNN_SDK_VER}/lib/${QNN_HEXAGON_VER}/unsigned/* /usr/local/lib && \
		cp -R /opt/qcom/qnn_sdk_v${QNN_SDK_VER}/qairt/${QNN_SDK_VER}/include/QNN/* /usr/local/include && \
		rm -rf /opt/qcom/qnn_sdk_v${QNN_SDK_VER} && \
		git clone --branch v${TensorFlow_VER} https://github.com/tensorflow/tensorflow.git /opt/tensorflow

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
