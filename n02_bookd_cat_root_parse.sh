#!/usr/bin/env bash

set -e

I_FILE_NAME="n01_bookd_cat_root.html"
O_FILE_NAME="n03_bookd_cat_root.csv"

echo "cid,title" > "$O_FILE_NAME" \
&& grep href "$I_FILE_NAME" \
 | sed 's#.*category/##g' \
 | sed 's#"> *#,"#g' \
 | sed 's#</a>##g' \
 | sed 's#$#"#g' \
 | sed 's#\&amp;#\&#g' \
 | sort -k2 -t "," \
 | uniq \
 >> "$O_FILE_NAME"
