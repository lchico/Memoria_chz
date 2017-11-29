#!/bin/bash

start_ap(){
  #configure access point and password

  CONTENT="[connection]
  id=countit
  uuid=1e4f99c7-61db-42c8-a547-17038e59c424
  type=802-11-wireless
  timestamp=1430858535

  [802-11-wireless]
  ssid=tesis_lc
  mode=ap
  seen-bssids=00:00:00:00:00:00;
  security=802-11-wireless-security

  [802-11-wireless-security]
  key-mgmt=wpa-psk
  psk=tesis123

  [ipv4]
  method=shared
  address1=192.168.1.1/24,192.168.1.1

  [ipv6]
  method=auto"

  echo "$CONTENT" > /etc/NetworkManager/system-connections/tesis_lc

  chmod 600 /etc/NetworkManager/system-connections/tesis_lc
  service network-manager restart
}

#stop access point
stop_ap(){
  rm -f /etc/NetworkManager/system-connections/tesis_lc
  service network-manager restart
}

case "$1" in
  start) start_ap;;
  stop) stop_ap;;
  *) echo "do you want to start or stop the access point?";;
esac;


echo "To active network execute: nmcli conn up tesis_lc ifname wlp9s0"
