#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
 sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate
# Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
# 主题
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
# 添加自定义软件包
 echo '
 CONFIG_PACKAGE_luci-app-mosdns=y
 CONFIG_PACKAGE_luci-app-adguardhome=y
 CONFIG_PACKAGE_luci-app-openclash=y
 ' >> .config
