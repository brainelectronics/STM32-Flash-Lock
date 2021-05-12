# Flash and Lock STM32 devices

Bare minimum scripts to lock or unlock STM32 devices

---------------

## Tools

Install the following tools on your system.

### Openocd

*used version 0.10.0*

#### Linux

```bash
sudo apt-get install openocd
```

#### Mac

See [xpack OpenOCD Installation instructions](https://xpack.github.io/openocd/install/)
or download latest released version, unzip it and change its rights.

```bash
wget https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-darwin-x64.tar.gz
tar -zxvf xpack-openocd-0.10.0-14-darwin-x64.tar.gz
chmod -R -w xpack-openocd-0.10.0-14-darwin-x64
```

Move the files into your applications folder and create a symlink to use it
with the same commands as on linux

```bash
sudo ln -s /Volumes/Macintosh\ HD/Applications/OpenOCD/ /usr/share/openocd
```

### telnet

```bash
sudo apt-get install telnet
```

## General

### Run openocd with telnet

Call this in first terminal

```bash
openocd -d3 -f stlink-v2.cfg -c "transport select hla_swd" -f stm32f1x.cfg
```

open second terminal

```bash
telnet 127.0.0.1 4444
```

### Programming with scripts

If the chip is locked, it can't be programmed until it is unlocked.

A power cycle is required after locking the chip to run the program.

Unlocking the chip will erase it's content completly.

#### Config

Config files for STLink are located at `/usr/share/openocd/scripts/interface/`,
config for targets can be found at ` /usr/share/openocd/scripts/target/`.

Be aware of different STLink versions, which only differ in one single char of VID.

#### Flashing

```bash
sh flash.sh path/to/some/file.bin
```

Flash a file with debug level 1

```bash
sh flash.sh path/to/some/file.bin -d1
```

#### Locking

```bash
sh lock.sh
```

Perform lock with debug level 2

```bash
sh lock.sh -d2
```

#### Unlocking

```bash
sh unlock.sh
```

Perform unlock with debug level 1

```bash
sh unlock.sh -d1
```

#### Power cycle (only on raspberry)
Power cycle the target by using a raspberry pi pin.

Connect VCC of the debug interface via a transistor or mosfet to VCC.
The mosfet or transistor is controlled by the raspberry pi pin.

You have to run this script once to configure the pin and turn it on.

```bash
python power_cycle.py
```
