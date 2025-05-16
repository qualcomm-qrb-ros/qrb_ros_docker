FROM ros:jazzy

LABEL maintainer="Na Song <quic_nasong@quicinc.com>"
LABEL description="this docker file is for running QRB ROS applications on QCOM Linux"

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
    apt update && \
    apt install -y \
    git \
    gcc \
    g++ \
    cmake \
    wget \
    unzip \
    python3-pip \
    python3-rosdep \
    python3-pil && \
    apt clean

# note: you can delete the dependency of irrelevant packages to reduce image building time.

# install dependencies of qrb_ros_transport
RUN --mount=type=cache,target=/var/cache/apt \
    apt install -y \
    ros-jazzy-pcl-conversions && \
    apt clean

# install dependencies of qrb_ros_interfaces
RUN --mount=type=cache,target=/var/cache/apt \
    apt install -y \
    ros-jazzy-vision-msgs && \
    apt clean

# install dependencies of qrb_ros_nn_inference
RUN --mount=type=cache,target=/var/cache/apt \
    apt install software-properties-common -y && \
    add-apt-repository ppa:ubuntu-qcom-iot/qcom-noble-ppa && \
    apt update && \
    apt install -y \
    libtensorflow-lite-c-qcom1=${TensorFlow_VER} \
    libtensorflow-lite-qcom-dev=${TensorFlow_VER} && \
    apt clean