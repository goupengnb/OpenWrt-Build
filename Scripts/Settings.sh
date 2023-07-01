#!/bin/bash

#删除冲突插件
rm -rf $(find ./feeds/luci/ -type d -regex ".*\(argon\|design\|openclash\).*")
#修改默认主题
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
#修改默认IP地址
sed -i "s/192\.168\.[0-9]*\.[0-9]*/$OpenWrt_IP/g" ./package/base-files/files/bin/config_generate
#修改默认主机名
sed -i "s/hostname='.*'/hostname='$OpenWrt_NAME'/g" ./package/base-files/files/bin/config_generate
#修改默认时区
sed -i "s/timezone='.*'/timezone='CST-8'/g" ./package/base-files/files/bin/config_generate
sed -i "/timezone='.*'/a\\\t\t\set system.@system[-1].zonename='Asia/Shanghai'" ./package/base-files/files/bin/config_generate
#首次开机后重启
#sed -i "3i\sleep 100 && reboot\nsed -i \'3,4d\' /etc/rc.local" ./package/base-files/files/etc/rc.local
#TTYD自动登录 
#sed -i 's/\/bin\/login/\/bin\/login -f root/' ./feeds/packages/utils/ttyd/files/ttyd.config
#调整TTYD到服务菜单
#sed -i 's/system/services/g' ./feeds/luci/applications/luci-app-ttyd/luasrc/controller/terminal.lua
#取消对samba4的菜单调整 
#sed -i '/samba4/s/^/#/' package/lean/default-settings/files/zzz-default-settings
#清除默认密码password
#sed -i '/V4UetPzk$CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings
#修改R5C leds配置
sed -i '/r5c/{n;n;n;i \    ucidef_set_led_netdev "wlan" "WLAN" "green:wlan" "wlan0"
}' target/linux/rockchip/armv8/base-files/etc/board.d/01_leds
#编译6.1内核
sed -i 's/5.15/6.1/g' ./target/linux/rockchip/Makefile
#加入编译作者信息
sed -i "s/OpenWrt /GouPeng Build @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
#修改ssh登录信息
>package/base-files/files/etc/banner
echo -e ' ██████╗  ██████╗ ██╗   ██╗██████╗ ███████╗███╗   ██╗ ██████╗ ' >> package/base-files/files/etc/banner
echo -e '██╔════╝ ██╔═══██╗██║   ██║██╔══██╗██╔════╝████╗  ██║██╔════╝ ' >> package/base-files/files/etc/banner
echo -e '██║  ███╗██║   ██║██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║  ███╗' >> package/base-files/files/etc/banner
echo -e '██║   ██║██║   ██║██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║' >> package/base-files/files/etc/banner
echo -e '╚██████╔╝╚██████╔╝╚██████╔╝██║     ███████╗██║ ╚████║╚██████╔╝' >> package/base-files/files/etc/banner
echo -e ' ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ \n' >> package/base-files/files/etc/banner
#根据源码来修改
if [[ $OpenWrt_URL == *"lede"* ]] ; then
  #修改默认时间格式
  sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S %A")/g' $(find ./package/*/autocore/files/ -type f -name "index.htm")
fi
