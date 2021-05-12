# define path to scripts and other files
OPENOCD_PATH=/usr/share/openocd

# specify the serial id of the ST Link to use
# get available ST Link serials via $ st-info --serial
ST_LINK_SERIAL_ID=303030303030303030303031

# define address for flashing
FLASH_START_ADDRESS=0x08000000
FLASH_LENGTH_STM32F103=0x10000
FLASH_BOOTLOADER_OFFSET=0x0000

# define target file
TARGET_FILE=$1
# TARGET_FILE=file-name.bin

# choose the stlink cfg file accoring to the VID collected by $ lsusb
# be aware that only the last digit differs for v2 compared to v2-1
${OPENOCD_PATH}/bin/openocd \
    -f ${OPENOCD_PATH}/scripts/interface/stlink-v2.cfg \
    -f ${OPENOCD_PATH}/scripts/target/stm32f1x.cfg \
    -c "program ${TARGET_FILE} ${FLASH_START_ADDRESS} verify reset exit" \
    $2
