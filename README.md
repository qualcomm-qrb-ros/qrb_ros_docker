# qrb_ros_docker

## Overview
Dockerfile and running scripts for QRB ROS applications on QCOM Linux Yocto BSP releases.

## QuickStart

### Download the qrb_ros_docker

```bash
mkdir -p ~/qrb_ros_docker && \
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_docker ~/qrb_ros_docker
```

### Build docker image

docker buildx is required to build this docker image, if you haven't install it, run the following command to install:

```bash
mkdir -p $HOME/.docker/cli-plugins && \
wget https://github.com/docker/buildx/releases/download/v0.22.0/buildx-v0.22.0.linux-arm64 -O $HOME/.docker/cli-plugins/docker-buildx && \
chmod +x $HOME/.docker/cli-plugins/docker-buildx
```

Start building docker image:

```bash
cd ~/qrb_ros_docker/scripts && \
bash docker_build.sh
```

### Run docker container on QCLinux

```
cd ~/qrb_ros_docker/scripts && \
bash docker_run_qclinux.sh
```

## Documentation
Please refer to the [QRB ROS Documentation](https://qualcomm-qrb-ros.github.io/) for more documents.
- [Getting Started](https://qualcomm-qrb-ros.github.io/getting_started/index.html)
- [QRB ROS Packages](https://qualcomm-qrb-ros.github.io/packages/index.html)
- [Release Notes](https://qualcomm-qrb-ros.github.io/release_notes/index.html)

## Contributing

We would love to have you as a part of the QRB ROS community. Whether you are helping us fix bugs, proposing new features, improving our documentation, or spreading the word, please refer to our [contribution guidelines](./CONTRIBUTING.md) and [code of conduct](./CODE_OF_CONDUCT.md).

- Bug report: If you see an error message or encounter failures, please create a [bug report](../../issues)
- Feature Request: If you have an idea or if there is a capability that is missing and would make development easier and more robust, please submit a [feature request](../../issues)

## Authors

* **Na Song** - *Initial work* - [nasongCool](https://github.com/nasongCool)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.
## License

Project is licensed under the [BSD-3-clause License](https://spdx.org/licenses/BSD-3-Clause.html). See [LICENSE](./LICENSE) for the full license text.
