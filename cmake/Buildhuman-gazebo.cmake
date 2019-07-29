# Copyright (C) 2018  iCub Facility, Istituto Italiano di Tecnologia
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(iDynTree QUIET)
find_or_build_package(wearables QUIET)

ycm_ep_helper(human-gazebo TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/human-gazebo.git
              TAG master
              COMPONENT human_dynamics
              FOLDER robotology)
