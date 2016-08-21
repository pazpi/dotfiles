# dotfiles

# This projecs has moved to GitLab
[dotfile](https://gitlab.com/pazpi/dotfiles)

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

## Ugly theme for qt application
run `qtconfig-q4` and set the theme to GTK+
