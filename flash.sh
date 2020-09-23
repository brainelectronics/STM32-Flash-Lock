# define path to scripts and other files
export OPENOCD_SCRIPTS_PATH=/usr/share/openocd/
export OPENOCD_SCRIPTS_PATH=/Applications/OpenOCD/

# define path to application
# export OPENOCD_PATH=/usr/bin/openocd
export OPENOCD_PATH=${OPENOCD_SCRIPTS_PATH}/bin/

# specify the serial id of the ST Link to use
# get available ST Link serials via $ st-info --serial
export ST_LINK_SERIAL_ID=303030303030303030303031

# define address for flashing
export FLASH_START_ADDRESS=0x08000000
export FLASH_LENGTH_STM32F103=0x10000
export FLASH_BOOTLOADER_OFFSET=0x0000

# define target file
export TARGET_FILE=$1
# export TARGET_FILE=file-name.bin

# choose the stlink cfg file accoring to the VID collected by $ lsusb
# be aware that only the last digit differs for v2 compared to v2-1
${OPENOCD_PATH}/openocd \
    -f ${OPENOCD_SCRIPTS_PATH}/scripts/interface/stlink-v2.cfg \
    -f ${OPENOCD_SCRIPTS_PATH}/scripts/target/stm32f1x.cfg \
    -c "program ${TARGET_FILE} ${FLASH_START_ADDRESS} verify reset exit" \
    $2
