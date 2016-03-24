#=======================================================
# Script takes a pdf as input, applies
# the specified brightness & contrast
# and writes a new modified pdf with the specified name
# Common usage: 
# ./chbrightness.sh original.pdf new.pdf brightnes_value contrast_value
#======================================================

INPUT_FILE=$1
OUTPUT_FILE=$2
BRIGHTNESS=$3 #10
CONTRAST=$4   #50
convert -brightness-contrast $BRIGHTNESS,$CONTRAST -density 500 -colorspace Gray $INPUT_FILE $OUTPUT_FILE


