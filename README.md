# dotfiles
my personal dotfiles

To generate package list you need to run

```
pacman -Qe | awk '{print $1}' > package_list.txt
```
