#!/bin/bash - 
#===============================================================================
#
#          FILE: screenshot-window.sh
# 
#         USAGE: ./screenshot-window.sh 
# 
#   DESCRIPTION: take screenshot of the active window
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Dr. Fritz
#  ORGANIZATION: 
#       CREATED: 01/27/2016 20:36
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

sleep 5
activeWinLine=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)")
activeWinId=${activeWinLine:40}
import -window "$activeWinId" /tmp/$(date +%F_%H%M%S_%N).png

