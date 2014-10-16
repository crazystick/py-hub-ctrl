#!/bin/sh

function usage {
	echo "Usage: `basename $0` <PATH> where path is the path as reported by udevadm, e.g. 2-1.1.1 for bus 2, hub port 1, hub port 1, hub port 1"; exit 0;
}

while [ "$1" != "" ]; do
    case $1 in
		-h | --help )	usage
                            	exit
                            	;;
		* )		DEV_PATH=$1
       				;;
    esac
    shift
done

if [ -z "$DEV_PATH" ]; then
	usage; exit 1
fi

if [ -L "/sys/bus/usb/devices/$DEV_PATH" ] ; then
	udevadm info /sys/bus/usb/devices/$DEV_PATH --query=property | egrep 'DEVNUM' | sed 's/DEVNUM=//g' | sed 's/^0*//'
else
	exit 1
fi
