# Dotfiles

For ricing, I love the Roboto font. Unfortunately it doesn't work well for Asian languages but for my work that is irrelevant. For Icons I use Paper, and GTK theme is Adapta.

### Installation

Recommended programs used in my dotfiles depend on:
* i3wm compatible window manager. I use i3-gaps. Tried Sway but keep falling back to Xorg based WMs.
* dunst - For alerts, nice and simple.
* dmenu - to start apps
* passmenu - pass compatible dmenu extension
* recoll - Desktop search a la google desktop
* compton - For awesome eye candy and reduced screen tearing.

Recommended scripts to checkout:
* configure-xrandr.sh - reset xrandr config with a hotkey
* gnome_rotate / mate_rotate - rotate wallpapers in a folder and put as wallpaper. (mate is for mate wm, gnome for gnome3); combine with mote_open_photo_eom.sh to open the current wallpaper. My wife and I trim our shaken family photos like this all the time. 



```
$ cd ~
$ git clone https://github.com/joopdo/dotfiles.git
$ mv dotfiles .dotfiles
$ vim ~/.dotfiles/config/config
$ ln -s .dotfiles/config/config ~/.config/i3/config
```
