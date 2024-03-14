#!/bin/env bash

kdialog --yesno "Would you like to set Overview to open with Meta?\nYes enables it, No or closing this window disables it." --title "KRunner as meta"
ISMETA=$?

if [ "$ISMETA" == 0 ]; then
    kwriteconfig5 --file kglobalshortcutsrc --group kwin --key Overview "Meta+W,Meta+W,Toggle Overview"
    kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"
    kwriteconfig5 --file kwinrc --group Plugins --key overviewEnabled "true"
    qdbus org.kde.KWin /KWin reconfigure

else
    # This will disable the Overview, you will need to manually enable the effect again
    # or use this script.
    kwriteconfig5 --file kglobalshortcutsrc --group kwin --key Overview --delete
    kwriteconfig5 --file kwinrc --group Plugins --key overviewEnabled --delete
    kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta --delete
    qdbus org.kde.KWin /KWin reconfigure
fi
# Remember to set qdbus according to your distro!
# OpenSUSE for instance uses qdbus-qt5 or qdbus6,
# while other distros use qdbus.
