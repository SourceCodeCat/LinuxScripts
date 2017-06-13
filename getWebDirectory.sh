#! /bin/bash
# the script downloads the contents of a url
#  To avoid downloading the directory structure as well as the index.html file
# https://stackoverflow.com/questions/273743/using-wget-to-recursively-fetch-a-directory-with-arbitrary-files-in-it 
URL=$1
wget -r -nH -nd -np -R index.html* $URL


