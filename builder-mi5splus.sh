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
