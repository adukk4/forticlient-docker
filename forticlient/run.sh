#!/bin/sh
service ssh start
ssh -i /root/.ssh/id_rsa -D 0.0.0.0:6666 -o StrictHostKeyChecking=no -f -T -N -q root@localhost 2>/tmp/error

# --server $1 --vpnuser $2
/forticlientsslvpn/64bit/forticlientsslvpn_cli $@