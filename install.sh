#!/bin/bash

cp ./restic_backup.sh /usr/local/bin/restic_backup.sh
chmod +x /usr/local/bin/restic_backup.sh

cp ./restic_cleanup.sh /usr/local/bin/restic_cleanup.sh
chmod +x /usr/local/bin/restic_cleanup.sh

sudo cp ./com.cbergoon.restic_backup_local.plist /Library/LaunchDaemons/com.cbergoon.restic_backup_local.plist
sudo cp ./com.cbergoon.restic_backup_remote.plist /Library/LaunchDaemons/com.cbergoon.restic_backup_remote.plist

sudo cp ./com.cbergoon.restic_cleanup_local.plist /Library/LaunchDaemons/com.cbergoon.restic_cleanup_local.plist
sudo cp ./com.cbergoon.restic_cleanup_remote.plist /Library/LaunchDaemons/com.cbergoon.restic_cleanup_remote.plist

cp ./private.restic_backup.conf ~/.restic_backup.conf

launchctl unload /Library/LaunchDaemons/com.cbergoon.restic_backup_local.plist
launchctl load /Library/LaunchDaemons/com.cbergoon.restic_backup_local.plist

launchctl unload /Library/LaunchDaemons/com.cbergoon.restic_backup_remote.plist
launchctl load /Library/LaunchDaemons/com.cbergoon.restic_backup_remote.plist

launchctl unload /Library/LaunchDaemons/com.cbergoon.restic_cleanup_local.plist
launchctl load /Library/LaunchDaemons/com.cbergoon.restic_cleanup_local.plist

launchctl unload /Library/LaunchDaemons/com.cbergoon.restic_cleanup_remote.plist
launchctl load /Library/LaunchDaemons/com.cbergoon.restic_cleanup_remote.plist