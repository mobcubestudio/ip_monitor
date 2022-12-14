#!/bin/bash
user="u88nso61pe1a3tfm8yp1yuijnr6syu"
token="a35tgjznbrmiu581u7of1jvot16qp5"
api_url="https://api.pushover.net/1/messages.json"

device_name="mi9"

if [ -z "$3" ]; then
	device_name="$device_name"
else
	device_name="$3"
fi

curl -s \
	--form-string "token=$token" \
	--form-string "user=$user" \
	--form-string "device=$device_name" \
	--form-string "title=$1" \
	--form-string "message=$2" \
	$api_url
