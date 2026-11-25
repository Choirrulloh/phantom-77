# PHANTOM-77 Firmware Builder 🚀

Automated GitHub Actions workflow to build a lean, optimized custom OpenWrt firmware for the **PHANTOM-77** (Ralink RT5350F, 32MB SDRAM, 4MB Flash).

### Custom Specifications:
* **Brand:** PHANTOM-77
* **LAN IP:** `192.168.77.1` (Subnet `255.255.255.0`)
* **DHCP Range:** `192.168.77.100` - `192.168.77.200`
* **Default Wi-Fi SSID:** `PHANTOM-77`
* **Default Wi-Fi Key:** `phantom#protocol77`
* **Timezone:** Asia/Jakarta (WIB)
* **Optimization:** Stripped out IPv6, PPP, and PPPoE to preserve ~400KB of precious flash storage!
* **Auto-recovery:** Automatically names binary to `Kernal.bin` for 1-click U-Boot TFTP flash!
