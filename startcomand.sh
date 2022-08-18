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
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
# ==================================================

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=www.jagoanneon-premium.me
organizationalunit=www.jagoanneon-premium.me
commonname=www.jagoanneon-premium.me
email=admin@jagoanneon-premium.me

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/juangustavvo/pvt/main/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl
apt -y install net-tools

# Install Requirements Tools
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile
echo "echo SELAMAT DATANG DI AUTOSCRIPT PREMIUM" >> .profile
echo "echo SCRIPT PREMIUM BY JAGOANNEON" >> .profile
echo "echo CONTACT PERSON WHATSAPP : wa.me/+6283857684916" >> .profile
echo "echo Ketik menu Untuk Menampilkan Daftar Perintah..." >> .profile


# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/juangustavvo/pvt/main/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/juangustavvo/pvt/main/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/juangustavvo/pvt/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500


# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 2253' /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
echo "Port 42" >> /etc/ssh/sshd_config
/etc/init.d/ssh restart

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 1153"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# Install SSLH
apt -y install sslh
rm -f /etc/default/sslh

# Settings SSLH
cat > /etc/default/sslh <<-END
# Default options for sslh initscript
# sourced by /etc/init.d/sslh

# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "man sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)

RUN=yes

# binary to use: forked (sslh) or single-thread (sslh-select) version
# systemd users: don't forget to modify /lib/systemd/system/sslh.service
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssl 127.0.0.1:777 --ssh 127.0.0.1:109 --openvpn 127.0.0.1:1194 --http 127.0.0.1:8880 --pidfile /var/run/sslh/sslh.pid -n"

END

# Restart Service SSLH
service sslh restart
systemctl restart sslh
/etc/init.d/sslh restart
/etc/init.d/sslh status
/etc/init.d/sslh restart

# install squid
cd
#apt -y install squid3
#wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/juangustavvo/pvt/main/squid3.conf"
#sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install webmin
apt install webmin -y
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
/etc/init.d/webmin restart

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 445
connect = 127.0.0.1:109

[openssh]
accept = 777
connect = 127.0.0.1:443

[openvpn]
accept = 990
connect = 127.0.0.1:1194


END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/juangustavvo/pvt/main/vpn.sh && chmod +x vpn.sh && ./vpn.sh

# Ganti Banner
wget -O /etc/issue.net "https://raw.githubusercontent.com/juangustavvo/pvt/main/issue.net"

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O addhost "https://raw.githubusercontent.com/juangustavvo/pvt/main/addhost.sh"
wget -O newhost "https://raw.githubusercontent.com/juangustavvo/pvt/main/newhost.sh"
wget -O about "https://raw.githubusercontent.com/juangustavvo/pvt/main/about.sh"
wget -O info "https://raw.githubusercontent.com/juangustavvo/pvt/main/info.sh"
wget -O wbmn "https://raw.githubusercontent.com/juangustavvo/pvt/main/webmin.sh"
wget -O menu "https://raw.githubusercontent.com/juangustavvo/pvt/main/menu.sh"
wget -O addssh "https://raw.githubusercontent.com/juangustavvo/pvt/main/addssh.sh"
wget -O delssh "https://raw.githubusercontent.com/juangustavvo/pvt/main/delssh.sh"
wget -O member "https://raw.githubusercontent.com/juangustavvo/pvt/main/member.sh"
wget -O delexp "https://raw.githubusercontent.com/juangustavvo/pvt/main/delexp.sh"
wget -O cekssh "https://raw.githubusercontent.com/juangustavvo/pvt/main/cekssh.sh"
wget -O renewssh "https://raw.githubusercontent.com/juangustavvo/pvt/main/renewssh.sh"
wget -O trial "https://raw.githubusercontent.com/juangustavvo/pvt/main/trial/trial.sh"
wget -O trial-ssh "https://raw.githubusercontent.com/juangustavvo/pvt/main/trial/trial-ssh.sh"
wget -O trial-vmess "https://raw.githubusercontent.com/juangustavvo/pvt/main/trial/trial-vmess.sh"
wget -O trial-vless "https://raw.githubusercontent.com/juangustavvo/pvt/main/trial/trial-vless.sh"
wget -O trial-trojan "https://raw.githubusercontent.com/juangustavvo/pvt/main/trial/trial-trojan.sh"
wget -O trial-trojango "https://raw.githubusercontent.com/juangustavvo/pvt/main/trial/trial-trojango.sh"
wget -O trial-grpc "https://raw.githubusercontent.com/juangustavvo/pvt/main/trial/trial-grpc.sh"
wget -O speedtest "https://raw.githubusercontent.com/juangustavvo/pvt/main/speedtest_cli.py"
wget -O restart "https://raw.githubusercontent.com/juangustavvo/pvt/main/restart.sh"
wget -O autokill "https://raw.githubusercontent.com/juangustavvo/pvt/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/juangustavvo/pvt/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/juangustavvo/pvt/main/tendang.sh"
wget -O clearlog "https://raw.githubusercontent.com/juangustavvo/pvt/main/clearlog.sh"
wget -O xp "https://raw.githubusercontent.com/juangustavvo/pvt/main/xp.sh"
wget -O addvmess "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/addv2ray.sh"
wget -O addvless "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/addvless.sh"
wget -O addtrojan "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/addtrojan.sh"
wget -O delvmess "https://https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/delv2ray.sh"
wget -O delvless "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/delvless.sh"
wget -O deltrojan "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/deltrojan.sh"
wget -O cekvmess "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/cekv2ray.sh"
wget -O cekvless "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/cekvless.sh"
wget -O cektrojan "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/cektrojan.sh"
wget -O renewvmess "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/renewv2ray.sh"
wget -O renewvless "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/renewvless.sh"
wget -O renewtrojan "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/renewtrojan.sh"
wget -O certv2ray "https://raw.githubusercontent.com/juangustavvo/pvt/main/xray/certv2ray.sh"
wget -O addtrgo "https://raw.githubusercontent.com/juangustavvo/pvt/main/trojango/addtrgo.sh"
wget -O addtrojanws "https://raw.githubusercontent.com/juangustavvo/pvt/main/trojango/addtrojanfull.sh"
wget -O deltrgo "https://raw.githubusercontent.com/juangustavvo/pvt/main/trojango/deltrgo.sh"
wget -O renewtrgo "https://raw.githubusercontent.com/juangustavvo/pvt/main/trojango/renewtrgo.sh"
wget -O cektrgo "https://raw.githubusercontent.com/juangustavvo/pvt/main/trojango/cektrgo.sh"
wget -O running "https://raw.githubusercontent.com/juangustavvo/pvt/main/running.sh"
wget -O sslh-fix "https://raw.githubusercontent.com/juangustavvo/pvt/main/sslh/sslh-fix"

chmod +x addhost
chmod +x newhost
chmod +x menu
sed -i -e 's/\r$//' menu
chmod +x member
sed -i -e 's/\r$//' member
chmod +x delexp
sed -i -e 's/\r$//' delexp
chmod +x addssh
sed -i -e 's/\r$//' addssh
chmod +x delssh
sed -i -e 's/\r$//' delssh
chmod +x cekssh
sed -i -e 's/\r$//' cekssh
chmod +x renewssh
sed -i -e 's/\r$//' renewssh
chmod +x trial
sed -i -e 's/\r$//' trial
chmod +x trial-ssh
sed -i -e 's/\r$//' trial-ssh
chmod +x trial-vmess
sed -i -e 's/\r$//' trial-vmess
chmod +x trial-vless
sed -i -e 's/\r$//' trial-vless
chmod +x trial-trojan
sed -i -e 's/\r$//' trial-trojan
chmod +x trial-trojango
sed -i -e 's/\r$//' trial-trojango
chmod +x trial-grpcc
sed -i -e 's/\r$//' trial-grpcc
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x restart
chmod +x clearlog
chmod +x wbmn
chmod +x xp
chmod +x addvmess
sed -i -e 's/\r$//' addvmess
chmod +x addvless
sed -i -e 's/\r$//' addvless
chmod +x addtrojan
sed -i -e 's/\r$//' addtrojan
chmod +x delvmess
sed -i -e 's/\r$//' delvmess
chmod +x delvless
sed -i -e 's/\r$//' delvless
chmod +x deltrojan
sed -i -e 's/\r$//' deltrojan
chmod +x cekvmess
sed -i -e 's/\r$//' cekvmess
chmod +x cekvless
sed -i -e 's/\r$//' cekvless
chmod +x cektrojan
sed -i -e 's/\r$//' cektrojan
chmod +x renewvmess
sed -i -e 's/\r$//' renewvmess
chmod +x renewvless
sed -i -e 's/\r$//' renewvless
chmod +x renewtrojan
sed -i -e 's/\r$//' renewtrojan
chmod +x certv2ray
sed -i -e 's/\r$//' certv2ray
chmod +x addtrgo
sed -i -e 's/\r$//' addtrgo
chmod +x addtrojanws
sed -i -e 's/\r$//' addtrojanws
chmod +x deltrgo
sed -i -e 's/\r$//' deltrgo
chmod +x renewtrgo
sed -i -e 's/\r$//' renewtrgo
chmod +x cektrgo
sed -i -e 's/\r$//' cektrgo
chmod +x sslh-fix
sed -i -e 's/\r$//' sslh-fix
chmod +x running

echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
echo "0 1 * * * root delexp" >> /etc/crontab
echo "10 4 * * * root clearlog && sslh-fix-reboot" >> /etc/crontab
echo "0 0 * * * root clearlog && reboot" >> /etc/crontab
echo "0 12 * * * root clearlog && reboot" >> /etc/crontab
echo "0 18 * * * root clearlog && reboot" >> /etc/crontab


# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/stunnel4 restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/sslh restart
/etc/init.d/vnstat restart
/etc/init.d/fail2ban restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/startcomand.sh

# finihsing
clear
