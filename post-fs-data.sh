#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# Set CF DNS servers address
resetprop -n net.eth0.dns1 2a10:50c0::ad1:ff
resetprop -n net.eth0.dns2 2a10:50c0::ad2:ff

resetprop -n net.dns1 2a10:50c0::ad1:ff
resetprop -n net.dns2 2a10:50c0::ad2:ff

resetprop -n net.ppp0.dns1 2a10:50c0::ad1:ff
resetprop -n net.ppp0.dns2 2a10:50c0::ad2:ff

resetprop -n net.rmnet0.dns1 2a10:50c0::ad1:ff
resetprop -n net.rmnet0.dns2 2a10:50c0::ad2:ff

resetprop -n net.rmnet1.dns1 2a10:50c0::ad1:ff
resetprop -n net.rmnet1.dns2 2a10:50c0::ad2:ff

resetprop -n net.pdpbr1.dns1 2a10:50c0::ad1:ff
resetprop -n net.pdpbr1.dns2 2a10:50c0::ad2:ff

resetprop -n 2a10:50c0::ad1:ff
resetprop -n 2a10:50c0::ad2:ff



# Edit the resolv conf file if it exist

if [ -a /system/etc/resolv.conf ]; then
	mkdir -p $MODDIR/system/etc/
	printf "nameserver 1.1.1.1\nnameserver 1.0.0.1" >> $MODDIR/system/etc/resolv.conf
	chmod 644 $MODDIR/system/etc/resolv.conf
fi