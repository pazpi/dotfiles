ssh noscreen mkdir -p /mnt/500omega/$(date -I)
sudo rsync -aAXvP --exclude-from=$HOME/dotfiles/rsync-exclude.txt /* -e ssh noscreen:/mnt/500omega/LenovoManjaro$(date -I)
