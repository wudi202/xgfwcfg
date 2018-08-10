#!/bin/sh

dev=$1

iptables -t nat -A POSTROUTING -o $dev -j MASQUERADE

# load various routes.
while read -r line; do
    ip route replace $line dev $dev    
done  < googleroutes.txt
while read -r line; do
    ip route replace $line dev $dev    
done  < twitterroutes.txt
while read -r line; do
    ip route replace $line dev $dev    
done  < fbroutes.txt
while read -r line; do
    ip route replace $line dev $dev    
done  < wikiroutes.txt
while read -r line; do
    ip route replace $line dev $dev    
done  < as15133_verizon.txt
while read -r line; do
    ip route replace $line dev $dev    
done  < fastlyroutes.txt
exit 0
