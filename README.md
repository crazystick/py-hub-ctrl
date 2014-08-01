py-hub-ctrl
===========

Hub control in Python

This is pulled out of the Gnuk utility by Free Software Initiative of Japan, and updated for PyUsb 1.0

The following command will turn off the power on port 3 of the hub - it assumes that the hub is device 6 on bus 1, this will be different depending on what else is plugged in and is not stable, it changes each time you replug the hub, so you’ll have to figure it out with a lsusb.

```sudo ./hub_ctrl.py -b 1 -d 6 -P 3 -p 0 -v```

You can turn it back on with 

```sudo ./hub_ctrl.py -b 1 -d 6 -P 3 -p 1 -v```

You can also control the hub LEDs using the command 

```sudo ./hub_ctrl.py -b 1 -d 6 -l 1 -P 1 -v```

should illuminate the indicator light for port 1.

Observations
------------

It seems like it only disconnects the power, not the data line, and so for anything which doesn’t go into a suspend state the kernel will immediately detect a device and turn the power back on. For devices which do suspend (like webcams) they stay in the USB bus, but the next time you try to use them they will be reset as they attempt to draw power over the disabled power line.

