#!/bin/bash

PROJECT_ROOT=/home/ktchen/HTV/devprod
REPO_URL=ssh://url/devprod/platform/manifest
CURRENT_BRANCH=2k15_mtk_1446_1_devprod_HTV_5_249

BACKUPTO=/home/ktchen/HTV/backups
backups=("/device/tpvision/common/app/pbsserver"
	 "/device/tpvision/common/app/settings"
	 "device/tpvision/common/app/tunerservice");

#----- backup -----#
DATE=`date +%Y%m%d%H%M%S`
for i in "${backups[@]}"
do
    echo "backup $i"
    mkdir -p $BACKUPTO/$DATE
    cp -r $PROJECT_ROOT$i $BACKUPTO/$DATE 
done

#----- clean -----#
echo "clean $PROJECT_ROOT"
cd $PROJECT_ROOT
rm -rf *
rm -rf *.repo

repo init -u $REPO_URL -b $CURRENT_BRANCH
repo sync --current-branch

source build/envsetup.sh
lunch philips_MT5593F_HE-userdebug
export TPVISION_ANDROID_CONSOLE_ENABLED=1
make DM_VERITY=false -j8 mtk_clean

sh ../EditAdb.sh

make DM_VERITY=false GMS_ENABLE=true ADB_ENABLE=true -j32 mtk_build 2>&1 | tee make.log
