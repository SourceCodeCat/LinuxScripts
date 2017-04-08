# -------------------------
# Marco A. Salgado Martinez 
# --------------------------

# this script disables the area in the mousepad designated to do the 
# right click, once disabled it, the whole mousepad is used as left
# click, right click still can be executed by taping with two fingers


#!/bin/bash
synclient RightButtonAreaLeft=0
synclient RightButtonAreaTop=0
