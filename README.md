# qrb_ros_docker

Dockerfile and running scripts for QRB ROS applications on QCLinux

## QuickStart

### Create your ROS2 workspace for QRB ROS

```bash
adb root;adb shell "mkdir -p /home/qrb_ros_ws/src"
```

### Download the qrb_ros_docker and push to your device

```bash
git clone https://github.com/quic-qrb-ros/qrb_ros_docker
```

```bash
adb push qrb_ros_docker /home/qrb_ros_ws/src/
```

### Build and Launch the Docker container on your device

```bash
cd /home/qrb_ros_ws/src/qrb_ros_docker/scripts && \
bash docker_build.sh && \
bash docker_run.sh
```

## License

qrb_ros_docker is licensed under the BSD 3-clause "New" or "Revised" License.

Check out the [LICENSE](LICENSE) for more details.