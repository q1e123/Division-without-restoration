#!/bin/bash

for file in *.vhd; do
    tr -d '\r' < "$file" > "${file}.tmp"
    mv "${file}.tmp" "$file"
done