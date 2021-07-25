#!/bin/bash

for d in /storage/*/; do
	((printf "$d,";du -sm "$d" | awk '{print $1/1024}';find "$d" -name "*" -type f -exec stat --format '%y' {} \; | cut -d- -f 1 | sort -n | uniq| sed -n '1p;$p')| tr '\n' ',' | tr '\n' ' ')|sed 's/.$//'; echo "" &
done
