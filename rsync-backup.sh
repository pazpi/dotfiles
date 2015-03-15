#Backup script: crete a directory whith date and copy all file listed, except those in the file rsync-exclude.txt

ssh noscreen mkdir -p /mnt/500omega/LenovoManjaro$(date -I)
sudo rsync -aAXvP --exclude-from=$HOME/dotfiles/rsync-exclude.txt /* -e ssh noscreen:/mnt/500omega/LenovoManjaro$(date -I)
