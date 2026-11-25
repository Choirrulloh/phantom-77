#!/bin/bash
set -e

echo "Registering PHANTOM-77 Device Tree..."
mkdir -p openwrt/target/linux/ramips/dts/
cp phantom-77.dts openwrt/target/linux/ramips/dts/rt5350_phantom-77.dts
cp phantom-77.dts openwrt/target/linux/ramips/dts/phantom-77.dts

echo "Registering PHANTOM-77 in rt305x.mk..."
cat >> openwrt/target/linux/ramips/image/rt305x.mk << 'EOF'

define Device/phantom-77
  SOC := rt5350
  IMAGE_SIZE := 3776k
  UIMAGE_NAME := Linux Kernel Image
  DEVICE_VENDOR := PHANTOM
  DEVICE_MODEL := 77
  DEVICE_PACKAGES := kmod-rt2800-soc
  SUPPORTED_DEVICES += phantom-77 tenda,3g150b
endef
TARGET_DEVICES += phantom-77
EOF

echo "Registering PHANTOM-77 in rt305x 02_network..."
if [ -f openwrt/target/linux/ramips/rt305x/base-files/etc/board.d/02_network ]; then
  sed -i 's/tenda,3g150b|\\/phantom,77|\\\n\ttenda,3g150b|\\/g' openwrt/target/linux/ramips/rt305x/base-files/etc/board.d/02_network
fi

echo "Device registered successfully!"
