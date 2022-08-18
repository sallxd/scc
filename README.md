# Beta Script
# Update dulu Bor

<img src="https://img.shields.io/badge/Update%20Upgrade-red"> 

```html
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot
```

# Install Semua Layanan VPN /Install All VPN Service
  <img src="https://img.shields.io/badge/Install_Semua_Layanan_VPN%20Batch-red">

```html

rm -f setup.sh && apt update && apt upgrade -y && update-grub && sleep 2 && apt-get update -y && apt-get upgrade && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/juangustavvo/pvt/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```

### Fitur Script
• SSH/OVPN

• WEBSOCKET/CDN

• XRAY VMESS 

• XRAY VLESS

• XRAY TROJAN

• XRAY VMESS GRPC

• XRAY VLESS GRPC

• TROJAN GO


### Os Supported

• Debian 10 & 9

• Ubuntu 18.04 & 20.04
