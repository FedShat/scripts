#!/bin/bash
USER_AGENT="WireGuard-AndroidROMBuild/0.3 ($(uname -a))"

read -p "Enter version: " VERSION

rm -rf net/wireguard
mkdir -p net/wireguard
curl -A "$USER_AGENT" -LsS --connect-timeout 30 "https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-$VERSION.tar.xz" | tar -C "net/wireguard" -xJf - --strip-components=2 "wireguard-linux-compat-$VERSION/src"
sed -i 's/tristate/bool/;s/default m/default y/;' net/wireguard/Kconfig
git add --all
git commit -s -m "net: wireguard: Update to $VERSION"
