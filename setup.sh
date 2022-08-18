#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /etc/xray
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
echo "Masukkan Domain Anda, Jika Anda Tidak Memiliki Domain Klik Enter"
echo "Ketikkan Perintah newhost setelah proses instalasi Script Selesai"
read -p "Hostname / Domain: " host
echo "IP="$host >> /var/lib/crot/ipvps.conf
echo "$host" >> /etc/xray/domain
#install ssh
wget https://raw.githubusercontent.com/juangustavvo/pvt/main/startcomand.sh && chmod +x startcomand.sh && sed -i -e 's/\r$//' startcomand.sh && screen -S startcomand ./startcomand.sh
#install xray
wget https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/ins-xray.sh && chmod +x ins-xray.sh && sed -i -e 's/\r$//' ins-xray.sh && screen -S xray ./ins-xray.sh
# Trojango
wget https://raw.githubusercontent.com/juangustavvo/pvt/main/trojango/ins-trojango.sh && chmod +x ins-trojango.sh && sed -i -e 's/\r$//' ins-trojango.sh && ./ins-trojango.sh
#install trojan
#wget https://raw.githubusercontent.com/juangustavvo/pvt/main/trojan/xray-trojan.sh && chmod +x xray-trojan.sh && sed -i -e 's/\r$//' xray-trojan.sh && screen -S trojan ./xray-trojan.sh
# install xray grpc
wget https://raw.githubusercontent.com/juangustavvo/pvt/main/grpc/grpc.sh && chmod +x grpc.sh && sed -i -e 's/\r$//' grpc.sh && screen -S grpc ./grpc.sh
#
#install websocket
wget https://raw.githubusercontent.com/juangustavvo/pvt/main/websocket/edu.sh && chmod +x edu.sh && sed -i -e 's/\r$//' edu.sh && screen -S websocket ./edu.sh
#
#install slowdns
wget https://raw.githubusercontent.com/juangustavvo/pvt/main/DNS/install-sldns && chmod +x install-sldns && sed -i -e 's/\r$//' install-sldns && screen -S slowdns ./install-sldns


rm -f /root/startcomand.sh
rm -f /root/ins-xray.sh
rm -f /root/ins-trojango.sh
#rm -f /root/xray-trojan.sh
rm -f /root/grpc.sh
rm -f /root/edu.sh
rm -f /root/install-sldns
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, 2253"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 445"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 8880"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC        : 80"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC        : 2080"  | tee -a log-install.txt
echo "   - CloudFront Websocket    : "  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 2082"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - TrojanGo                : 2087"  | tee -a log-install.txt
echo "   - SLOWDNS                 : 2222"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
