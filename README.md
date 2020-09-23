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

### Flashing
```bash
$ sh flash.sh path/to/some/file.bin
```

### Locking
```bash
$ sh lock.sh
```
### Unlocking
```bash
$ sh unlock.sh
```

