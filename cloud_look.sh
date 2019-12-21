#!/usr/bin/env bash

##################################################################
#   API Key
##################################################################

Global_Key="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
Zone_ID="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
Email="example@example.com"
Record_Name="example.com"


##################################################################
#   Script
##################################################################

curl -X GET "https://api.cloudflare.com/client/v4/zones/${Zone_ID}/dns_records?type=A&name=${Record_Name}&page=1&per_page=20&order=type&direction=desc&match=all" \
     -H "X-Auth-Email: ${Email}" \
     -H "X-Auth-Key: ${Global_Key}" \
     -H "Content-Type: application/json"
