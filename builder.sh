#!/bin/bash

# Psychedelic Kernel Building Script

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "P S Y C H E D E L I C   B U I L D   S C R I P T" \
    --title "MENU" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select your device:" $HEIGHT $WIDTH 4 \
    "1" "MI5s" \
    "2" "MI5s Plus" \
    "3" "MI Mix" \
    "4" "MI Note 2" \
    "5" "MI 5"
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Psychedelic script terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Psychedelic script aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Psychedelic script terminated."
      ;;
    1 )
      KERNEL_DIR=$PWD
ANYKERNEL_DIR=$KERNEL_DIR/AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
CCACHEDIR=../CCACHE/capricorn
TOOLCHAINDIR=~/toolchain/aarch64-linux-android-5.3
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-capricorn-"
VER="-v0.7-"
TYPE="CM"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER""$TYPE".zip

rm $ANYKERNEL_DIR/capricorn/zImage $ANYKERNEL_DIR/capricorn/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

if [ ! -d "$TOOLCHAINDIR" ]; then
  mkdir ~/toolchain
  wget https://bitbucket.org/UBERTC/aarch64-linux-android-5.3-kernel/get/1144fd2773c1.zip -P ~/toolchain
  unzip ~/toolchain/1144fd2773c1.zip -d ~/toolchain
  mv ~/toolchain/UBERTC-aarch64-linux-android-5.3-kernel-1144fd2773c1 ~/toolchain/aarch64-linux-android-5.3
  rm ~/toolchain/1144fd2773c1.zip
fi

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=$TOOLCHAINDIR/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=$TOOLCHAINDIR/lib/
export USE_CCACHE=1
export CCACHE_DIR=$CCACHEDIR/.ccache

make clean && make mrproper
make capricorn_defconfig
make -j$( nproc --all )

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/capricorn/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/capricorn/zImage
cd $ANYKERNEL_DIR/capricorn
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
    2 )
      KERNEL_DIR=$PWD
ANYKERNEL_DIR=$KERNEL_DIR/AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
CCACHEDIR=../CCACHE/natrium
TOOLCHAINDIR=~/toolchain/aarch64-linux-android-5.3
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-natrium-"
VER="-v0.7-"
TYPE="CM"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER""$TYPE".zip

rm $ANYKERNEL_DIR/natrium/zImage $ANYKERNEL_DIR/natrium/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

if [ ! -d "$TOOLCHAINDIR" ]; then
  mkdir ~/toolchain
  wget https://bitbucket.org/UBERTC/aarch64-linux-android-5.3-kernel/get/1144fd2773c1.zip -P ~/toolchain
  unzip ~/toolchain/1144fd2773c1.zip -d ~/toolchain
  mv ~/toolchain/UBERTC-aarch64-linux-android-5.3-kernel-1144fd2773c1 ~/toolchain/aarch64-linux-android-5.3
  rm ~/toolchain/1144fd2773c1.zip
fi

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=$TOOLCHAINDIR/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=$TOOLCHAINDIR/lib/
export USE_CCACHE=1
export CCACHE_DIR=$CCACHEDIR/.ccache

make clean && make mrproper
make natrium_defconfig
make -j$( nproc --all )

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/natrium/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/natrium/zImage
cd $ANYKERNEL_DIR/natrium
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
    3 )
KERNEL_DIR=$PWD
ANYKERNEL_DIR=$KERNEL_DIR/AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
CCACHEDIR=../CCACHE/lithium
TOOLCHAINDIR=~/toolchain/aarch64-linux-android-5.3
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-lithium-"
VER="-v0.7-"
TYPE="CM"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER""$TYPE".zip

rm $ANYKERNEL_DIR/lithium/zImage $ANYKERNEL_DIR/lithium/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

if [ ! -d "$TOOLCHAINDIR" ]; then
  mkdir ~/toolchain
  wget https://bitbucket.org/UBERTC/aarch64-linux-android-5.3-kernel/get/1144fd2773c1.zip -P ~/toolchain
  unzip ~/toolchain/1144fd2773c1.zip -d ~/toolchain
  mv ~/toolchain/UBERTC-aarch64-linux-android-5.3-kernel-1144fd2773c1 ~/toolchain/aarch64-linux-android-5.3
  rm ~/toolchain/1144fd2773c1.zip
fi

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=$TOOLCHAINDIR/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=$TOOLCHAINDIR/lib/
export USE_CCACHE=1
export CCACHE_DIR=$CCACHEDIR/.ccache

make clean && make mrproper
make lithium_defconfig
make -j$( nproc --all )

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/lithium/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/lithium/zImage
cd $ANYKERNEL_DIR/lithium/
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
    4 )
KERNEL_DIR=$PWD
ANYKERNEL_DIR=$KERNEL_DIR/AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
CCACHEDIR=../CCACHE/scorpio
TOOLCHAINDIR=~/toolchain/aarch64-linux-android-5.3
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-scorpio-"
VER="-v0.7-"
TYPE="CM"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER""$TYPE".zip

rm $ANYKERNEL_DIR/scorpio/zImage $ANYKERNEL_DIR/scorpio/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

if [ ! -d "$TOOLCHAINDIR" ]; then
  mkdir ~/toolchain
  wget https://bitbucket.org/UBERTC/aarch64-linux-android-5.3-kernel/get/1144fd2773c1.zip -P ~/toolchain
  unzip ~/toolchain/1144fd2773c1.zip -d ~/toolchain
  mv ~/toolchain/UBERTC-aarch64-linux-android-5.3-kernel-1144fd2773c1 ~/toolchain/aarch64-linux-android-5.3
  rm ~/toolchain/1144fd2773c1.zip
fi

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=$TOOLCHAINDIR/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=$TOOLCHAINDIR/lib/
export USE_CCACHE=1
export CCACHE_DIR=$CCACHEDIR/.ccache

make clean && make mrproper
make scorpio_defconfig
make -j$( nproc --all )

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/scorpio/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/scorpio/zImage
cd $ANYKERNEL_DIR/scorpio
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
    5 )
KERNEL_DIR=$PWD
ANYKERNEL_DIR=$KERNEL_DIR/AnyKernel2
DTBTOOL=$KERNEL_DIR/dtbTool
CCACHEDIR=../CCACHE/gemini
TOOLCHAINDIR=~/toolchain/aarch64-linux-android-5.3
DATE=$(date +"%d%m%Y")
KERNEL_NAME="Psychedelic-Kernel"
DEVICE="-gemini-"
VER="-v0.7-"
TYPE="CM"
FINAL_ZIP="$KERNEL_NAME""$DEVICE""$DATE""$VER""$TYPE".zip

rm $ANYKERNEL_DIR/gemini/zImage $ANYKERNEL_DIR/gemini/dtb
rm $KERNEL_DIR/arch/arm64/boot/Image.gz $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb

if [ ! -d "$TOOLCHAINDIR" ]; then
  mkdir ~/toolchain
  wget https://bitbucket.org/UBERTC/aarch64-linux-android-5.3-kernel/get/1144fd2773c1.zip -P ~/toolchain
  unzip ~/toolchain/1144fd2773c1.zip -d ~/toolchain
  mv ~/toolchain/UBERTC-aarch64-linux-android-5.3-kernel-1144fd2773c1 ~/toolchain/aarch64-linux-android-5.3
  rm ~/toolchain/1144fd2773c1.zip
fi

export ARCH=arm64
export KBUILD_BUILD_USER="Psy_Man"
export KBUILD_BUILD_HOST="PsyBuntu"
export CROSS_COMPILE=$TOOLCHAINDIR/bin/aarch64-linux-android-
export LD_LIBRARY_PATH=$TOOLCHAINDIR/lib/
export USE_CCACHE=1
export CCACHE_DIR=$CCACHEDIR/.ccache

make clean && make mrproper
make gemini_defconfig
make -j$( nproc --all )

./dtbTool -s 2048 -o arch/arm64/boot/dt.img -p scripts/dtc/ arch/arm/boot/dts/qcom/
cp $KERNEL_DIR/arch/arm64/boot/dt.img $ANYKERNEL_DIR/gemini/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ANYKERNEL_DIR/gemini/zImage
cd $ANYKERNEL_DIR/gemini
zip -r9 $FINAL_ZIP * -x *.zip $FINAL_ZIP
      ;;
  esac
done
