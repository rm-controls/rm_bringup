# Package Name

## Overview

This package is used for the automatic setting of the CAN bus and the automatic start of a full set of codes. The principle is to put the script into a specific folder of the system, then it will be executed automatically after ubuntu is turned on.

**Keywords:** Auto start

### License

The source code is released under a [BSD 3-Clause license](LICENSE).

**Author: Unknown  **

**Affiliation: DynamicX
Maintainer: none **

he rm_bringup package has been tested under [ROS] Melodic and Noetic on respectively 18.04 and 20.04. This is research
code, expect that it changes often and any fitness for a particular purpose is disclaimed.

[![Build Status](http://rsl-ci.ethz.ch/buildStatus/icon?job=ros_best_practices)](http://rsl-ci.ethz.ch/job/ros_best_practices/)

![Example image](doc/example.jpg)

[comment]: <> "### Publications"

[comment]: <> "If you use this work in an academic context, please cite the following publication&#40;s&#41;:"

[comment]: <> "* P. Fankhauser, M. Bloesch, C. Gehring, M. Hutter, and R. Siegwart: **PAPER TITLE**. IEEE/RSJ International Conference"

[comment]: <> "  on Intelligent Robots and Systems &#40;IROS&#41;, 2015. &#40;[PDF]&#40;http://dx.doi.org/10.3929/ethz-a-010173654&#41;&#41;"

[comment]: <> "        @inproceedings{Fankhauser2015,"

[comment]: <> "            author = {Fankhauser, P\'{e}ter and Hutter, Marco},"

[comment]: <> "            booktitle = {IEEE/RSJ International Conference on Intelligent Robots and Systems &#40;IROS&#41;},"

[comment]: <> "            title = {{PAPER TITLE}},"

[comment]: <> "            publisher = {IEEE},"

[comment]: <> "            year = {2015}"

[comment]: <> "        }"

## Installation

### Installation from Packages

To install all packages from the this repository as Debian packages use

    sudo apt-get install ros-noetic-...

Or better, use `rosdep`:

	sudo rosdep install --from-paths src

### Building from Source

#### Dependencies

- none

#### Building

This package doesn't need to build.Clone the latest version from this repository into your catkin workspace.

## Usage

Double-click directly to run the corresponding script.

## Launch files

* **sentry.launch:** launch the codes of sentry

* **start.launch:**launch the codes of robots except sentry

## Scripts

### Set Can automatically

The following scripts automatically set can bus.

#### AutoSetCan.service

* It should be placed in a specific folder.When Ubuntu boot,It will be executed by the system.

#### AutoSetCan.sh

- It set can bus,it also should be placed in a specific folder.System will execute it automatically so you  don't need to run it.

#### create_auto_set_can_service.sh

* Double click to run it,and it will place AutoSetCan.service and AutoSetCan.sh in correct folder.

### Run all  codes on robot

The following scripts run all codes on  robot.

#### start_master.service

- It should be placed in a specific folder.When Ubuntu boot,It will be executed by the system.

#### start_master.sh

- It run rosmaster,it also should be placed in a specific folder.System will execute it automatically so you  don't need to run it.

#### rm_start.service

- It should be placed in a specific folder.When Ubuntu boot,It will be executed by the system.

#### rm_start.sh

- It run launch file to run all codes on robots,it also should be placed in a specific folder.System will execute it automatically so you  don't need to run it.

#### create_rm_start_service.sh

- Double click to run it,and it will place above four scripts in correct folders.

#### delete_rm_start_service.sh

- Double click to run it,and it will delete above four scripts in their folders.

### create_udev_rules.sh

- Double click to run it.

### delete_udev_rules.sh

- Double click to run it.

## Bugs & Feature Requests

Please report bugs and request features using the [Issue Tracker](https://github.com/gdut-dynamic-x/rm_template/issues)
.


[ROS]: http://www.ros.org

[rviz]: http://wiki.ros.org/rviz

[Eigen]: http://eigen.tuxfamily.org

[std_srvs/Trigger]: http://docs.ros.org/api/std_srvs/html/srv/Trigger.html

[sensor_msgs/Temperature]: http://docs.ros.org/api/sensor_msgs/html/msg/Temperature.html
