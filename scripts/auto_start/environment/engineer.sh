#!/bin/bash
# Modifier following environment variable when deploy robot.
# basic
export HAS_SWITCH=no
export ROBOT_TYPE=engineer
export LAUNCH=engineer
# camera
export CAMERA_TYPE=hk_camera
export CAMERA_CLASS=HKCameraNodelet
export MVCAM_SDK_PATH=/opt/MVS
export MVCAM_COMMON_RUNENV=/opt/MVS/lib
export LD_LIBRARY_PATH=/opt/MVS/lib/64:/opt/MVS/lib/32:$LD_LIBRARY_PATH