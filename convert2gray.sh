#=======================================================
# Script takes a path image extension and target extension
# scale using ghostscript then saves it using the 
# specified name
# Common usage: 
# ./imgFormatConv <path where images are> <images ext i.e: .jpg .png > <target ext i.e: .jpg .png>
# use only one kind of extension
#======================================================

ORINGINAL_IMAGES_PATH=$1
IMAGES_EXT=$2
TARGET_IMG_EXT=$3

cd $ORINGINAL_IMAGES_PATH
for i in *"$IMAGES_EXT" ; do convert "$i" "${i%.*}$TARGET_IMG_EXT" ; done
