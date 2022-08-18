#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Izin Akses
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
sleep 1
echo "Cek Izin Akses Script"

IZIN=$( curl https://raw.githubusercontent.com/juangustavvo/lohe/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${GREEN}Akses Di Izinkan...${NC}"
else
echo -e "${RED}VPS tidak diijinkan${NC}";
echo "Kontak Admin Untuk Mendapatkan Akses Script"
echo "Facebook   : Generasi Jvg Tuban"
echo "WhatsApp   : 083857684916"
exit 0
fi
clear
read -rp "Domain/Host : " -e domain
echo "IP=$domain" >>/var/lib/crot/ipvps.conf
rm -rf /etc/xray/domain
echo $domain > /etc/xray/domain
certv2ray
