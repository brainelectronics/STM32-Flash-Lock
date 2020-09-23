Flash and Lock STM32 devices

# Tools
## Openocd
```bash
$ sudo apt-get install openocd
```

used version 0.10.0

## telnet
```bash
$ sudo apt-get install telnet
```

# General
## Run openocd with telnet
Call this in first terminal

```bash
$ openocd -d3 -f stlink-v2.cfg -c "transport select hla_swd" -f stm32f1x.cfg
```

open second terminal
```bash
$ telnet 127.0.0.1 4444
```

## Programming with scripts
If the chip is locked, it can't be programmed until it is unlocked.

A power cycle is required after locking the chip to run the program.

Unlocking the chip will erase it's content completly.

### Config
Config files for STLink are located at `/usr/share/openocd/scripts/interface/`,
config for targets can be found at ` /usr/share/openocd/scripts/target/`.

Be aware of different STLink versions, which only differ in one single char of VID.

### Flashing
```bash
$ sh flash.sh path/to/some/file.bin
```

Flash a file with debug level 1

```bash
$ sh flash.sh path/to/some/file.bin -d1
```

### Locking
```bash
$ sh lock.sh
```

Perform lock with debug level 2
```bash
$ sh lock.sh -d2
```

### Unlocking
```bash
$ sh unlock.sh
```

Perform unlock with debug level 1
```bash
$ sh unlock.sh -d1
```

### Power cycle (only on raspberry)
Power cycle the target by using a raspberry pi pin.

Connect VCC of the debug interface via a transistor or mosfet to VCC. 
The mosfet or transistor is controlled by the raspberry pi pin.

You have to run this script once to configure the pin and turn it on.

```bash
$ python power_cycle.py
```
