#!/usr/bin/env bash

temp=$(mktemp -d)

url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"

dest="${temp}/gfwlist.txt.base64"

custom="custom.gfwlist.txt"

wget --no-check-certificate ${url} -O ${dest}

cat ${dest} | base64 -d > ${temp}/gfwlist.txt

if [ -f "${custom}" ]; then
    cat custom.gfwlist.txt >> ${temp}/gfwlist.txt
    base64 ${temp}/gfwlist.txt > gfwlist.txt
fi

rm -rf ${temp}
