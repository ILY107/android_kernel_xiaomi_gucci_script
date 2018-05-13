#building custom kernel using unofficial source based on lollipop/marshmallow/naught/oreo. 
#same kernel source for all versions except kitkat
cd

#Tool chain

git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8

#exporting path and cross compiler

export PATH=$(pwd)/arm-eabi-4.8/bin:$PATH

export CROSS_COMPILE=$(pwd)/arm-eabi-4.8/bin/arm-eabi-

#creating an output directory

mkdir out

#cloning unoffical kernel

git clone https://github.com/Wzedlare/android_kernel_xiaomi_msm8916.git -b lineage-15.1

#Changing directory to kernel directory

cd android_kernel_xiaomi_msm8916

#Compiling kernel

make ARCH=arm O=../out mrproper

make ARCH=arm O=../out gucci_defconfig

make ARCH=arm O=../out -j4

#the final zimage (Compiled Kernel) will be in home/out/arc/arm/boot/
