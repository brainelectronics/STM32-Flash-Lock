# define path to scripts
# export OPENOCD_SCRIPTS_PATH=/usr/share/openocd/
export OPENOCD_SCRIPTS_PATH=/Applications/OpenOCD/

# define path to application
# export OPENOCD_PATH=/usr/bin/openocd
export OPENOCD_PATH=${OPENOCD_SCRIPTS_PATH}/bin/

# specify the serial id of the ST Link to use
# get available ST Link serials via $ st-info --serial
export ST_LINK_SERIAL_ID=303030303030303030303031

# choose the stlink cfg file accoring to the VID collected by $ lsusb
# be aware that only the last digit differs for v2 compared to v2-1
${OPENOCD_PATH}/openocd \
    -f ${OPENOCD_SCRIPTS_PATH}/scripts/interface/stlink-v2.cfg \
    -f ${OPENOCD_SCRIPTS_PATH}/scripts/target/stm32f1x.cfg \
    -c "init" \
    -c "reset halt" \
    -c "stm32f1x unlock 0" \
    -c "reset halt" \
    -c "exit" \
    $1
