#!/bin/bash

echo "modify default.prop..."
sed -i 's/#persist.sys.usb.config=adb/persist.sys.usb.config=adb/i' devprod/device/tpvision/mtk_common/configs/default.prop 
echo $1

echo "modify adb_net.sh..."
sed -i 's/#stop adbd/stop adbd/i' devprod/device/tpvision/mtk_common/configs/script/adb_net.sh
echo $1
sed -i 's/#start adbd/start adbd/i' devprod/device/tpvision/mtk_common/configs/script/adb_net.sh
echo $1

echo "modify adb_usb.sh..."
sed -i 's/#setprop persist.sys.usb.config adb/setprop persist.sys.usb.config adb/i' devprod/device/tpvision/mtk_common/configs/script/adb_usb.sh
echo $1
sed -i 's/#stop adbd/stop adbd/i' devprod/device/tpvision/mtk_common/configs/script/adb_usb.sh
echo $1
sed -i 's/#start adbd/start adbd/i' devprod/device/tpvision/mtk_common/configs/script/adb_usb.sh
echo $1
