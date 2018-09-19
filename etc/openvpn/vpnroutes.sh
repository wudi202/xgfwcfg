#!/bin/sh

dev=$1

iptables -t nat -A POSTROUTING -o $dev -j MASQUERADE

# load various routes.
for file in *routes.txt; do
    echo "program routes for $file"
    while read -r line; do
    ip route replace $line dev $dev    
    done  < $file
done

exit 0
