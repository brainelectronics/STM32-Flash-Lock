#!/bin/bash
# title         :general_un_lock_st.sh
# description   :Lock or unlock a specified target
# author        :brainelectronics
# date          :20210607
# version       :0.1.0
# usage         :sh un_lock_st.sh /Applications/OpenOCD/bin/openocd \
#               :   /Applications/OpenOCD/scripts stlink-v2 stm32f1x lock
# notes         :Install openocd to use this script.
# bash_version  :3.2.53(1)-release
#==============================================================================

# define path to scripts and other files
openocd_exe=$1

# define path to application
openocd_scripts_path=$2

# interface to interact with target, e.g. stlink-v2
interface_cfg=$3

# target family, e.g. stm32f0x, stm32f1x, stm32f3x
target=$4

# type of action, e.g. lock or unlock
action_type=$5

# choose the stlink cfg file accoring to the VID collected by $ lsusb
# be aware that only the last digit differs for v2 compared to v2-1
$openocd_exe \
    -f $openocd_scripts_path/interface/$interface_cfg.cfg \
    -f $openocd_scripts_path/target/$target.cfg \
    -c "init" \
    -c "reset halt" \
    -c "$target $action_type 0" \
    -c "reset run" \
    -c "exit"
