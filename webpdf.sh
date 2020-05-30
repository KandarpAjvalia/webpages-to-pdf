#!/bin/bash

mkdir ./.webpdf_temp

while read i
do 
    wkhtmltopdf "$i" "./.webpdf_temp/""$(echo "$i" | sed -e 's/https\?:\/\///' -e 's/\//-/g' ).pdf" 
done < $1

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged-pages.pdf $(ls -1 ./.webpdf_temp/*.pdf)

rm -rf ./.webpdf_temp
