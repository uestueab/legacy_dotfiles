#!/bin/sh
sed -i \
         -e 's/#1a1a1a/rgb(0%,0%,0%)/g' \
         -e 's/##A7CEC/rgb(100%,100%,100%)/g' \
    -e 's/#000000/rgb(50%,0%,0%)/g' \
     -e 's/#4e41db/rgb(0%,50%,0%)/g' \
     -e 's/#2b2b2b/rgb(50%,0%,50%)/g' \
     -e 's/#81B5AC/rgb(0%,0%,50%)/g' \
	$@
