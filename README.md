# qrb_ros_docker

## Overview
Dockerfile and running scripts for QRB ROS applications on QCOM Linux Yocto BSP releases.

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

## Documentation
Please refer to the [QRB ROS Documentation](https://quic-qrb-ros.github.io/) for more documents.
- [Getting Started](https://quic-qrb-ros.github.io/getting_started/index.html)
- [QRB ROS Packages](https://quic-qrb-ros.github.io/packages/index.html)
- [Release Notes](https://quic-qrb-ros.github.io/release_notes/index.html)

## Contributing

We would love to have you as a part of the QRB ROS community. Whether you are helping us fix bugs, proposing new features, improving our documentation, or spreading the word, please refer to our [contribution guidelines](./CONTRIBUTING.md) and [code of conduct](./CODE_OF_CONDUCT.md).

- Bug report: If you see an error message or encounter failures, please create a [bug report](../../issues)
- Feature Request: If you have an idea or if there is a capability that is missing and would make development easier and more robust, please submit a [feature request](../../issues)

## Authors

* **Na Song** - *Initial work* - [nasongCool](https://github.com/nasongCool)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.
## License

Project is licensed under the [BSD-3-clause License](https://spdx.org/licenses/BSD-3-Clause.html). See [LICENSE](./LICENSE) for the full license text.
