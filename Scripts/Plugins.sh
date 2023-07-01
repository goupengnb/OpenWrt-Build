#!/bin/bash

#Argon Theme
git clone --depth=1 --single-branch --branch $(echo $OpenWrt_URL | grep -iq "lede" && echo "18.06" || echo "master") https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth=1 --single-branch git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git luci-app-argon-config
#Pass Wall 
git clone --depth=1 --single-branch --branch "luci" https://github.com/xiaorouji/openwrt-passwall.git ./pw_luci 
git clone --depth=1 --single-branch --branch "packages" https://github.com/xiaorouji/openwrt-passwall.git ./pw_packages
#adguardhome
git clone --depth=1 --single-branch https://github.com/rufengsuixing/luci-app-adguardhome.git
#ddns-go
git clone --depth=1 --single-branch https://github.com/sirpdboy/luci-app-ddns-go.git ./package/ddns-go