#!/bin/sh

# 1. Hostname & Timezone
uci set system.@system[0].hostname='PHANTOM-77'
uci set system.@system[0].zonename='Asia/Jakarta'
uci set system.@system[0].timezone='WIB-7'

# 2. LAN Network config (Segment 77)
uci set network.lan.proto='static'
uci set network.lan.ipaddr='192.168.77.1'
uci set network.lan.netmask='255.255.255.0'

# 3. DHCP Pool (192.168.77.100 - 192.168.77.200)
uci set dhcp.lan.start='100'
uci set dhcp.lan.limit='100'
uci set dhcp.lan.leasetime='12h'

# 4. Wireless config (SSID: PHANTOM-77, Pass: phantom#protocol77)
uci set wireless.radio0.disabled='0'
uci set wireless.radio0.channel='auto'
uci set wireless.radio0.country='ID'

uci set wireless.default_radio0.ssid='PHANTOM-77'
uci set wireless.default_radio0.encryption='psk2'
uci set wireless.default_radio0.key='phantom#protocol77'

# Commit all changes
uci commit
exit 0
