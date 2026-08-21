### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
properties() { '
kernel.string=NetErnels + SukiSU-Ultra + SUSFS for Redmi Note 10 (mojito/sunny)
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=mojito
device.name2=sunny
device.name3=mojito_global
device.name4=sunny_global
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

### AnyKernel install
block=/dev/block/bootdevice/by-name/boot;
# This device is slot-based: PixelOS recovery reports "Active slot: a", so the
# real partition is boot_a/boot_b. "auto" detects the active slot and appends
# the suffix (ak3-core setup_ak), while still working on a non-slot device -
# unlike "1", which aborts when no slot is found.
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

. tools/ak3-core.sh;

# Kernel only: split the existing boot image, swap in our Image and repack.
# The ramdisk is left untouched, and no dtb/dtbo is shipped, so the device
# keeps the ones PixelOS installed.
split_boot;
flash_boot;
## end install
