# define path to scripts and other files
export OPENOCD_PATH=/usr/share/openocd

# specify the serial id of the ST Link to use
# get available ST Link serials via $ st-info --serial
export ST_LINK_SERIAL_ID=303030303030303030303031
#export ST_LINK_SERIAL_ID=000000000000000000000001

# define address for flashing
export FLASH_START_ADDRESS=0x08000000
export FLASH_LENGTH_STM32F103=0x10000
export FLASH_BOOTLOADER_OFFSET=0x0000

# define target file
export TARGET_FILE=$1
# export TARGET_FILE=Blink1kPWM-no-debug.ino.bin
# export TARGET_FILE_BOOTLOADER=bootloader_f091_0315.hex

# choose the stlink cfg file accoring to the VID collected by $ lsusb
# be aware that only the last digit differs for v2 compared to v2-1
openocd \
    -d3 \
    -f ${OPENOCD_PATH}/scripts/interface/stlink-v2.cfg \
    -f ${OPENOCD_PATH}/scripts/target/stm32f1x.cfg \
    -c "program ${TARGET_FILE} ${FLASH_START_ADDRESS} verify reset exit"

#    -c "reset halt" \
#    -c "flash write_image erase ${TARGET_FILE} ${FLASH_START_ADDRESS}" \
#    -c "reset run" \
#    -c "exit"

#    -c "transport select hla_swd"
#    -c "hla_serial ${ST_LINK_SERIAL_ID}"
#    -c "flash write_image ${TARGET_FILE} 0 ihex"
