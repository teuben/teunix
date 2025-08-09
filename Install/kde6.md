# KDE

My KDE setup. See also more details in the various Linux*md installation notes.

Typically my desktop has:

- KDE
- focus follows mouse with auto-raise
- single click opens files and directories
- [ put application menu top left ]
- kdeconnect for the phone
- krunner for desktop/browser searching (needs plugin per browser)
- 2H x 2V virtual desktops, single activity
- very few widgets (maybe a clock)
- some desktop effects (wobbly windows, broken windows on kill)

## Issues

- Wayland seems to prevent emacs-gui from resizing

- Icons from System Tray seem to disappear sometimes....  do these help:
     sudo service bluetooth restart
     sudo systemctl restart bluetooth
  or I can use
     restart_kde

- Serious issue sometimes when switching desktops too fast, scrollbar can do it,
  should be disabled or binding to another action?  It will otherwise lock the
  system, only reboot comes out.

## My KDE Setup (short version)

Notes for Ubuntu 25.04 - KDE Plasma 6.3.3 / Frameworks 6.12.0 / Qt 6.8.2
                                    6.3.4              6.12.0      6.8.3    may-21
		                    6.3.90             6.14.0      6.8.3    6.4 beta-1
				    6.4.3              6.16.0      6.9.1    fedora-42

1. Mouse & Touchpad
       Screen Edges need some tuning:
           - TL:   Overview
           - TR:   Present windows - current desktop
	   - MR:   Present windows - all desktops
           - BR:   Desktop Grid
	   - TM:   Krunner
                   https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/
	   	   this will enable krunning to find tabs in mozilla
		   See also: https://community.kde.org/Plasma/Browser_Integration
		   chrome:
		   https://chrome.google.com/webstore/detail/plasma-integration/cimiefiiaegbelhefglklhhakcgmhkai
		    
	   Switch desktop on edge:  Only when moving windows (fun shortcut to move [new] window)
	   
       Screen Locking
           Never lock screen, but keep lock when waking from sleep

1. Workspace Bahavior
       General Behavior
           clicking files or folders:
	       select "Opens Them" (this will cause single click to enter directory or open file)


1. Security & Privacy
       Screen Locking
           uncheck automatic locking after (15) mins -> Never

1. Appearance & Style
       color & themes
           Window Decorations
	      configure Titlebar Buttons (may need to widen screen to see)
	        - put application menu top left (hit Apply after each action)
           Splash Screen
	   Login Screen (SDDM)
	   Boot splash screen



2. Apps & Windows
       Window Management
           Window Behavior
               Focus -> Focus follows mouse (mouse precedence)
               Raising Windows -> Raise on hover [750ms is the default, perhaps 500ms better)

           Desktop Effects (lost a lot of options???)
	       =Mouse Mark (shift-meta to draw, shift-meta-F11/F12 to erase)
	       ?Magic Lamp (vs. squash)
	       ?Fall Apart (can be a bit distracting)
	       ?Translucency (nice if you want to match figures)
	       ?wobbly windows (one below max)

           Virtual Desktop
               4 desktops in 2 rows              (navigation shortcuts come later)
	           -> give the desktop unique names/numbers such that taskbar can identify
               navigation *do not* wrap around (is actually the default)
               show on-screen display when switching
       

3. Input Devices
   - Touchpad
     - Tapping:  tap-to-click
     - make sure not to invert scrolling
     - Two-finger tap: select Middle-click via 3-finger tap to right click)
     



4. System -> Power Management

        Energy Saving : on my laptop they did not get properly populated at all, that was bad.
           -  Dim Screen    1-5 min (was default)
           -  Screen Energy Saving (switch off after 
           -  Suspend session:  check this off (i.e. do it manually)

        Energy Saving : 
           -  Dim Screen    1-5 min (was default)
           -  Screen Energy Saving (switch off after 20 mins)
           -  Suspend session:  check this off (i.e. do it manually) - this way screen stays on

        (see also Screen Locking earlier)


5. Configure Icons-only Task Manager Settting
   - Appearance
     i don't understand what max.rows and the checked item do ?? - now finally working
   - Behavior     
       - Clicking grouped task:   Show large window previews   [this is different in U23]
                                  Show "Present Windows' effect [in U22 ?]
       - Sort:                    "By Desktop"
       - Show only tasks:         (only) "from current activity"

6. CONFIGURE DIGITAL CLOCK
   * Appearance: Show seconds "Always"    Time display "24 Hour"   Date format Custom "ddd MMM d"
   * Calendar: Show week numbers
   * Time Zones: add , use scroll to change

7. root things: "sudo" with longer retention
     /etc/sudoers:         edit this with: sudo visudo 
           Defaults        env_reset,timestamp_timeout=3600

8. CONFIGURE DOLPHIN
   * Settings -> Configure Dolphin -> Startup:
     - check    "make location bar editable" (the checkmark toggles edit mode)
     - check    "show filter bar"
     - uncheck  "Open new folders in tabs"
     - check 2x "show full path..."

9. Fixing (electron?) apps that don't keep the KDE window markup - e.g. new 2024 zoom does this
      - Open System Settings
      - Go to Window Management -> Window Rules
      - Match on "Window class (application)" with "Exact Match" on "zoom"
      - "Match whole window class": "no"
      - Add property "No titlebar and frame", set it to "No"

I currently have set it to "force". Maybe a more relaxed setting can work, too.


## Things I don't wind up using

- activities.  I find virtual desktops enough.
- clipboard


## My KDE Setup (old notes)

Before you do anything, get the PlasmaConfigSaver from the widget
store. Whatever you do, this way you can save a configuration and
easily come back to it, or build on top of that.  This should be
standard part of KDE.


KDE can be confusing, for one, some settings appear in different
places if you switch a version of KDE. Some of this work is painful if
you have to repeat it many times, so it would be nice to have a
programmatic way to do this for a virgin account. You can also copy
the correct files in your ~/.config tree, but the key word is "correct".
This appears to be a moving target.

Also to note: during tuning, unlike in GNOME, changing a setting is
not applied until you hit the Apply button on each screen.

  A. Configure Desktop (right click on the Desktop background)
  
      Desktop & Wallpaper -> Layout -> pick:  'Desktop' or 'Folder View'
           it seems picking a background has to be done for each screen (if > 1 screen attached)
      Mouse Actions ->  Add Action -> Left Button -> Switch Activity -> Apply
                                      Middle Button -> Paste -> Apply

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
           clicking files or folders:
	       select "Opens Them" (this will cause single click to enter directory or open file)
       Desktop Effect
           Mouse Mark (shift-meta to draw, shift-meta-F11/F12 to erase)
	   Magic Lamp (vs. squash)
	   Fall Apart (can be a bit distracting)
	   Translucency (nice if you want to match figures)
       Screen Edges
           - TL:   Desktop Grid
           - TR:   Present windows current desktop
           - BR:   Present windows all desktops
           but now:
           - TL:   Present windows current desktop
           - TR:   Overview
           - BR:   Desktop Grid
	   - TM:   Krunner
                   https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/
	   	   this will enable krunning to find tabs in mozilla
		   See also: https://community.kde.org/Plasma/Browser_Integration
		   2023note:   
   
   
     2. Window Management
       Window Behavior
           Focus -> Focus follows mouse (mouse precedence)
           Raising Windows -> Raise on hover [750ms is the default, perhaps 500ms better)
       Task Switcher
       KWin Scripts
?           +MinimizeAll (useful to have a button to minimize all windows)
       Window Rules
       
     3. Shortcuts
       Global Shortcuts
           Kwin 
               Switch One Desktop Down -> Ctrl-Alt-Down (suggested is meta+ctrl+down)
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

       Keyboard -
          advanced
	      caps lock behavior:   Make caps lock an additional backspace (TRYING)
	                            or:  Disabled
              position of compose key:    Right Alt				    
	      

       Keyboard -> Advanced -> Position of Compose Key -> Right-Alt
             (this way   <Right-Alt> a ` gives à)

       Mouse - make sure scrolling is not inverted (or natural as some call it)
       Touchpad
          Tapping:  tap-to-click
	  make sure not to invert scrolling
?	  [middle mouse is missing???]

     4. Power Management
        Energy Saving : on my laptop they did not get properly populated at all, that was bad.
           -  Dim Screen    1-5 min (was default)
           -  Screen Energy Saving (switch off after 
           -  Suspend session:  check this off (i.e. do it manually)

     6. KDE Connect
        Set your phone on the same network, see it show up in the list, select and "Request pair"
        - Approve on phone - test e.g. with "Remote Input" on phone, it should move mouse on laptop
        - Set up a file system to share if you want to see them on the laptop
     7. Printers

     - Icons-only Task Manager Settting -> Appearance
	  ?  i don't understand what max.rows and the checked item do ??
     - Icons-only Task Manager Settting -> Behavior     
       Clicking grouped task:   Show large window previews   [this is different in U23]
        
       Sort:                    "By Desktop"
       Show only tasks:         (only) "from current activity"

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

Too many widgets is quickly becoming useless, as your normal windows are on top of them. Here's a few of the ones I tried:

* Memory Usage - put it on the Task Manager
* Individual Core Usage
* Network Speed
* Screen Layout
* Analog Clock - Show seconds, 24-Hour Time display, Custom Date format "ddd MMM d"
* Lock/Logout
* Quick Share
* Touchpad - useful if you need to turn off touchpad temporarely - useful on laptops
* - and the following ones will need a download
* Luna II - phase of the moon
* Event Calendar - weather, calendar
* Condensed Weather -
* Advanced Radio Players - install your own radiostations

and there are plenty of websites with ideas/reviews. Here are a few:

* https://store.kde.org/browse
       
* 2024: https://www.ubuntubuzz.com/2025/03/what-to-do-after-installing-kubuntu-2404-and-kde-plasma-527.html#google_vignette
* 2024: https://www.cosmoscalibur.com/en/blog/2024/que-hacer-despues-de-instalar-manjaro/
* 2020: https://averagelinuxuser.com/things-to-do-after-installing-kde-neon-2020/
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
  - ImageMagick might not convert pdf to png without editing a system file
  
    Make sure you can convert a pdf to png, on some machines the file /etc/ImageMagick-6/policy.xml did not give
    mortal users enough permission.
               <policy domain="coder" rights="read | write" pattern="PDF" />
    this requires root priviliges. There is also a way for each user to do it.
               cp etc/policy.xml ~/.config/ImageMagick/policy.xml


KDE WALLET ?

Open System Settings -> KDE Wallet -> Disable Enable the KDE Wallet subsystem -> Apply.

controversial if it's useful or in the way.  I tried it with blowfish. some error with the other opton.

FILE INDEXOR?

also controversal.

Open System Settings -> Search -> File Search -> Disable Also index file content -> Apply.

FIREWALl

Open Firewall Configuration -> Enable Firewall.



     Network
         google drive now shows up - be sure to first install kio-gdrive and
         open a browser tab in google drive

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


## Tailoring

Things I often wind up adding:

- add 'Analog Clock' widget to the desktop, usually top right corner
- add 'Memory Usage' widget to the Icons-Only Task Manager at the bottom.
- add 'New Window' (New Tab/Split View already there) to the top bar of Konsole



## Other things to do

Somewhat less urgent for immediate use, I often wind up doing some of the following:

- add a cpufreq monitor to the System Monitor
- install **K4DirStar** to monitor disk space usage


## Misc KDE notes

- if you save your desktop, this is maintained in a file ~/.config/ksmserverrc
- if you use kdewallet, some system files (e.g /etc/NetworkManager/system-connections/) will
  not be maintained by the system, but by the wallet
- if you use gdm3 (e.g. via PopOS!) it will not set up ssh-agent for you
  it seems using sddm  will do this (see /etc/sddm/), which is the KDE default in most cases
- mounting encrypted (luks) drives magically worked - but where are they hidden in PopOS!

## Troubleshooting

  reset plasma?
  If you just want to reset your Plasmashell settings, you can delete
    ~/.config/plasma-org.kde.plasma.desktop-appletsrc
    ~/.config/plasmashellrc

  Lost your firefox decorations?
  In firefox, check the title bar setting: click on the hambruger, More tools, Customise toolbar,
  and there's check box at the bottom left. save it. it should get things like resizing etc. back


## ssh in KDE wallet


how to add ssh-agent to KDE wallet?

~/.bash_profile or ~/.bash_login or ~/.profile [whichever comes first ???] -- seems wrong order
since ~/.profile was first on my machine
export SSH_ASKPASS="/usr/bin/ksshaskpass"
export SSH_ASKPASS_REQUIRE=prefer


Using KDE Autostart scripts (alternative):

~/.config/autostart-scripts/ssh-add-keys.sh

#!/bin/bash
SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS
ssh-add ~/.ssh/id_ed25519    # your private key path





2. Customize the Desktop:
Widgets:
Add widgets to the desktop or panel to display information like weather, system monitor, or media controls. 
Icons:
Customize the appearance of desktop icons, including their size, style, and behavior. 
Desktop effects:
Enable visual effects like window animations, desktop cube, or other visual enhancements. 
Themes:
Choose a global theme and customize individual elements like colors, fonts, and icons. 
Activities:
Create different desktop activities, each with its own set of applications and settings.



3. Install Applications:
Software Center:
.
Opens in new tab
Use the built-in software manager (Discover on KDE) to browse and install applications. 
Office Suite:
.
Opens in new tab
Consider installing LibreOffice or Calligra as a comprehensive office suite. 
Multimedia:
.
Opens in new tab
Install codecs and media players like VLC or Clementine for handling various audio and video formats. 
Other essential applications:
.
Opens in new tab
Choose your preferred web browser, email client, and other tools based on your needs. 




4. Advanced Customization (Optional):
KDE Wallet: Consider configuring KDE Wallet to securely store passwords and sensitive information. 
Firewall: Enable a firewall to enhance security, especially if you connect to public networks. 
Input devices: Adjust mouse and touchpad settings to your preference. 
File management: Explore features like Dolphin file manager and its integration with other applications. 
Keyboard shortcuts: Customize keyboard shortcuts for frequently used actions. 
