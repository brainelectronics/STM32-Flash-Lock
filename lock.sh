# define path to scripts and other files
export OPENOCD_PATH=/usr/share/openocd

# specify the serial id of the ST Link to use
# get available ST Link serials via $ st-info --serial
export ST_LINK_SERIAL_ID=303030303030303030303031
#export ST_LINK_SERIAL_ID=000000000000000000000001

# choose the stlink cfg file accoring to the VID collected by $ lsusb
# be aware that only the last digit differs for v2 compared to v2-1
openocd \
    -d3 \
    -f ${OPENOCD_PATH}/scripts/interface/stlink-v2.cfg \
    -f ${OPENOCD_PATH}/scripts/target/stm32f1x.cfg \
    -c "init" \
    -c "reset halt" \
    -c "stm32f1x lock 0" \
    -c "reset run" \
    -c "exit"