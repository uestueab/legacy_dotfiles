#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#170F0D/g' \
         -e 's/rgb(100%,100%,100%)/#acafa9/g' \
    -e 's/rgb(50%,0%,0%)/#170F0D/g' \
     -e 's/rgb(0%,50%,0%)/#1e1e1e/g' \
 -e 's/rgb(0%,50.196078%,0%)/#1e1e1e/g' \
     -e 's/rgb(50%,0%,50%)/#170F0D/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#170F0D/g' \
     -e 's/rgb(0%,0%,50%)/#b9bcb5/g' \
	*.svg
