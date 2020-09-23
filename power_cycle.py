#!/usr/bin/env python
# -*- coding: UTF-8 -*-

"""Toggle pin of raspberry from any state to LOW, wait some time, turn it HIGH"""

import RPi.GPIO as GPIO
import time

__author__ = "brainelectronics"
__copyright__ = "Copyright 2020, brainelectronics"
__credits__ = ["brainelectronics"]
__license__ = "MIT"
__version__ = "0.1.0"
__maintainer__ = "brainelectronics"
__email__ = "info@brainelectronics.de"
__status__ = "Production"

# define which naming should be used
GPIO.setmode(GPIO.BCM)

# configure BCM pin 18 (physical pin 12) as output
GPIO.setup(18, GPIO.OUT)

# turn pin low
GPIO.output(18, False)

# wait some short time (0.5 sec)
time.sleep(0.5)

# turn pin high again
GPIO.output(18, True)
