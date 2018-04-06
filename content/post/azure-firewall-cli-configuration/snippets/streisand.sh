#!/bin/sh

RG_NAME=phalanx-rg
NSG_NAME=phalanx-nsg

# HTTPS (Streisand Gateway)
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-https \
	--priority 1010 \
	--destination-port-range 443 \
	--protocol Tcp

# L2TP-IPSEC
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-l2tp-ipsec-1 \
	--priority 1021 \
	--destination-port-range 500 \
	--protocol Udp
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-l2tp-ipsec-2 \
	--priority 1022 \
	--destination-port-range 1701 \
	--protocol Udp
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-l2tp-ipsec-3 \
	--priority 1023 \
	--destination-port-range 4500 \
	--protocol Udp

# OpenVPN
# (not adding DNS rule)
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-openvpn-1 \
	--priority 1031 \
	--destination-port-range 636 \
	--protocol Tcp
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-openvpn-2 \
	--priority 1032 \
	--destination-port-range 8757 \
	--protocol Udp

# OpenConnect / Cisco AnyConnect
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-openconnect \
	--priority 1040 \
	--destination-port-range 4443 \
	--protocol '*'

# Shadowsocks
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-shadowsocks \
	--priority 1050 \
	--destination-port-range 8530 \
	--protocol Tcp

# Stunnel
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-stunnel \
	--priority 1060 \
	--destination-port-range 993 \
	--protocol Tcp

# Tor
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-tor-1-bridge \
	--priority 1071 \
	--destination-port-range 8443 \
	--protocol Tcp
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-tor-2-obsf4 \
	--priority 1072 \
	--destination-port-range 9443 \
	--protocol Tcp

# WireGuard
# (not adding DNS rule)
az network nsg rule create --resource-group $RG_NAME --nsg-name $NSG_NAME \
	--name allow-wireguard \
	--priority 1080 \
	--destination-port-range 51820 \
	--protocol Udp

