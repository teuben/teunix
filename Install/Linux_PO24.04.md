# Linux  PopOS! 24.04

The default is now the Cosmic desktop. using wayland.

## Desktop settings

Much simpler and less configurable than KDE. There's a dock (bottom) and panel (top),
and widgets (called applets here) are limited.

One big difference is that in KDE you need to "Apply" options, in Cosmic it
immediately takes affect, like in Gnome.

+ Desktop -> Window Management -> Focus follows cursor; 750 ms delay
+ Power & battery - turn off the screen after "Never"
+ Time & language -> Date & time format -> 24-hour + show seconds

Missing:

- place on all workspaces
- single click launch vs. double click
- setting timeout blanking to "never" when on power, right now it wants a login

Tweaks: there's an app with this name ("beyond the limits of your desktop")

Bugs:

- scrollbar stays at same location when changing tabs
- occasionally mouse (both USB and BLUETOOTH) disappear (reboot was needed)
- window manager freezes, mouse moves, but can't pick up (temp sleep solved it ?)
- emacs doesn't go my green on black background... what about server mode?

## Hack-1

installed KDE stuff, presumb

sudo apt install kde-standard

teunix:
  - only pgplot5 is installed
  - nemobench5 only 982  (was 1282 with 22.04)   - this is in "Balanced" mode
    switching to "High Performance" mode I got 843 !!!!   then 975
    In low-power mode 333
    gcc-11 got 1174

## emacs

GNU Emacs 29.3

doesn't do the green on black, server ok, but no saving at end

## ssh

ssh keeps asking for ksshaskpass in a new kdewallet. Maybe because I was co-installing KDE desktop ?

##

There appears to be no update-grub to patch back my old lost 22.04

zoom: needs libxcb-xtest0   - notice zoom doesn't  crash when sharing windows.

globalprotect: so far so good. except after I added secureW2, could not
reconnect.


secureW2:   cert in ~/.joinnow
