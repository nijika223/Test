#!/bin/bash

# 主配置名称
PROFILE="generic"

PACKAGES=""

# Argon 主题
PACKAGES+="luci-theme-argon luci-i18n-argon-config-zh-cn"

# 常用系统管理组件
PACKAGES+=" luci-i18n-diskman-zh-cn"       # Diskman 磁盘管理
# PACKAGES+=" luci-i18n-cpulimit-zh-cn"      # CPU 占用限制
PACKAGES+=" luci-i18n-statistics-zh-cn"    # collectd 统计

# 常用软件服务
PACKAGES+=" luci-i18n-passwall-zh-cn"      # Passwall
PACKAGES+=" luci-app-openclash"            # OpenClash
PACKAGES+=" luci-i18n-alist-zh-cn"         # AList
PACKAGES+=" luci-i18n-filebrowser-zh-cn"   # File Browser
PACKAGES+=" luci-i18n-frpc-zh-cn"          # frp 内网穿透
PACKAGES+=" luci-i18n-nps-zh-cn"           # nps 内网穿透

# 网络存储组件
PACKAGES+=" luci-i18n-qbittorrent-zh-cn"   # qBittorrent 下载器
PACKAGES+=" luci-i18n-aria2-zh-cn"         # Aria2 下载器
PACKAGES+=" luci-i18n-hd-idle-zh-cn"       # 硬盘休眠
PACKAGES+=" luci-i18n-p910nd-zh-cn"        # p910nd 打印服务器
PACKAGES+=" luci-i18n-samba4-zh-cn"        # Samba 网络共享
PACKAGES+=" luci-i18n-vsftpd-zh-cn"        # FTP 服务器

# Docker 组件
PACKAGES+=" luci-i18n-dockerman-zh-cn"
PACKAGES+=" docker-compose"

# VPN 组件
PACKAGES+=" luci-i18n-ipsec-vpnd-zh-cn"    # IPSec VPN
PACKAGES+=" luci-i18n-zerotier-zh-cn"      # Zerotier

# 界面翻译补全
PACKAGES+=" luci-i18n-opkg-zh-cn"
PACKAGES+=" luci-i18n-base-zh-cn"
PACKAGES+=" luci-i18n-firewall-zh-cn"

# 网络组件
PACKAGES+=" luci-i18n-eqos-zh-cn"          # EQoS 网速控制
# PACKAGES+=" luci-app-syncdial"             # 多线多拨
# PACKAGES+=" luci-i18n-mwan3-zh-cn"         # 负载均衡
PACKAGES+=" luci-i18n-nlbwmon-zh-cn"       # 宽带监控 Nlbwmon
PACKAGES+=" luci-i18n-wrtbwmon-zh-cn"

# 其他组件
PACKAGES+=" kmod-usb-printer"
PACKAGES+=" kmod-lp"

PACKAGES+=" git"                           # git
PACKAGES+=" zsh"                           # zsh 终端
PACKAGES+=" vim-fuller"                    # Vim（带语法高亮）
PACKAGES+=" lrzsz"                         # X/Y/ZMODEM 文件传输
PACKAGES+=" openssh-server openssh-client" # OpenSSH
PACKAGES+=" openssh-sftp-server"           # SFTP 文件传输
PACKAGES+=" netdata"                       # Netdata 监控界面

# 自定义文件
FILES="files"

# 禁用服务以防止冲突
DISABLED_SERVICES="sshd dockerd"

# 生成固件
make image \
    PROFILE="$PROFILE" \
    PACKAGES="$PACKAGES" \
    FILES="$FILES" \
    DISABLED_SERVICES="$DISABLED_SERVICES"
