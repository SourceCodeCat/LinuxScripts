#=======================================================
# Script takes a pdf as input and converts it to gray
# scale using ghostscript then saves it using the 
# specified name
# Common usage: 
# ./convert2gray.sh original.pdf new.pdf
#======================================================

ORIGINAL_FILE=$1
CONVERTED_FILE=$2


gs -sOutputFile=$CONVERTED_FILE -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 $ORIGINAL_FILE < /dev/null
