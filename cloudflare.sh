#!/usr/bin/env bash

##################################################################
#   API Key
##################################################################

Global_Key="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
Zone_ID="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
Record_ID="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
Email="example@example.com"


##################################################################
#   Record
##################################################################

Type="A"
Name="example.com"
Content="1.2.3.4"
TTL=1
Proxy="false"


##################################################################
#   Script
##################################################################

curl -X PUT "https://api.cloudflare.com/client/v4/zones/${Zone_ID}/dns_records/${Record_ID}" \
     -H "X-Auth-Email: ${Email}" \
     -H "X-Auth-Key: ${Global_Key}" \
     -H "Content-Type: application/json" \
     --data '{"type":"'${Type}'","name":"'${Name}'","content":"'${Content}'","ttl":'${TTL}',"proxied":'${Proxy}'}'
