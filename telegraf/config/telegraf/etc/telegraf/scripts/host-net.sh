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
  while [ -z ${BYTES_SENT} ] || [ -z ${BYTES_RECV} ] ||
        [ -z ${PACKETS_SENT} ] || [ -z ${PACKETS_RECV} ] ||
        [ -z ${ERR_IN} ] || [ -z ${ERR_OUT} ] ||
        [ -z ${DROP_IN} ] || [ -z ${DROP_OUT} ]
  do
    BYTES_SENT=$(cat $HOST_SYS/class/net/$IFACE/statistics/tx_bytes)
    BYTES_RECV=$(cat $HOST_SYS/class/net/$IFACE/statistics/rx_bytes)
    PACKETS_SENT=$(cat $HOST_SYS/class/net/$IFACE/statistics/tx_packets)
    PACKETS_RECV=$(cat $HOST_SYS/class/net/$IFACE/statistics/rx_packets)
    ERR_IN=$(cat $HOST_SYS/class/net/$IFACE/statistics/tx_errors)
    ERR_OUT=$(cat $HOST_SYS/class/net/$IFACE/statistics/rx_errors)
    DROP_IN=$(cat $HOST_SYS/class/net/$IFACE/statistics/tx_dropped)
    DROP_OUT=$(cat $HOST_SYS/class/net/$IFACE/statistics/rx_dropped)
  done

  echo "host_net,interface=$IFACE bytes_sent=${BYTES_SENT}u,bytes_recv=${BYTES_RECV}u,packets_sent=${PACKETS_SENT}u,packets_recv=${PACKETS_RECV}u,err_in=${ERR_IN}u,err_out=${ERR_OUT}u,drop_in=${DROP_IN}u,drop_out=${DROP_OUT}u"
done
