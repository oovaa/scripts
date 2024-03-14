#!/bin/env bash

kdialog --yesno "Would you like to set KRunner to open with Meta?\nYes enables it, No or closing this window disables it." --title "KRunner as meta"
ISMETA=$?

if [ "$ISMETA" == 0 ]; then
    kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.krunner,/App,,toggleDisplay"
    qdbus org.kde.KWin /KWin reconfigure
else
    kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta --delete
    qdbus org.kde.KWin /KWin reconfigure
fi

# Remember to set the qdbus command according to your distro!
# OpenSUSE for instance uses qdbus-qt5 or qdbus6,
# while other distros typically use just qdbus.
