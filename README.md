# dotfiles
my personal dotfiles

## Install dotfile

```
./setup.sh
```

## Clean dotfile

```
./setup.sh clean
```

To generate package list you need to run

```
pacman -Qe | awk '{print $1}' > package_list.txt
```
