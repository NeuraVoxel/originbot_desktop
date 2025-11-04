# OriginBot Intelligent Robot Open Source Suite (PC Function Package)
![originbot](images/originbot.jpg)

OriginBot is an intelligent robot open-source suite and a community-driven open-source project aimed at enabling every participant to enjoy the fun of robot development.

## Project Links

### Main Site

[https://www.originbot.org/en/](https://www.originbot.org/en/)

### Source Code Repositories

| Repository                                                     | Description                 |
| -------------------------------------------------------------- | --------------------------- |
[originbot ](https://github.com/guyuehome/originbot)             | OriginBot robot function package repository |
[originbot_desktop](https://github.com/guyuehome/originbot_desktop) | OriginBot desktop function package repository |
[originbot_controller](https://github.com/guyuehome/originbot_controller) | OriginBot controller source code repository |

### Community Forum

[https://www.guyuehome.com/interlocution](https://www.guyuehome.com/interlocution)


## Software Architecture

- originbot_description: Robot model and loading scripts
- originbot_viz: Robot visualization function package for PC
- originbot_demo: Programming examples for basic robot functions
- originbot_gazebo: Robot simulation models and environments
- originbot_msgs: OriginBot custom communication interfaces
- originbot_app: OriginBot visualization software for PC
- originbot_deeplearning: Robot deep learning function package
    - line_follower_model: AI vision line-following data collection and model training package
    - 10_model_convert: Model conversion scripts

## Quick Start
For detailed instructions, please refer to: [https://www.originbot.org/](https://www.originbot.org/)

### View Robot Visualization Model

#### On PC

```bash
$ ros2 launch originbot_description display.launch.py
```
![img](images/2022-08-30_13-57.png)

### View Robot Lidar Visualization Data

```bash
$ ros2 launch originbot_viz display_lidar.launch.py
```

You will see the visualized lidar data:
![img](images/2022-09-05_18-38.png)

### View IMU Visualization Data

```bash
$ ros2 launch originbot_viz display_imu.launch.py
```

You will see the visualized IMU data:
![img](images/2022-09-05_18-41.png)

### View Robot TF Relationships

```bash
$ ros2 launch originbot_viz display_robot_tf.launch.py
```

### View Robot SLAM Visualization Process

```bash
$ ros2 launch originbot_viz display_slam.launch.py
```

### Monitor Robot Navigation Visualization Process

```bash
$ ros2 launch originbot_viz display_navigation.launch.py
```

### Virtual Simulation

#### PC Dependencies Installation
```bash
$ sudo apt install ros-foxy-gazebo-ros
$ sudo apt install ros-foxy-gazebo-ros2-control
$ sudo apt install ros-foxy-gazebo-plugins
$ sudo apt install ros-foxy-ros2-control
$ sudo apt install ros-foxy-ros2-controllers
```

#### Run Simulation Environment
```bash
$ ros2 launch originbot_gazebo originbot_gazebo.launch.py
```
![img](images/2022-08-31_23-42.png)

#### View Simulation Topic List

```bash
$ ros2 topic list
```
![img](images/2022-08-31_23-43.png)

#### Control Robot Movement
```bash
$ ros2 run teleop_twist_keyboard teleop_twist_keyboard
```

#### View Camera and Lidar Visualization Data
Place some obstacles in the simulation environment:
![img](images/2022-08-31_23-47.png)

```bash
$ ros2 run rviz2 rviz2
```
![img](images/2022-08-31_23-46.png)

## Contributing

We sincerely invite developers to participate in the OriginBot project. There are many ways to contribute:

### **Provide Feedback**

- If you encounter any issues or have suggestions while using the OriginBot suite, feel free to discuss them in the [GuyueHome Community Forum](https://guyuehome.com/Bubble/circleDetail/id/95);

- If you find any bugs while using the OriginBot software, please submit an issue in the [code repository](https://github.com/yzhcat/originbot);

### **Contribute Code**

- If you have optimizations, additions, or modifications to the original code while using the OriginBot suite, feel free to submit a Pull Request in the [code repository](https://github.com/yzhcat/originbot);

### **Spread Open Source**

- If you are interested in OriginBot, feel free to star the project's source code repository or share it with developers who might need it;

- If you develop more interesting features or robots based on the OriginBot open-source project, feel free to share them in the [community forum](https://guyuehome.com/Bubble/circleDetail/id/95). Outstanding projects will also be promoted in the community.


# 在宿主机上授权 X11 连接
在宿主机（运行Docker的机器）的终端中执行以下命令，允许来自本地容器的连接

```
xhost +local:docker
echo $DISPLAY
```

# ros2 foxy
安装 CycloneDDS
```
# 更新软件包列表
sudo apt update

# 安装 CycloneDDS RMW 实现
sudo apt install ros-foxy-rmw-cyclonedds-cpp

# 验证安装
ldconfig -p | grep cyclonedds
```

# tros
https://developer.d-robotics.cc/rdk_doc/Robot_development/quick_start/install_tros


# ROS2 Launch 
1. 基本概念
什么是 Launch 文件
Launch 文件用于描述和配置要启动的 ROS2 节点集合，可以：
同时启动多个节点
设置节点参数
配置节点命名空间和重映射
设置环境变量
定义节点间的依赖关系
主要文件格式
Python Launch 文件(*.launch.py) - 推荐使用
XML Launch 文件(*.launch.xml)
YAML Launch 文件(*.launch.yaml)
2. Python Launch 文件结构
基本模板
```
from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import ExecuteProcess, TimerAction
from launch.substitutions import FindExecutable

def generate_launch_description():
    return LaunchDescription([
        # 在这里添加要启动的节点和动作
    ])
```