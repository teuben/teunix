# Linux  Ubuntu 20.04 LTS

To be released April 23, 2020. This is my draft writeup, check back around May 1 for a more "final" version.

*The online formatting is also still messed up.*

The command

        sudo apt update && sudo apt full-upgrade
	
should do a full upgrade once the beta goes to LTS.	

## Summary

Nice things (for some of these you need extra packages)

1. dolphin (the file browser) finally integrates Google Drive
2. kdeconnect finally works for me (sending files from laptop to phone, and vice versa)
3. krunner (like the Finder on a mac) also searches for browser tabs, really useful for heavy browser usage
4. thunderbird integrates well with calendars ("cp -a ~/.thunderbird" worked)
5. the latte dock is something I'm trying out, looks very functional, but can it coexist?
6. lots of nice widgets, which i still need to optimize life around
7. digital clock: timezones, clipboard timestamps, 
7. zoom, skype, and slack work (but need to pay attention to install packages before, see below)

What I don't like:

1. more and more apps come via snap. Fills your mount table and wasts diskspace. (df -xsquashfs)

## Details

Before we start, there are two ways to install U20:  fresh  and updating from U18. My
experience has always been that the former is more stable. More than often weird things happen
when you upgrade (most likely your dotfiles). I've heard this from multiple sources. YMMV. 

Secondly, installing a desktop based OS is getting pretty involved, and taking the better
part of the day. This is hard, many people keep thus running on their OS version for a longer
than should be needed time.

1. Install a few hundred packages  (see my very rough list in u20.04.txt)
2. Install and configure the various KDE components
3. Install plugins for various apps (firefox, thunderbird, gimp, ....)
4. Setting up your personal shell (and other dotfiles)
5. Install 3rd party applications (zoom, slack, ..)

## What packages are there?

The following commands make a listing which I frequency consult via grep:

      apt-cache search  .  > apt-cache0.list
      apt-cache pkgnames   > apt-cache1.list
      dpkg --list          > dpkg0.list

First install a few very essential packages

      sudo apt install tcsh git emacs plasma-widgets-addons kio-gdrive openssh-server -y

Every now and then I add another version to dpkgN.list.. Usually kubunty starts just
below 2000 packages, and this soon grows to between 3000 and 4000 for me.


## Why I don't like GNOME3

I don't know, I simply can't get used to it. On Ubuntu they make it
look like the old Unity desktop, which at one time I did get used to
and almost liked, and now GNOME3 has the shell extensions, something
very simular to the KDE widgets. Our work environment is Centos7, where
GNOME3 looks very different from the one on Ubuntu. I did give it a
try again this time, so this is what I ran into:


1. By default shell extensions are not enabled (yes, the minimalistic approach)
2. To enable, you need to install "gnome-tweaks"
3. Within the "gnome-tweaks" there are a few that can be enabled, but the bulk goes via a firefox/chrome plugin!
4. https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/
5. To connect the desktop with that extension, you need to install "chrome-gnome-shell"
6. In firefox/chrome there is now a little gnome foot icon, which is the entry point to maintaining your extensions.
   You can search through (as of this writing) 124 pages of 10 extensions per page...  But pick current version only,
   and it's only 13 pages. Uninstalling and confuring is annoying too.  You do that best from the Tweaks->Extensions tool.

This overly complex workflow really does not make me feel warm and
fuzzy. To install a browser plugin to enhance the desktop? 

Compare this to KDE, none of these 6 steps are needed. Simply
right-click to "install widget" (although for newcomers the installion
of a widget is arguably non-intuitive).

### My favorite tuning in GNOME3:

For the record, here are a few things I tried and liked. Not sure if our Centos7 can
be tuned this way.

1. Tweaks -> Windows -> Raise Windows When Focused + Focus on Hover
2. Tweaks -> Workspaces : 4 (static)
3. Tweaks -> Top Bar -> Clock: Weekday / Date / Seconds
4. Settings -> Appearance -> Light (there is NO contrast top bar and top window edge)
5. Settings -> Appearance -> Dock : Icon size 32 (default is too big)



## My KDE Setup

I've been using this since Ubuntu 18.04, and beginning to like it, as more
things now actually work. 

KDE can be confusing too, because some settings appear in different
places if you switch a version of KDE. Some of this work is painful if
you have to repeat it many times, so it would be nice to have a
programmatic way to do this for a virgin account. You can also copy
the correct files in your ~/.config tree.

Also to note: during tuning, unlike in GNOME, changing a setting is
not applied until you hit the Apply button on each screen....

  A. Configure Desktop (right click)
  
      Wallpaper -> Layout -> pick:  'Desktop' or 'Folder View'
           it seems picking a background has to be done for each screen (if > 1 screen attached)
      Mouse Actions ->  Add Action -> Left Button -> Switch Activity -> Apply

  B. System Settings

     (Appearence)
     1. Global Theme
     2. Plasma Style
     3. Application Style
          Application Style
            Window Decorations
              Theme
	      Titlebar Buttons
	        - put application menu top left (hit Apply after each action)

     (Workspace)
     1. Workspace Bahavior
       General Behavior
           click behavior : single
       Desktop Effect
           Mouse Mark (shift-meta to draw, shift-meta-F11/F12 to erase)
	   Magic Lamp (vs. squash)
	   Fall Apart (can be distracting)
       Screen Edges
           - TL:   Desktop Grid
           - TR:   Present windows current desktop
           - BR:   Present windows all desktops
	   - TM:   Krunner
                   https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/
	   	   this will enable krunning to find tabs in mozilla
	   Switch desktop on edge:  Only when moving windows (fun shortcut to move [new] window)
       Screen Locking
           only after waking from sleep
       Virtual Desktop
           6 desktops in 2 rows
           navigation *do not* wrap around
           show on-screen display when switching
       Activities
           ->make a new activity
   
   
     2. Window Management
       Window Behavior
           Focus -> Focus follows mouse (mouse precedence)
           Raising Windows -> Raise on hover
       Task Switcher
       KWin Scripts
           +MinimizeAll (useful to have a button to minimize all windows)
       Window Rules
       
     3. Shortcuts
       Global Shortcuts
           Kwin 
               Switch One Desktop Down -> Ctrl-Alt-Down
               Switch One Desktop Left    Ctrl-Alt-Left
               Switch One Desktop Right   Ctrl-Alt-Right
               Switch One Desktop Up      Ctrl-Alt-Up
	       Toggle Present Windows (Current Desktop) -> Meta+D

     (Personlization)
     7. Online Accounts
      make a google account, this will give you access to google Drive etc.
      make sure you first login the browers to Drive, otherwise your Browser window will hang.

     (Hardware)
     1. Input Devices
       Mouse - make sure scrolling is not inverted (or natural as some call it)
       Touchpad
          Tapping:  tap-to-click
	  make sure not to invert scrolling

     4. Power Management
        Energy Saving : on my laptop they did not get properly populated at all, that was bad.
           -  Dim Screen    1-5 min (was default)
           -  Screen Energy Saving
           -  Suspend session

     6. KDE Connect
        Set your phone on the same network, see it show up in the list, select and "Request pair"
        - Approve on phone - test e.g. with "Remote Input" on phone, it should move mouse on laptop
        - Set up a file system to share if you want to see them on the laptop
     7. Printers



     - Task Manager (on bottom bar) may need some tinkering:
       Appearance
	  ?  i don't understand what max.rows and the checked item do ??
       Behavior
          - grouping of tasks -> 
      	  - show tasks for all desktops
       - resize it a bit, it's too tall for my taste



TO BE RESOLVED:

https://github.com/shalva97/kde-configuration-files/


SAVING YOUR SESSION

  - there is no good tool, there is kwriteconfig5/kreadconfig5
  - best is to save ?
  
       ~/.config/kdeconnect  -R
       ~/.config/k*rc
       ~/.kde/share/config
       ~/.kde/share/apps
       ~/local/share

ADDING WIDGETS : have a field day, here are my favorites

    NOTE1:  autoraising focus could be making it harder than it should
    NOTE2:  already existing widgets on the screen are market with a blue dot (1)
           - Analog Clock in top right corner, add the seconds hand
  

ROOT:
  If you are an admin, it might be useful to inherit this from your old ubuntu,
  or set them now:
  - "sudo" with longer retention
     /etc/sudoers:         edit this with: sudo visudo 
           Defaults        env_reset,timestamp_timeout=3600
  - "ssh identity"
        copy the /etc/ssh/{ssh_host*,ssh_import_id} from your old to new



DIGITAL CLOCK CONFIGURE

    Appearance:
      show date
      show seconds
      display TZ as TZ city (not code)
      Date format:   Custom:     ddd MMM d   (e.g. Mon Apr 13)
    Calendar:
      Show Week numbers
    Time Zones:
      pick your favorite cities
      +switch TZ with mouse wheel (very useful!!)

DOLPHIN

     Network
         google drive now shows up - be sure to first install kio-gdrive and
         open a browser tab in google drive

LATTE DOCK

     apt install latte-dock
     dock settings:
          - auto-hide   otherwise it's annoying,but I overlay it on the default task manager panel

OLD STUFF....

1. sometimes loose the KDE window manager. It can be restarted from
   the commandline with

       kstart plasmashell

3. the directory .local/share/akonadi can get pretty big, this is for finding files (like the finder on Mac)
   but the "locate" command does functionally something very similar.

   ->  is this now baloo in 20.04 ??   some poeple also complain about this, isn't "locate" sufficient ?
   also, krunning has some searching, where does it get it from

## Get New ...

In quite a few places new "things" can be loaded into KDE. Overwhelming and fun. You often see them in the
lower right corner of a setting that can be tailored by adding new ones. Here's a list as I encountered them,
but you can also get access to them via the Discover -> Plasma Addons program (there are 18 in that list):

1. Add Widget -> Get New Widgets (***)
2. Configure Desktop -> Get New Wallpapers (***)
3. System Settings -> Global Theme -> Get New Global Themes [breeze]
4. System Settings -> Plasma Style -> Get New Plasma Styles [breeze]
5. System Settings -> Application Style -> Application Style -> Configure GNOME/GTK Application Style -> Download New Stles
6. System Settings -> Application Style -> Window Decorations -> Get New Window Decorations [breeze]
7. System Settings -> Colors -> Get New Color Schemes [Breeze]
8. System Settings -> Fonts -> Font Management -> Get New Fonts 
9. System Settings -> Icons -> Icons -> Get New Icons [Breeze]
10. System Settings -> Icons -> Emoticons -> Get New Emoticons [Breeze]
11. System Settings -> Cursors -> Get New Cursors [Breeze]
12. System Settings -> Workspace Behavior -> Desktop Effects -> Get New Desktop Effects 
13. System Settings -> Window Management -> Task Switcher -> Get New Task Switchers [Breeze]
14. System Settings -> Window Management -> KWin Scripts -> Get New Scripts    [BUG Hide Inactive Borders - reboot needed]
15. System Settings -> Startup and Shutdown -> Login Screen (SDDM) -> Get New Login Screens [Breeze -> Sugar Candy]
16. System Settings -> Startup and Shutdown -> Splash Screen -> Get New Splash Screens [breeze -> ???]
17. System Settings -> Regional Settings -> Language -> Add languages (BUG: flashing when clicked)


A word on tinkering here: For the current Kubuntu the basic default setting for
most are called Breeze. There are probably 10^18 different combinations, if not more.

## Linux for Development

* https://www.ostechnix.com/simple-script-setup-development-environment-ubuntu/
* https://github.com/sojharo/mangi-script/    This does a lot, but isn't really my taste.

## Thunderbird

    your_name@gmail.com
    imap.gmail.com SSL 993
    smtp.gmail.com SSL 465

calendar: 2 add-ons are needed:  Lightning and Google Provider

  NOTE:   if you have an active $HOME/.thunderbird tree, you can
          symlink ("ln -s") and/or copy ("cp -a") it, and all settings (including add-ons)
	  seem to transfer

## ssh

*  Copy (or symlink) your $HOME/.ssh tree.
*  Keep your aliases (e.g. "ssh chara" in the config file)
  
## GNOME/KDE

GNOME3 uses:  dash (ubuntu dock on the side), dock, message tray (top bar)

KDE uses: panel, latte dock (mac lookalike),

## GIMP 2.10.18

Not in color, and too few icons (they were grouped by default)

      Edit -> Preferences -> Theme             Dark  or Light
      Edit -> Preferences -> Icon theme        Color or Legacy  (can change icon size)
      Edit -> Preferences -> Toolbox           +show active bruch   -use tool groups
                       

## DOLPHIN

Now adds a new open to the existing one.  When working in many windows etc. this is not usefuk.

      Settings -> Configure Dolphin -> Startup -> [-]Open new folders in tabs

## firefox

Install a container for firefox:   https://www.mozilla.org/en-US/firefox/facebookcontainer/

https://www.mozilla.org/en-US/firefox/facebookcontainer/

## Install

Here is what I have now (Mar 31)

     Operating System: Kubuntu 20.04
     KDE Plasma Version: 5.18.4
     KDE Frameworks Version: 5.68.0
     Qt Version: 5.12.5
     Kernel Version: 5.4.0-21-generic
     OS Type: 64-bit
     Processors: 8 × Intel® Core™ i7-8550U CPU @ 1.80GHz
     Memory: 15.3 GiB of RAM

## 3rd party apps:

zoom:

        pre-install:   sudo apt install libxcb-xtest0 libegl1-mesa
        https://zoom.us/download
        sudo dpkg -i zoom_amd64.deb 
        cp -a $OLDHOME/.zoom ~/
        cp -a $OLDHOME/.config/zoomus.conf ~/.config
	
skype:

        pre-install:   sudo apt install gnome-keyring
        then get the deb file from https://www.skype.com/en/get-skype/
        sudo dpkg -i skypeforlinux-64.deb
        and maybe
        sudo apt-get -f install

slack:

        pre-install:   sudo apt install libappindicator3-1
        https://slack.com/downloads/linux
        sudo dpkg -i slack-desktop-4.4.2-amd64.deb
        (getting all of your slack accounts back.....)
        cp -a $OLDHOME/.config/Slack ~/.config


If the dependencies did not succeed, try

        sudo apt-get -f install

## printers

This can be complicated. If you have an old working one, copy the cups tree (/etc/cups)
Then simply

        service cup restart

and it should work. Otherwise manually add the local and network printers.

## icons

Okular complaints about 'Icon theme "Numix-Circle-Light" not found' - maybe a relic of my old setup?
Google search suggested this:

     sudo add-apt-repository ppa:numix/ppa
     sudo apt update
     sudo apt install numix-icon-theme-circle

but after this I got "Icon theme "gnome" not found.". go figure. Turns out, this was a side-effect of me
trying out the "McMojave-circle" Icons. Going back to good old Breeze resolved it.

## OnlyOffice

Although LibreOffice (formerly OpenOffice) is the default on Ubuntu, another option is OnlyOffice, now at version 5.5
Debian package are on https://www.onlyoffice.com/download-desktop.aspx e.g.
https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb

      sudo dpkg -i onlyoffice-desktopeditors_amd64.deb
      sudo apt-get -f install

that should also resolve any missing package OO needed.

## Things to do after you have installed

The linux media are full of stories with "N things do do after install"....

* https://www.omgubuntu.co.uk/2020/04/things-to-do-after-installing-ubuntu
** livepatch


## TODO

things still to figure out

* laptop-mode-utils vs. tlp?
* caffeine


## BETA issues (some are upstream issues)

- the boot process is not a few sec, ubuntu is, but kubuntu takes a long time (>1 min)
- gwenview loads very slow (sometimes, not clear when/how)
- k4dirstat crashes - has been filed
- kazam -   Failed to correctly detect operating system, but seems to then record
- System Settings -> Window Management -> KWin Scripts -> Get New Scripts    [BUG Hide Inactive Borders - reboot needed]
- System Settings -> Regional Settings -> Language -> Add languages [BUG: flashing when clicked]
- there was a weird problem with snap, server restarting, subsequent install would hang. this just disappeared in time.
- I had my 2nd screen being hyjacked by another computer, but kubuntu kept it live. I had an app on that 2nd screen, but there
  is no way to move it to another screen.. You can move desktop and activity, but not screen.
- the command 'more $HOME/.bash<TAB>' does not complete properly, instead it will change to \$HOME and thus becomes useless
  this is a know bash upstream problem
- vlc not always working for me from Dolphin (but mpv is) - just black window.
- switching the digital clock to another one, and coming back, looses all the settings
- PID's can now go over 32767, but I noted some apps (digikam, slack) that are not trivial
  to kill. They seem to linger in the processtable. Is there some auto-restart when it crashes?
- (feature) application names launched from the iconic view do not match those from the terminal.
- thunderbird often needs to be started twice, otherwise the Google Buttons (Archive/Delete) don't show
