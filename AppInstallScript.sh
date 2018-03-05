#!/bin/sh
#--------------------------------------------------------
# The script is a template to install apps like eclipse,
# Blender, or any other app that doesn't create a launcher
# just customize the vars and  execute it. :)
# by Marco Antonio Salgado Martinez, ing.marco@gmail.com
#--------------------------------------------------------

BASEDIR=$(pwd)
#--------------------------------------------------------
# Only modify these vars  as it seems fit.
#--------------------------------------------------------
PROGRAM_NAME="blender"
LAUNCHER_NAME="Blender"
LAUNCHER_FILENAME="blender.desktop"
LAUNCHER_KWDS="blender;Blender;3d"
LAUNCHER_CTGRS="GNOME;GTK;Game;3DGraphics"
LAUNCHER_CMTS="Create 3D images and Animate"
ALIAS_NAME="blender"
ICON="$BASEDIR/icons/scalable/apps/blender.svg"
SYMLINK_NAME=$PROGRAM_NAME
#--------------------------------------------------------
SYMLINK_INSTALL_PATH="/bin/$SYMLINK_NAME"
TERMINAL_ALIAS_FLAG="$(grep -w "alias $ALIAS_NAME='$SYMLINK_NAME'" ~/.bashrc)"
echo "looking for an already created sym link.."
TEMP="$(find /bin/ -name $SYMLINK_NAME)"

if [ "$SYMLINK_INSTALL_PATH" = "$TEMP" ]
then
        echo "Symlink already created"
else
        echo "No previous symlink found"
        echo "creating symlink..."
        sudo ln -s "$BASEDIR/$PROGRAM_NAME" "$SYMLINK_INSTALL_PATH"
        echo "done..."
fi


echo "looking for an already created app launcher..."
LAUNCHER_PATH="$(find /usr/share/applications/ -name $LAUNCHER_FILENAME)"

if [ "$LAUNCHER_PATH" != "" ]
then
        echo "Launcher already created"
else
        echo "No previous launcher found"
        echo "creating launcher..."
        echo "[Desktop Entry]" >> $LAUNCHER_FILENAME
	echo "Name=$LAUNCHER_NAME" >> $LAUNCHER_FILENAME
	echo "Comment=$LAUNCHER_CMTS" >> $LAUNCHER_FILENAME
	echo "Keywords=$LAUNCHER_KWDS" >> $LAUNCHER_FILENAME
	echo "Exec=$SYMLINK_NAME" >> $LAUNCHER_FILENAME
	echo "Icon=$ICON" >> $LAUNCHER_FILENAME
	echo "Terminal=false" >> $LAUNCHER_FILENAME
	echo "Type=Application" >> $LAUNCHER_FILENAME
	echo "Categories=$LAUNCHER_CTGRS" >> $LAUNCHER_FILENAME
	echo "StartupNotify=true" >> $LAUNCHER_FILENAME
	sudo mv $LAUNCHER_FILENAME /usr/share/applications/$LAUNCHER_FILENAME
        echo "done..."
fi

echo "Looking for the alias in the bashrc..."
TEMP=$TERMINAL_ALIAS_FLAG
echo "search result: $TEMP"
if [ "$TEMP" = "" ]
then
        echo "alias not found... adding it..."
        echo "" >> ~/.bashrc
        echo "" >> ~/.bashrc        
	echo "# alias for $SYMLINK_NAME :)" >> ~/.bashrc
        echo "alias $ALIAS_NAME='$SYMLINK_NAME'" >> ~/.bashrc
        echo "done..."
else
	echo "alias already created..."
fi
echo ""
echo ""
echo "OK, Done!!... \n$PROGRAM_NAME can be launched by typing $ALIAS_NAME in the terminal or the launcher :) \nremember to restar the terminal to launch it from there"
