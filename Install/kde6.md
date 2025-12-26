# KDE

Typically my KDE desktop has the following features added/changed:

- focus follows mouse with auto-raise
- single click opens files and directories
- add application menu on top left
- kdeconnect for ineractions with/via the phone
- krunner for desktop/browser searching (needs plugin per browser)
- multiple 2H x 2V virtual desktops, but single activity
- a few widgets (maybe a clock, cpu monitor, network speed)
- some desktop effects (wobbly windows, broken windows on kill)
- start from a given saved desktop session
- my UMD security specfic things

## My KDE Setup

Notes for Ubuntu 25.04 -

```
    KDE Plasma 6.3.3 / Frameworks 6.12.0 / Qt 6.8.2
               6.3.4              6.12.0      6.8.3    may-21
               6.3.90             6.14.0      6.8.3    6.4 beta-1
               6.4.3              6.16.0      6.9.1    fedora-42
               6.3.5              6.15.0      6.8.3    ku25.10
```

### System Settings

The following are accessible from the System Settings, but keep in mind these were re-arranged
in KDE6.  In KDE5 most of these are present, but many are in a different hierarchy.

#### Input & Output
1. Mouse & Touchpad
       Mouse
       Touchpad
          - Tapping:  tap-to-click
          - make sure not to invert scrolling
          - Two-finger tap: select Middle-click via 3-finger tap to right click)
       
       Screen Edges:
           - TL:   Overview
           - TR:   Present windows - current desktop
	   - MR:   Present windows - all desktops   (this can easily mess up 2nd window to your right)
           - BR:   Desktop Grid
	   - TM:   Krunner
                   https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/
	   	   this will enable krunning to find tabs in mozilla
		   See also: https://community.kde.org/Plasma/Browser_Integration
		   chrome:
		   https://chrome.google.com/webstore/detail/plasma-integration/cimiefiiaegbelhefglklhhakcgmhkai
		    
	   Switch desktop on edge:  Only when moving windows (fun shortcut to move [new] window)

2. Keyboard
      Keyboard
      Shortcuts  ?

3. Display & Monitor

#### Connected Devices
4. Disks & Cameras
       Device Auto Mount
           -> select 'On Attach' for All Known Devices

5. KDE Connect
        Set your phone on the same network, see it show up in the list, select and "Request pair"
        - Approve on phone - test e.g. with "Remote Input" on phone, it should move mouse on laptop
        - Set up a file system to share if you want to see them on the laptop

#### Networking
6. online accounts (app seems to be blocked now, 2025?)
      make a google account, this will give you access to google Drive etc.
      make sure you first login the browers to Drive, otherwise your Browser window will/might hang.
      Network
         google drive now shows up - be sure to first install kio-gdrive and
         open a browser tab in google drive



#### Appearance & Style
7. Color & Themes
      Global Theme
         Window Decorations
	      configure Titlebar Buttons (may need to widen screen to see)
	         - put application menu top left (hit Apply after each action)
         Splash Screen
         Login Screen (SDDM)
	 Boot splash screen (does this even work?)
8. Animations [may have disappeared in later versions]
      - global animation speed: 0 to 16;  8 seems about right
      - window minimize -> Magic Lamps


#### Apps & Windows
9. Window Management
      Window Behavior
         Focus -> Focus follows mouse (mouse precedence)
         Raising Windows -> Raise on hover [750ms is the default, perhaps 500ms better)

      Task Switcher

      Desktop Effects
	       - Fall Apart (can be a bit distracting)
	       - Mouse Mark (shift-meta to draw, shift-meta-F11/F12 to erase)
	       - Translucency (nice if you want to match figures)
	       - wobbly windows (one below max)
	       ? Magic Lamp (vs. squash) -> now somewhere else

      Kwin Scripts

      Virtual Desktop
               4 desktops in 2 rows              (navigation shortcuts come later)
	           -> give the desktop unique names/numbers such that taskbar can identify
               navigation *do not* wrap around (is actually the default)
               show on-screen display when switching


#### Workspace
10. General Behavior
           clicking files or folders:
	       select "Opens Them" (this will cause single click to enter directory or open file)
11. Search
       File Search
       Plasma Search


#### Security & Privacy
12. Screen Locking 
           Never lock screen, but keep lock when waking from sleep
           uncheck automatic locking after (15) mins -> Never

13. KDE Wallet
   show manager in system tray


#### System
14. About this System
14. Power Management
        on AC power don't sleep after 15 mins... "do nothing"


        Energy Saving : on my laptop they did not get properly populated at all, that was bad.
           -  Dim Screen    1-5 min (was default)
           -  Screen Energy Saving (switch off after 
           -  Suspend session:  check this off (i.e. do it manually)

        Energy Saving : 
           -  Dim Screen    1-5 min (was default)
           -  Screen Energy Saving (switch off after 20 mins)
           -  Suspend session:  check this off (i.e. do it manually) - this way screen stays on

        (see also Screen Locking earlier)



15. Autostart
       ssh-add-keys.sh for KDE Wallet

16. Session
       Session Restore -> When Session was manually saved


### Other Interesting Settings

1. Configure Icons-only Task Manager Settting
   - Appearance
     i don't understand what max.rows and the checked item do ?? - now finally working
   - Behavior     
       - Clicking grouped task:   Show large window previews   [this is different in U23]
                                  Show "Present Windows' effect [in U22 ?]
       - Sort:                    "By Desktop"
       - Show only tasks:         (only) "from current activity"

2. Configure Digital Clock
   * Appearance: Show seconds "Always"    Time display "24 Hour"   Date format Custom "ddd MMM d"
   * Calendar: Show week numbers
   * Time Zones: add , use scroll to change

3. root things: "sudo" with longer retention
   - /etc/sudoers:         edit this with: sudo visudo 
           Defaults        env_reset,timestamp_timeout=3600

   - faster booting	   
     /etc/systemd/system.conf
           DefaultTimeoutStopSec=5s
   - "ssh identity"
        copy the /etc/ssh/{ssh_host*,ssh_import_id} from your old to new
   - ImageMagick might not convert pdf to png without editing a system file
  
     Make sure you can convert a pdf to png, on some machines
     the file /etc/ImageMagick-6/policy.xml did not give
     mortal users enough permission.
               <policy domain="coder" rights="read | write" pattern="PDF" />
     this requires root priviliges. There is also a way for each user to do it.
               cp etc/policy.xml ~/.config/ImageMagick/policy.xml


11. Configure Dolphin 
    * Settings -> Configure Dolphin -> Startup:
      - check    "make location bar editable" (the checkmark toggles edit mode)
      - check    "show filter bar"
      - uncheck  "Open new folders in tabs"
      - check 2x "show full path..."

12  Configure Konsole

     - Settings -> Configure Toolbars -> move 'New Window' to right in Main Toolbar

13. Fixing (electron?) apps that don't keep the KDE window markup - e.g. new 2024 zoom does this
      - Open System Settings
      - Go to Window Management -> Window Rules
      - Match on "Window class (application)" with "Exact Match" on "zoom"
      - "Match whole window class": "no"
      - Add property "No titlebar and frame", set it to "No"

    I currently have set it to "force". Maybe a more relaxed setting can work, too.




## Things I don't wind up using much, if any

- activities.  I find virtual desktops enough.
- clipboard
- PlasmaConfigSaver widget


## Saving your Session

It is useful to start with a session that has populated some windows, in my
case emacs with the files I was working on, and at least a terminal. Ideally
not browsers, since they bloat memory. They generally have their own recovery.

  - System Settings -> Startup and Shutdown -> Desktop Session 
      - On last logout (originaldefault)
      - When session was manually saved   [pick this]
      - Start with an empty session

  - Sessions are saved in ~/.config/ksmserverrc

There doesn't appear to be an option to store the last session though, that has
to be done via the manually saving option.

### Configuration

It might be nice to clone a configuration to another laptop. this seems to be hard.

  - See also https://github.com/shalva97/kde-configuration-files/
  - there is no good tool, there is kwriteconfig5/kreadconfig5
  - best is to save ?
  
       ~/.config/kdeconnect  -R
       ~/.config/k*rc                (I counted 24)
       ~/.kde/share/config
       ~/.kde/share/apps
       ~/local/share

  - Using "cp -al " to make hard links to a backup directory



## ADDING WIDGETS

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


##  FIREWALL

Open Firewall Configuration -> Enable Firewall.


## New Stuff

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
- add 'New Window' (New Tab/Split View already there) to the top bar of Konsole:



## Other things to do?

- add a cpufreq monitor to the System Monitor
- install **K4DirStat** to monitor disk space usage
- try cairo-dock
- learn about autostart
- learn about how to snapshot a session for restart
- file indexor. i tend to rely on updatedb, live ones impact too much
  System Settings -> Search -> File Search -> (Disabled by default)


## Misc KDE notes

- if you save your desktop, this is maintained in a file ~/.config/ksmserverrc
- if you use kdewallet, some system files (e.g /etc/NetworkManager/system-connections/) will
  not be maintained by the system, but by the wallet
- if you use gdm3 (e.g. via PopOS!) it will not set up ssh-agent for you
  it seems using sddm  will do this (see /etc/sddm/), which is the KDE default in most cases
- mounting encrypted (luks) drives magically worked - but where are they hidden in PopOS?

## Troubleshooting

  reset plasma?
  If you just want to reset your Plasmashell settings, you can delete
    ~/.config/plasma-org.kde.plasma.desktop-appletsrc
    ~/.config/plasmashellrc

  Lost your firefox decorations?
  In firefox, check the title bar setting: click on the hamburger, More tools, Customise toolbar,
  and there's check box at the bottom left. save it. it should get things like resizing etc. back


## ssh in KDE wallet


Add the two env.var's to one of the followining files?

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

## UMD specific things

- set up eduroam. Onboarding need a certificate

- install VPN with the GlobalProtect software from Palo Alto

## Current Issues

- Wayland seems to prevent emacs-gui from resizing (see my .emacs patch)
  (setq frame-resize-pixelwise t)

- Icons from System Tray seem to disappear sometimes....  do these help:
     sudo service bluetooth restart
     sudo systemctl restart bluetooth
  or I can use my script
     restart_kde

- networking icon also seems to disappear sometimes:f

     sudo systemctl restart NetworkManager
     

- Serious issue sometimes when switching desktops too fast, scrollbar can trigger it,
  should be disabled or binding to another action?  It will otherwise lock the
  system, only reboot comes out.

- i get the impression current video drivers for i915 are curropting memory with
  video is used for long times.  Several laptops have this issue.

## LINKS

plenty of websites and youtubes with ideas/reviews. Here are a few:

* https://store.kde.org/browse
       
* 2024: https://www.ubuntubuzz.com/2025/03/what-to-do-after-installing-kubuntu-2404-and-kde-plasma-527.html#google_vignette
* 2024: https://www.cosmoscalibur.com/en/blog/2024/que-hacer-despues-de-instalar-manjaro/
* 2020: https://averagelinuxuser.com/things-to-do-after-installing-kde-neon-2020/
* 2019: https://www.addictivetips.com/ubuntu-linux-tips/best-kde-plasma-5-widgets/
* 2018: https://www.linuxlinks.com/excellent-kde-plasma-widgets/
* 2018: https://www.osradar.com/the-best-kde-plasma-widgets/
* 2017: https://opensource.com/article/17/5/7-cool-kde-tweaks-will-improve-your-life


* 2025: https://www.youtube.com/watch?v=dKotBAKPKn4  - Customizing KDE Plasma 6 | Winter Serenity Desktop [8:26]


## OLD STUFF....

1. sometimes loose the KDE window manager. It can be restarted from
   the commandline with

       kstart plasmashell

   or

       kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell

3. the directory .local/share/baloo can get pretty big, this is for finding files (like the finder on Mac)
   but the "locate" command does functionally something very similar.
   You could turn it off.

4. Applications
    File Associations:  search for html, and make sure firefox is the first, if you install an E-book editor,
    this can be the default and is annoying.

5.  (Hardware)
     1. Input Devices

       Keyboard -
          advanced
	      caps lock behavior:   Make caps lock an additional backspace (TRYING)
	                            or:  Disabled
              position of compose key:    Right Alt				    
	      

       Keyboard -> Advanced -> Position of Compose Key -> Right-Alt
             (this way   <Right-Alt> a ` gives à)

