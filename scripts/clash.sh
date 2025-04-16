#!/bin/bash

echo "Start Downloading Clash Core..."
echo "Current Path: $PWD"

mkdir -p "files/etc/openclash/core"
cd "files/etc/openclash/core" || (echo "Clash core path does not exist! " && exit)

# Clash Meta
wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz
tar -zxvf clash-linux-amd64.tar.gz
rm -rf clash-linux-amd64.tar.gz
mv clash clash_meta
