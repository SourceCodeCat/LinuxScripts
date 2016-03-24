#===============================================================
# Script takes a pdf as input and converts it to gray
# scale using imageMagick, using the specified quality
#and density, then saves it using the specified name
# Common usage: 
# ./convert2gray.sh original.pdf new.pdf quality_val density_val
#===============================================================
INPUT_FILE=$1
OUTPUT_FILE=$2
QUALITY=$3 #100
DENSITY=$4 #400
convert -colorspace GRAY -quality $QUALITY -density $DENSITY $INPUT_FILE $OUTPUT_FILE
