# KDE

My KDE setup. See also more details in the various Linux*md installation notes.
Typically my desktop has:

- KDE
- focus follows mouse with auto-raise
- single click opens files and directories
- kdeconnect for the phone
- krunner for desktop/browser searching
- 3H x 2V virtual desktops, single activity


## My KDE Setup (short version)

This follows Ubuntu 22.04 - KDE Plasma 5.27.9 / Frameworks 5.104.0

1. Workspace Bahavior
       General Behavior
           clicking files or folders:
	       select "Opens Them" (this will cause single click to enter directory or open file)


2. Window Management
       Window Behavior
           Focus -> Focus follows mouse (mouse precedence)
           Raising Windows -> Raise on hover [750ms is the default, perhaps 500ms better)

3. Input Devices
   - Touchpad
     - Tapping:  tap-to-click
     - make sure not to invert scrolling
     -  ?	  [middle mouse is missing???]

4. Power Management

        Energy Saving : on my laptop they did not get properly populated at all, that was bad.
           -  Dim Screen    1-5 min (was default)
           -  Screen Energy Saving (switch off after 
           -  Suspend session:  check this off (i.e. do it manually)

        Energy Saving : 
           -  Dim Screen    1-5 min (was default)
           -  Screen Energy Saving (switch off after 20 mins)
           -  Suspend session:  check this off (i.e. do it manually) - this way screen stays on

	Workspace Behavior -> Screen Locking
	   - uncheck automatic locking after (15) mins

5. Configure Icons-only Task Manager Settting
   - Appearance
     i don't understand what max.rows and the checked item do ??
   - Behavior     
       - Clicking grouped task:   Show large window previews   [this is different in U23]
                                  Show "Present Windows' effect [in U22 ?]
       - Sort:                    "By Desktop"
       - Show only tasks:         (only) "from current activity"

6. CONFIGURE DIGITAL CLOCK
   * Appearance: Show seconds, 24-Hour Time display, Custom Date format "ddd MMM d"
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

 
## My KDE Setup (confusing long version from latest Install*md)

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
		   
	   Switch desktop on edge:  Only when moving windows (fun shortcut to move [new] window)
       Screen Locking

       Virtual Desktop
           4 desktops in 2 rows              (navigation shortcuts come later)
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
          uncheck  "make location bar editable"
	  check    "show filter bar"
          uncheck  "Open new folders in tabs"
	  check 2x "show full path..." 

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


A word on tinkering here: For the current Kubuntu the basic default setting for
most are called Breeze. There are probably 10^18 different combinations, if not more.


## Misc KDE notes

- if you save your desktop, this is maintained in a file ~/.config/ksmserverrc
- if you use kdewallet, some system files (e.g /etc/NetworkManager/system-connections/) will
  not be maintained by the system, but by the wallet
- if you use gdm3 (e.v. via PopOS!) it will not set up ssh-agent for you
  it seems using sddm  will do this (see /etc/sddm/), which is the KDE default in most cases
- mounting encrypted (luks) drives magically worked



- switching windows via mouse scroll often locks the computer,, reboot is needed
