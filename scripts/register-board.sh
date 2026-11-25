#!/bin/bash
set -e

echo "Registering PHANTOM-77 Device Tree..."
mkdir -p openwrt/target/linux/ramips/dts/rt305x/
cp phantom-77.dts openwrt/target/linux/ramips/dts/rt305x/phantom-77.dts || true
cp phantom-77.dts openwrt/target/linux/ramips/dts/phantom-77.dts || true

echo "Registering PHANTOM-77 in rt305x.mk..."
cat >> openwrt/target/linux/ramips/image/rt305x.mk << 'EOF'

define Device/phantom-77
  SOC := rt5350
  IMAGE_SIZE := 3776k
  DEVICE_VENDOR := PHANTOM
  DEVICE_MODEL := 77
  DEVICE_PACKAGES := kmod-rt2800-soc
endef
TARGET_DEVICES += phantom-77
EOF

echo "Device registered successfully!"
