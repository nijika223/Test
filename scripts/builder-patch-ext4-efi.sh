#!/bin/bash

echo "Start Building Patch..."
echo "Current Path: $PWD"

cd "$GITHUB_WORKSPACE/$VENDOR-imagebuilder-$VERSION-x86-64.Linux-x86_64" || exit

# Remove redundant default packages
sed -i "/luci-app-cpufreq/d" include/target.mk

# Force opkg to overwrite files
sed -i "s/install \$(BUILD_PACKAGES)/install \$(BUILD_PACKAGES) --force-overwrite/" Makefile

# Disable generating SQUASHFS images
sed -i "s/CONFIG_TARGET_ROOTFS_SQUASHFS=y/# CONFIG_TARGET_ROOTFS_SQUASHFS is not set/" .config
sed -i "s/CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=256/# CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=256 disabled/" .config

# Disable generating unnecessary archives & images
sed -i "s/CONFIG_TARGET_ROOTFS_TARGZ=y/# CONFIG_TARGET_ROOTFS_TARGZ is not set/" .config

sed -i "s/CONFIG_ISO_IMAGES=y/# CONFIG_ISO_IMAGES is not set/" .config
sed -i "s/CONFIG_QCOW2_IMAGES=y/# CONFIG_QCOW2_IMAGES is not set/" .config
sed -i "s/CONFIG_VDI_IMAGES=y/# CONFIG_VDI_IMAGES is not set/" .config
sed -i "s/CONFIG_VHDX_IMAGES=y/# CONFIG_VHDX_IMAGES is not set/" .config
sed -i "s/CONFIG_VMDK_IMAGES=y/# CONFIG_VMDK_IMAGES is not set/" .config

# Select COMBINED / COMBINED-EFI images
sed -i "s/CONFIG_GRUB_IMAGES=y/# CONFIG_GRUB_IMAGES is not set/" .config
# sed -i "s/CONFIG_GRUB_EFI_IMAGES=y/# CONFIG_GRUB_EFI_IMAGES is not set/" .config

# Adjust kernel & rootfs partition size (unit: MiB)
sed -i "s/CONFIG_TARGET_KERNEL_PARTSIZE=[0-9]\+/CONFIG_TARGET_KERNEL_PARTSIZE=32/" .config
sed -i "s/CONFIG_TARGET_ROOTFS_PARTSIZE=[0-9]\+/CONFIG_TARGET_ROOTFS_PARTSIZE=$ROOTFS_SIZE/" .config

# fix: bios boot partition is under 1 MiB
sed -i 's/256/1024/g' target/linux/x86/image/Makefile
