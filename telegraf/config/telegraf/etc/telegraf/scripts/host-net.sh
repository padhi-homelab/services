#!/usr/bin/env bash

# FIXME: telegraf's `net` input does not use `HOST_SYS` yet.
# Workaround script (to be used as an `exec` input instead)
# adapted from: https://www.reddit.com/r/influxdb/comments/irq79s/comment/g97scps/
#
# [[inputs.exec]]
#   name_override = "host_net"
#   commands = ["/path/to/script/hostnet.sh"]
#   timeout = "5s"
#   data_format = "influx"

GREP_PATTERN="($1)"
shift
for PATTERN in $@ ; do
  GREP_PATTERN="($PATTERN)|${GREP_PATTERN}"
done

for IFACE in $(ls "$HOST_SYS/class/net" | grep -E "$GREP_PATTERN") ; do
  while [ -z ${TX_BYTES} ] || [ -z ${RX_BYTES} ] ||
        [ -z ${TX_PACKETS} ] || [ -z ${RX_PACKETS} ] ||
        [ -z ${TX_ERRORS} ] || [ -z ${RX_ERRORS} ] ||
        [ -z ${TX_DROPPED} ] || [ -z ${RX_DROPPED} ]
  do
    TX_BYTES=$(cat $HOST_SYS/class/net/$IFACE/statistics/tx_bytes)
    RX_BYTES=$(cat $HOST_SYS/class/net/$IFACE/statistics/rx_bytes)
    TX_PACKETS=$(cat $HOST_SYS/class/net/$IFACE/statistics/tx_packets)
    RX_PACKETS=$(cat $HOST_SYS/class/net/$IFACE/statistics/rx_packets)
    TX_ERRORS=$(cat $HOST_SYS/class/net/$IFACE/statistics/tx_errors)
    RX_ERRORS=$(cat $HOST_SYS/class/net/$IFACE/statistics/rx_errors)
    TX_DROPPED=$(cat $HOST_SYS/class/net/$IFACE/statistics/tx_dropped)
    RX_DROPPED=$(cat $HOST_SYS/class/net/$IFACE/statistics/rx_dropped)
  done

  echo "host_net,interface=$IFACE tx_bytes=${TX_BYTES}u,rx_bytes=${RX_BYTES}u,tx_packets=${TX_PACKETS}u,rx_packets=${RX_PACKETS}u,tx_errors=${TX_ERRORS}u,rx_errors=${RX_ERRORS}u,tx_dropped=${TX_DROPPED}u,rx_dropped=${RX_DROPPED}u"
done
