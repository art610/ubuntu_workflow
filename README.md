# Ubuntu Workflow
Scripts, aliases, etc. All for automate my or your workflow in Ubuntu

Tested on Ubuntu 22.04 LTS.

## Firstly

```bash

sudo apt remove -y letsencrypt certbot
sudo apt -y install grep ufw fail2ban exa bat terminator git curl wget nginx software-properties-common certbot python3-certbot-nginx docker
sudo apt -y update && sudo apt -y upgrade

cd ~
git clone https://github.com/art610/ubuntu_workflow.git
cd ubuntu_workflow
chmod +x aliases.sh
./aliases.sh
source ~/.bashrc

# if u need Alacritty
sudo add-apt-repository ppa:aslatter/ppa
apti alacritty

```

## Awesome window manager

https://awesomewm.org/

```bash
# install
apti awesome awesome-extra
# update
aptu
# copy config to user home
cp /etc/xdg/awesome/rc.lua ~/.config/awesome/rc.lua
# now we can open it with nano using alias: awesomec

# keyboard layout switcher
# clone repo to ~/.config/awesome
# https://github.com/echuraev/keyboard_layout
# add after -- Handle runtime errors after startup (line 48)
-- Keyboard Layout Switcher
local keyboard_layout = require("keyboard_layout")

local kbdcfg = keyboard_layout.kbdcfg({type = "gui"})

kbdcfg.add_primary_layout("English", beautiful.en_layout, "us")
kbdcfg.add_primary_layout("Русский", beautiful.ru_layout, "ru")
kbdcfg.bind()

# install flameshot
apti flameshot

# find in the config
-- {{{ Key bindings
globalkeys = gears.table.join(
# at the end of globalkeys after -- Menubar add
--PrintScreen
    awful.key({ }, "Print", function () awful.util.spawn_with_shell("flameshot gui") end)
      ),
-- Volume (Super+Ctrl+<-/+>)
    awful.key({ modkey, "Control" }, "=", function () awful.util.spawn_with_shell("amixer -q -D pulse set Master 15%+ unmute") end),
    awful.key({ modkey, "Control" }, "-", function () awful.util.spawn_with_shell("amixer -q -D pulse set Master 15%- unmute") end)


# and after function closed
# add (switch on Alt+Shift) - separated from script above
globalkeys = awful.util.table.join(globalkeys,
    -- Shift-Alt to change keyboard layout
    awful.key({"Shift"}, "Alt_L", function () kbdcfg.switch_next() end),
    -- Alt-Shift to change keyboard layout
    awful.key({"Mod1"}, "Shift_L", function () kbdcfg.switch_next() end)
)
# then restart Awesome -> Win+Ctrl+r

# create script to change monitors settings and desktop wallpaper
# and add it to autorun
e ~/.config/awesome/monitors_config.sh
# add this in the script (change xrandr parameters by your setup)
#!/bin/sh
xrandr --output HDMI-1 --mode 2560x1080 --rate 75.00 --primary --output HDMI-0 --mode 1920x1080 --rate 60.00 --left-of HDMI-3 --output HDMI-1 --mode 1920x1080 --rate 60.00 --right-of HDMI-3;
feh --no-fehbg --bg-scale '~/Pictures/Wallpapers/desktop.jpg';
# add rights
sudo chmod ugo+x ~/.config/awesome/monitors_config.sh
# add to cron
crontab -e
@reboot ~/.config/awesome/monitors_config.sh
```
