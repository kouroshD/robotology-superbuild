# Copyright (C) 2017  iCub Facility, Istituto Italiano di Tecnologia
# Authors: Daniele E. Domenichelli <ddomenichelli@drdanz.it>, Silvio Traversaro <silvio.traversaro@iit.it>
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(ACE QUIET)
find_package(SQLite QUIET)
find_package(Eigen3 QUIET)
find_or_build_package(RTF QUIET)

if(ROBOTOLOGY_USES_PYTHON)
  set(YARP_COMPILE_BINDINGS ON)
else()
  set(YARP_COMPILE_BINDINGS OFF)
endif()

if(ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH OR ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN)
  set(ROBOTOLOGY_ENABLE_ICUB_ROBOT ON)
endif()

ycm_ep_helper(YARP TYPE GIT
                   STYLE GITHUB
                   REPOSITORY robotology/yarp.git
                   TAG master
                   COMPONENT core
                   FOLDER robotology
                   DEPENDS YCM
                           ACE
                           SQLite
                           Eigen3
                           RTF
                   CMAKE_ARGS -DCREATE_IDLS:BOOL=ON
                              -DCREATE_GUIS:BOOL=ON
                              -DYARP_USE_SYSTEM_SQLITE:BOOL=ON
                              -DCREATE_LIB_MATH:BOOL=ON
                              -DCREATE_OPTIONAL_CARRIERS:BOOL=ON
                              -DENABLE_yarpcar_bayer:BOOL=ON
                              -DENABLE_yarpcar_tcpros:BOOL=ON
                              -DENABLE_yarpcar_xmlrpc:BOOL=ON
                              -DENABLE_yarpcar_priority:BOOL=ON
                              -DENABLE_yarpcar_bayer:BOOL=ON
                              -DENABLE_yarpidl_thrift:BOOL=ON
                              -DCREATE_DEVICE_LIBRARY_MODULES:BOOL=ON
                              -DENABLE_yarpcar_human:BOOL=ON
                              -DENABLE_yarpcar_rossrv:BOOL=ON
                              -DENABLE_yarpmod_fakebot:BOOL=ON
                              -DENABLE_yarpmod_imuBosch_BNO055:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT}
                              -DYARP_COMPILE_EXPERIMENTAL_WRAPPERS:BOOL=ON
                              -DYARP_COMPILE_RTF_ADDONS:BOOL=ON
                              -DYARP_COMPILE_BINDINGS:BOOL=${YARP_COMPILE_BINDINGS}
                              -DYARP_USE_I2C:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT}
                              -DCREATE_PYTHON:BOOL=${ROBOTOLOGY_USES_PYTHON})
