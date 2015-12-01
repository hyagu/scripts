#!/bin/bash

echo "edit adb ----"
ROOT=/extspace/HTV/2K15_L/devprod
DEFAULT=$ROOT/device/tpvision/mtk_common/configs/default.prop
ADBNET=$ROOT/device/tpvision/mtk_common/configs/script/adb_net.sh
ADBUSB=$ROOT/device/tpvision/mtk_common/configs/script/adb_usb.sh

echo "	edit $DEFAULT"
sed -i 's/#persist.sys.usb.config=adb/persist.sys.usb.config=adb/g' $DEFAULT

echo "	edit $ADBNET"
sed -i 's/#stop adbd/stop adbd/g' $ADBNET
sed -i 's/#start adbd/start adbd/g' $ADBNET

echo "	edit $ADBUSB"
sed -i 's/$(getprop persist.sys.usb.config) = adb/1/g' $ADBUSB

echo "edit adb ---- end"
