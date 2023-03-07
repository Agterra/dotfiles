# Troubleshooting

# Dual Boot Windows

## Install GRUB

1. Install `os-prober`
2. `sudo mount /dev/<YOUR DEVICE WITH WINDOWS> /mnt`
3. `sudo cp -ax /mnt/EFI/Microsoft /boot/efi/EFI`
4. Reboot
5. Keep pressing `space` until the selection view appears

From there you can press `t` to increase the selection time out, or `T` to decrease it.
You can also select default with "d". Hold "l" to boot linux after POST or "w" to boot Windows after POST without visiting the menu.

# Pop OS

## cedilla

### Edit configuration files:

sudo vim /usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules.cache

sudo vim /usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/immodules.cache
On both, find the lines starting with "cedilla" "Cedilla" and add :en to the line. Something like this:

"cedilla" "Cedilla" "gtk30" "/usr/share/locale" "az:ca:co:fr:gv:oc:pt:sq:tr:wa:en"

### Change the Compose file:

sudo sed -i /usr/share/X11/locale/en_US.UTF-8/Compose -e 's/ć/ç/g' -e 's/Ć/Ç/g'

### Instruct the system to load the cedilla module:

Add those lines to /etc/environment:

GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla
Reboot and you are done.

# Fedora

## i3 Tearing

You can use Picom and it will solve most of the issues you have, just be sure to set the glx render. 

Otherwise:

### If you are using intel gpu

Create a file at `/usr/share/X11/xorg.conf.d/20-intel.conf` and add the following:

```
Section "Device"

Identifier "Intel Graphics"

Driver "intel"

Option "TearFree" "true"

EndSection
```
Logout and login

### If you are using a NVIDIA gpu

`sudo nvidia-settings` > `X Server Display Configuration` > `Advanced`:

- Check `Force Composition Pipeline`
- Check `Force Full Composition Pipeline`
- Reboot

## HiDpi screens

To handle scale and hidpi screens on i3, create two files:

- `~/.Xressource`:

```
Xft.dpi: 120
Xft.hintstyle: hintmedium
Xft.hinting: true
```

- `~/.xinitrc`:

```
xrdb -merge ~/.Xresources
exec i3
```

And you're good to go :)

## Non-working backlight keys

If the keys for screen brightness are not working, try the following:


```bash
sudo grubby --update-kernel=ALL --args="module_blacklist=hid_sensor_hub"
```

Then reboot and the keys should be working again

## Setup Hibernate (TO DO)
