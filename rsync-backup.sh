#Backup script: crete a directory whith date and copy all file listed, except those in the file rsync-exclude.txt

ssh pazpi-noscreen mkdir -p /mnt/500omega/Lenovo$(uname --kernel-release)$(date -I)
rsync -aAXvP --exclude-from=$HOME/Projects/dotfiles/rsync-exclude.txt /* -e ssh pazpi-noscreen:/mnt/500omega/Lenovo$(uname --kernel-release)$(date -I)
