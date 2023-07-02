#!/bin/bash

#Argon Theme
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git
#Pass Wall 
git clone --depth=1 --single-branch --branch "luci" https://github.com/xiaorouji/openwrt-passwall.git ./pw_luci 
git clone --depth=1 --single-branch --branch "packages" https://github.com/xiaorouji/openwrt-passwall.git ./pw_packages
#adguardhome
git clone --depth=1 --single-branch https://github.com/rufengsuixing/luci-app-adguardhome.git
#ddns-go
git clone --depth=1 --single-branch https://github.com/sirpdboy/luci-app-ddns-go.git