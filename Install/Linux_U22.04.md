# Linux  Kubuntu 22.04 LTS

*Ubuntu* Was released April 23, 2022. This is my writeup, which I often continue to change as new issues pop up.
I installed from scratch, as I've often found this to be more stable. But the drawback is all your account
and KDE settings are lost. The install was 7 minutes, but I swear to finetune everything to my personal likings,
several hours are needed, somewhat helped by using this writeup. 

Support for 22.04 LTS will be until April 2027.

## Summary

Nice things (for some of these you need extra packages)

1. dolphin (the file browser) finally integrates Google Drive for me - still few minor hickups
   [in U22 it's not working yet for me, in fact, my old U20 it's also not working]
2. kdeconnect finally works for me (sending files from laptop to phone, and vice versa)
3. krunner (like the Finder on a mac) also searches for browser tabs, really useful for heavy tab users
4. thunderbird integrates well with calendars ("cp -a ~/.thunderbird" worked)
5. the latte dock is something I'm trying out, looks very functional, but can it coexist?
6. lots of nice widgets, which i still need to optimize life around
   [downloading widgets seems to be broken]
7. digital clock: timezones, clipboard timestamps, 
7. zoom, skype, and slack work (but need to pay attention to install packages before, see below)

What I don't like:

1. snaps. I'd probably prefer AppImage, but enuf said.  https://www.kubuntuforums.net/showthread.php/76713-Confused-about-snaps
2. flatpak. Same, all these issues with living in a container. Wasted diskspace, etc.

## Details

Before we start, there are two ways to install U22:  fresh  or updating from U20. My
experience has always been that the former is more stable. More than often weird things happen
when you upgrade (most likely your dotfiles). I've heard this from multiple sources. YMMV. 

Secondly, installing a desktop based OS is getting pretty involved, and taking the better
part of the day. This is hard, many people keep thus running on their OS version for a longer
than should be needed time.

1. Install a few hundred packages  (see my very chaotic list in u22.04.txt)
2. Install and configure the various KDE components
3. Install plugins for various apps (firefox, thunderbird, gimp, ....)
4. Setting up your personal shell (and other dotfiles)
5. Install 3rd party applications (zoom, slack, ..)


## What packages are there?

The following commands make a listing which I frequency consult via grep:

      apt-cache search  .  > apt-cache0.list
      apt-cache pkgnames   > apt-cache1.list
      dpkg --list          > dpkg0.list

and after many packages are installed, this command will log what you have installed

      aptitude search '~i !~M'  | tr -s ' ' | cut -f 2 -d ' ' |wc
      
First install a few very essential packages

      sudo apt install tcsh git emacs plasma-widgets-addons kio-gdrive openssh-server -y

Every now and then I add another version to dpkgN.list. Usually kubuntu starts just
below 2000 packages, and this usually grows to about 4000 for me.


## My KDE Setup

Before you do anything, get the PlasmaConfigSaver from the widget
store. Whatever you do, this way you can save a configuration and
easily come back to it, or build on top of that.  This should be
standard part of KDE.

I've only been using KDE since Ubuntu 18.04, and now beginning to like
it, as more things now actually work the way I like it.  Before this I
was actually getting used to Unity, but a few mall annoying things
were unstable.

KDE can be confusing, for one, some settings appear in different
places if you switch a version of KDE. Some of this work is painful if
you have to repeat it many times, so it would be nice to have a
programmatic way to do this for a virgin account. You can also copy
the correct files in your ~/.config tree, but the key word is "correct".
This appears to be a moving target.

Also to note: during tuning, unlike in GNOME, changing a setting is
not applied until you hit the Apply button on each screen.

  A. Configure Desktop (right click on the Desktop background)
  
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
           click behavior : single  [not there in U22]
       Desktop Effect
           Mouse Mark (shift-meta to draw, shift-meta-F11/F12 to erase)
	   Magic Lamp (vs. squash)
	   Fall Apart (can be a bit distracting)
	   Translucency
       Screen Edges
           - TL:   Desktop Grid
           - TR:   Present windows current desktop
           - BR:   Present windows all desktops
	   - TM:   Krunner
                   https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/
	   	   this will enable krunning to find tabs in mozilla
	   Switch desktop on edge:  Only when moving windows (fun shortcut to move [new] window)
       Screen Locking
           only after waking from sleep (remove the 15 minutes option)
       Virtual Desktop
           6 desktops in 2 rows              (navigation shortcuts come later)
	       -> give the desktop unique names/numbers such that taskbar can identify
           navigation *do not* wrap around
           show on-screen display when switching
       Activities
           ->make a new activity   [U22: I don't use this option anymore]
   
   
     2. Window Management
       Window Behavior
           Focus -> Focus follows mouse (mouse precedence)
           Raising Windows -> Raise on hover [750ms is the default, perhaps 500ms better)
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
	       Toggle Present Windows (Current Desktop) -> Meta+D   (was assigned Ctrl+F9)

     (Personalization)
     6. Applications
      File Associations:  search for html, and make sure firefox is the first, if you install an E-book editor,
      this can be the default and is annoying.
     7. Online Accounts
      make a google account, this will give you access to google Drive etc.
      make sure you first login the browers to Drive, otherwise your Browser window will/might hang.

     (Hardware)
     1. Input Devices
       Keyboard -> Advanced -> Position of Compose Key -> Right-Alt
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

     - Icons-only Task Manager Settting -> Appearance
	  ?  i don't understand what max.rows and the checked item do ??
     - Icons-only Task Manager Settting -> Behavior     
       Clicking grouped task:   Show windows side by side   [this is important]
       Sort:                    "By Desktop"
       Show only takss:    v    "from current activity"

TO BE RESOLVED:

https://github.com/shalva97/kde-configuration-files/


SAVING YOUR SESSION

  - there is no good tool, there is kwriteconfig5/kreadconfig5
  - best is to save ?
  
       ~/.config/kdeconnect  -R
       ~/.config/k*rc                (I counted 24)
       ~/.kde/share/config
       ~/.kde/share/apps
       ~/local/share

  - Using "cp -al " to make hard links to a backup directory

ADDING WIDGETS : have a field day, here are my favorites

    NOTE1:  autoraising focus could be making it harder than it should
    NOTE2:  already existing widgets on the screen are market with a blue dot (1)

Too many widgets is quickly becoming useless, as your normal windows are on top of them. Here's a few of the ones I tried:

* Analog Clock - Show seconds, 24-Hour Time display, Custom Date format "ddd MMM d"
* Display Configuration - useful if you give talks or switch monitors a  lot (e.g. between home and work on a laptop)
* Lock/Logout
* Quick Share
* Touchpad - useful if you need to turn off touchpad temporarely - useful on laptops
* - and the following ones will need a download
* Luna II - phase of the moon
* Event Calendar - weather, calendar
* Condensed Weather -
* Advanced Radio Players - install your own radiostations

and there are plenty of websites with ideas/reviews. Here are a few:

* https://store.kde.org/browse/cat/418/order/latest/
* 2019: https://www.addictivetips.com/ubuntu-linux-tips/best-kde-plasma-5-widgets/
* 2018: https://www.linuxlinks.com/excellent-kde-plasma-widgets/
* 2018: https://www.osradar.com/the-best-kde-plasma-widgets/
* 2017: https://opensource.com/article/17/5/7-cool-kde-tweaks-will-improve-your-life

ROOT:
  If you are an admin, it might be useful to inherit this from your old ubuntu,
  or set them now:
  - "sudo" with longer retention
     /etc/sudoers:         edit this with: sudo visudo 
           Defaults        env_reset,timestamp_timeout=3600
  - faster booting	   
     /etc/systemd/system.conf
           DefaultTimeoutStopSec=5s
  - "ssh identity"
        copy the /etc/ssh/{ssh_host*,ssh_import_id} from your old to new
  - ImageMagick does not convert pdf to png without editing a system file
    (TBD)



DIGITAL CLOCK CONFIGURE
1
  Appearance:
    show date
    show seconds
    display TZ as TZ city (not code)    
    Time diplay:   24-hour
    Date format:   Custom:     ddd MMM d   (e.g. Mon Apr 13)
  Calendar:
    Show Week numbers
  Time Zones:
      pick your favorite cities
      +switch TZ with mouse wheel (very useful!!)

DOLPHIN
     Settings -> Configure Dolphin -> Startup:
          check    "make location bar editable"
          uncheck  "Open new folders in tabs"
	  check 2x "show full path..." 

     Network
         google drive now shows up - be sure to first install kio-gdrive and
         open a browser tab in google drive

LATTE DOCK

     apt install latte-dock
     dock settings:
          - auto-hide   otherwise it's annoying, but I overlay it on the default task manager panel

OLD STUFF....

1. sometimes loose the KDE window manager. It can be restarted from
   the commandline with

       kstart plasmashell

   or

       kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell

3. the directory .local/share/baloo can get pretty big, this is for finding files (like the finder on Mac)
   but the "locate" command does functionally something very similar.
   You could turn it off.

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
15. System Settings -> Startup and Shutdown -> Login Screen (SDDM) -> Get New Login Screens [Breeze -> Sugar Candy] (***)
16. System Settings -> Startup and Shutdown -> Splash Screen -> Get New Splash Screens [breeze -> Gently] (***)
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
*  Keep your aliases (e.g. "ssh chara" in the config file) - alternatively in /etc/hosts
  
## KDE

KDE uses: panel, latte dock (mac lookalike) - I tend to not like latte anymore, it dies from time to time

## GIMP 2.10.30

I don't like some of their default settings. It's not in color, and too few icons (they were grouped by default)

      Edit -> Preferences -> Interface -> Theme             Dark  or Light
      Edit -> Preferences -> Interface -> Icon theme        Color or Legacy  (can change icon size)
      Edit -> Preferences -> Interface -> Toolbox           +show active bruch   -use tool groups
                       

## firefox

Install a container for firefox:   https://www.mozilla.org/en-US/firefox/facebookcontainer/


## RapidPhotoDownloader

I like to use yyyy/dd/mm as the directory structure for photos (the default is one directory, yyyyddmm)
In Destination, do that in the settings wheel at Photos (Videos has one too, but I use it too little to bother)

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

        pre-install:   sudo apt install libxcb-xtest0 libegl1-mesa libgl1-mesa-glx
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

        service cups restart

and it should work. Otherwise manually add the local and network printers.

## OnlyOffice

Although LibreOffice (formerly OpenOffice) is the default on Ubuntu, another option is OnlyOffice, now at version 5.5
Debian package are on https://www.onlyoffice.com/download-desktop.aspx e.g.
https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb

      sudo dpkg -i onlyoffice-desktopeditors_amd64.deb
      sudo apt-get -f install

that should also resolve any missing package OO needed.

## Things to do after you have installed

The linux media are full of stories with "N things do do after install".... but a lot are Ubuntu centric.
there are some kubuntu applicable tips in there as well, YMMV

* https://www.omgubuntu.co.uk/2020/04/things-to-do-after-installing-ubuntu
     * livepatch
     * blender, chromium, obs
* https://www.linuxuprising.com/2020/04/top-things-to-do-after-installing.html
     * flatpak, flathub, steam, 
* https://linuxconfig.org/things-to-install-on-ubuntu-20-04
* https://www.tecmint.com/things-to-do-after-installing-ubuntu-20-04/
* https://itsfoss.com/things-to-do-after-installing-ubuntu-20-04/

* https://www.ubuntubuzz.com/2021/01/what-to-do-after-installing-kubuntu-2010-groovy-gorilla.html
* https://www.ubuntubuzz.com/2020/10/what-to-do-after-installing-kubuntu-2004-lts.html
* https://averagelinuxuser.com/things-to-do-after-installing-kde-neon-2020/
* http://www.tuxmachines.org/node/146360


## issues (some are upstream issues)

- gwenview loads very slow (sometimes, not clear when/how)
- darktable doesn't load after the first image? (seems similar to gwenview, but just doesn't recover) -
  running it via strace seems to work
- k4dirstat crashes - has been filed - and seems to work now, few weeks later.
- kazam -   Failed to correctly detect operating system, but seems to then record
- System Settings -> Window Management -> KWin Scripts -> Get New Scripts    [BUG Hide Inactive Borders - reboot needed]
- System Settings -> Regional Settings -> Language -> Add languages [BUG: flashing when clicked]
- there was a weird problem with snap, server restarting, subsequent install would hang. this just disappeared in time.
- I had my 2nd screen being hyjacked by another computer, but kubuntu kept it live. I had an app on that 2nd screen, but there
  is no way to move it to another screen.. You can move desktop and activity, but not screen.
- the command 'more $HOME/.bash<TAB>' does not complete properly, instead it will change to \$HOME and thus becomes useless
  this is a know bash upstream problem - can be fixed with another setting
- vlc not always working for me from Dolphin (but mpv is) - just black window.
- switching the digital clock to another one, and coming back, looses all the settings
- PID's can now go over 32767, but I noted some apps (digikam, slack) that are not trivial
  to kill. They seem to linger in the processtable. Is there some auto-restart when it crashes?
- (feature) application names launched from the iconic view do not match those from the terminal.
- thunderbird often needs to be started twice (or more), otherwise the Google Buttons (Archive/Delete) don't show
- some windows (thunderbird, my hard disk I/O monitor widget) go flashing or update wrong portions of windows sometimes)

- thinkpad docking station: seems to forget 2nd screen after timeout, also doesn't latte-dock back (i placed it on the other screen)
  also sometimes will lock all of linux, and reboot is needed
- loggin in with 2nd user, then switching back gives an all black screen. not good. reboot needed.
- digikam doesn't alkways update when the albums are told they need to watch for updates.....
  no, this is the bug where my Removable Media collection got re-marked as being Local.....
- i've lost my latte-docker  -d gives:
  Rejected : adding explicit view, screen not available ! :  "HDMI-2"
- sometimes installing a new app will result in mime-types  to get messed up. More than once I got surprises when
  i wanted to open a URL (.html file) or PDF file.
- sticky windows from digikam (typically when the editor saved an image) . 7.0.0-beta3 flatpak. not sure if 6.4 does it.
- when firefox gets updated, it refused to continue, wants to restart, but that never works, and you have to remember to
  Restore Previous Session

- tail: inotify cannot be used, reverting to polling: Too many open files

- [new in 22]   my desk top right click doesn't show it can open Dolphin

## Solved Issues

- the boot process is not a few sec, ubuntu is, but kubuntu takes a long time (>1 min) [solved itself]
- convert from ImageMagick doesn't convert a PDF until you modify the /etc/ImageMagick-7/policy.xml
file and
find make sure you have **<policy domain="coder" rights="read | write" pattern="PDF" />** in the policymap.

- dual display plasma with docking station:
  make sure setting save display's properies is "For only this specific display arrangement" -
  still not solved


- inotify_add_watch(/home/teuben/.local/share/kate/sessions) failed: (No space left on device)
  Look at the small number:    cat /proc/sys/fs/inotify/max_user_watches
  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers

## Homebrew

Preconditions (do this anyways, to easy the sudo needed in step 2)

      sudo apt install build-essential procps curl file git

then this one liner will do:

      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

and to put in your bash shell for all future sessions

      echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bashrc

