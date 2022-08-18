#!/bin/bash
WKT=$(curl -s ipinfo.io/timezone )
clear
figlet -f small SEDANG PROSES OM HARAP BERSABAR | lolcat
sleep 2

figlet -f small JAGOANNEON AUTOSCRIPTSSH | lolcat

figlet -f small JVG AUTOSCRIPTSSH | lolcat

sleep 1
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━ Menu ━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* menu              : Menampilkan Daftar Perintah" | lolcat
echo -e "* Attention         : Silahkan Ketik Perintah Sesuai Dengan List Di Menu" | lolcat
echo -e "* Lokasimu          : $WKT " | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━ TRIAL-VPN ━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* trial-ssh         : Membuat Trial Akun SSH" | lolcat
echo -e "* trial-vmess       : Membuat Trial Akun Vmess" | lolcat
echo -e "* trial-vless       : Membuat Trial Akun Vless" | lolcat
echo -e "* trial-trojan      : Membuat Trial Akun trojan" | lolcat
echo -e "* trial-trojango    : Membuat Trial Akun trojan-go" | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━ SSH-OVPN ━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addssh            : Membuat Akun SSH" | lolcat
echo -e "* delssh            : Menghapus Akun SSH Secara Paksa" | lolcat
echo -e "* delexp            : Menghapus Akun SSH Yang Sudah EXP" | lolcat
echo -e "* member            : Cek Member SSH" | lolcat
echo -e "* cekssh            : Cek User Login SSH" | lolcat
echo -e "* renewssh          : Memperpanjang Akun SSH" | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━ TROJAN-GO ━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addtrgo           : Membuat Akun Trojan-GO" | lolcat
echo -e "* deltrgo           : Menghapus Akun Trojan-GO" | lolcat
echo -e "* cektrgo           : Cek User Login Trojan-GO" | lolcat
echo -e "* renewtrgo         : Memperpanjang Masa Aktif Akun Trojan-GO" | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━ VMESS ━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addvmess          : Membuat Akun V2RAY Vmess Websocket" | lolcat
echo -e "* delvmess          : Menghapus Akun V2RAY Vmess Websocket" | lolcat
echo -e "* renewvmess        : Memperpanjang Masa Aktif Akun Vmess" | lolcat
echo -e "* cekvmess          : Cek User Login V2RAY" | lolcat
echo -e "* cert2vray         : Memperbarui Sertifikat Akun V2RAY [Apabila Ganti Domain]" | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━ VLESS ━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addvless          : Membuat Akun V2RAY Vless Websocket" | lolcat
echo -e "* delvless          : Menghapus Akun V2RAY Vless Websocket" | lolcat
echo -e "* renewvless        : Memperpanjang Masa Aktif Akun Vless" | lolcat
echo -e "* cekvless          : Cek User Login V2RAY" | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━ Trojan ━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addtrojan         : MEMBUAT Akun Trojan" | lolcat
echo -e "* deltrojan         : Menghapus Akun Trojan" | lolcat
echo -e "* renewtrojan       : Memperpanjang Masa Aktif Trojan" | lolcat
echo -e "* cektrojan.        : Cek User Login Trojan" | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━ SYSTEM ━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addhost      : Mengganti Domain [Bagi yang memiliki domain]" | lolcat
echo -e "* newhost      : Menambahkan Subdomain Baru [Bagi Yang Tidak Memilki Domain]" | lolcat
echo -e "* ram          : Cek Penggunaan Ram Dari Vps" | lolcat
echo -e "* reboot       : Reboot VPS" | lolcat
echo -e "* speedtest    : Speedtest VPS" | lolcat
echo -e "* info         : Menampilkan Informasi Vps" | lolcat
echo -e "* vnstat       : Menampilkan Penggunaan Bandwidth Vps" | lolcat
echo -e "* about        : Info Script Auto Install" | lolcat
echo -e "* exit         : Logout Dari VPS " | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "AutoScript By JAGOANNEON" | lolcat
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
