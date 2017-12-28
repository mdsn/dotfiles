# dotfiles

These are some of my config files. On my system, these usually reside on a `~/etc` directory and are linked on the corresponding place, like so:

```ln -s etc/vimrc .vimrc
```

## bar.sh and lemon.sh

These set up a very basic lemonbar with a workspace indicator and a clock. They assume the Iosevka font is installed.

## bspwmrc and sxhkdrc

Configuration commands for the bsp window manager and the simple X hotkey daemon. The only thing to note is the `directional_focus_tightness` set to `low` on the wm, to be able to focus floating windows.

Basic bindings:
- `super + r` reload the hotkey daemon
- `super + Return` bring up a terminal
- `super + p` run the dmenu app-launcher wrapper
- `super + {h,j,k,l}` change window focus
- `super + shift + {0..9}` send focused window to the nth workspace

## redshift

The user's coordinates need to be filled in on the `[manual]` section for redshift to decide the display temperature. For example:

```[manual]
lat=64.12
lon=-21.81
```

## tmux

The magic binding is `C-a`. Split panes with `C-a n` and `C-a m`, vertically and horizontally, respectively. It's configured to use vi keybindings. Change panes with `C-a {h,j,k,l}`.

## xinitrc and xmodmaprc

Sets spanish layout, and changes the caps lock key into a control key. The xmodmap configuration just changes a useless key (the one to the left of backspace, usually an opening question mark in spanish layouts) into a forward slash. I find this useful for vim and unix paths in general.

The `xinitrc` file also brings up the authentication agent, and runs the window manager.

## zshrc

Basic expected keybindings, such as `^r` for backwards history search, `^w` to delete a word, and `^u` to delete a line. Sets up the directory

Some aliases:
- `dhi` show the directory stack. Change to a previous directory with `cd -#`, where `#` is the number shown by `dhi`.
- `pm` is equivalent to `python manage.py`, a significant improvement to my quality of life as a django developer.
- a bunch of `git` aliases
  - `gs` short git status
  - `gdc` cached diff (shows what you've staged and are about to commit)
  - `g1` a one-line, decorated and colorized log. Run it with `--graph`, `--all`, `--stat`, `--shortstat` for more.
  - `gi` short for `git show`. I suppose the `i` stands for inspect.
  - `g-` runs `git checkout -`. It will clear your uncommited changes.

This zshrc has a very basic prompt. It displays the current zle vi mode on the right prompt with colors, but doesn't always work right.

## vimrc

Uses `vim-plug` for plugin management. Sets up obvious quality of life options. Drops all backups and temporary files into a `~/tmp` directory. The leader key is `space`.

Some bindings (keys bound with `leader` have a space before). These are on normal mode, unless stated otherwise:
- `ñ` is equivalent to `:`. It's incredibly convenient to have a `:` key that doesn't require pressing shift. And `ñ` is never used in vim anyway because most people don't have it.
- ` q` open the command line window
- `<BS>` (that's backspace) switch to the previous buffer
- ` z` close the preview window
- `  ` (that's space-space) clear the search highlight
- ` n` open a scratch buffer that doesn't show up on the buffer list and doesn't have a swap file. I stole this from a reddit comment
- ` w` toggle whitespace display
- ` r` toggle line wrap
- `jk` go to normal mode. Works on insert, visual, and command modes.
- `^h/^j/^k/^l` navigate windows.
- ` m` split the current buffer into a new tab
- ` k` close the current tab
- ` 1/2/3/4/5` quick switch to the nth tab.

For C and C++ files, `:make!` is bound to `<F5>` and ` /` goes to the next semicolon in the line.
