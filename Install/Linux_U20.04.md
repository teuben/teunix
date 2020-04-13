# Linux  Ubuntu 20.04 LTS

This description is currently being revised, as I plan to transition from 18.04 to 20.04

Before we start, there are two ways to install U20:  fresh  and updating from U18. My
experience has always been that the former is more stable. More than often weird things happen
when you upgrade. I've heard this from multiple sources. YMMV.

Secondly, installing a desktop based OS is getting pretty involved, and taking the better
part of the day. This is hard, many people keep thus running on their OS version for a longer
than should be needed time.

1. Install a few hundred packages
2. Install and configure the various KDE components
3. Install plugins for various apps (firefox, thunderbird, gimp, ....)
4. Setting up your personal shell (and other dotfiles)
5. Install 3rd party applications (zoom, slack, ..)

## What packages are there?

The following commands make a listing which I frequency consult via grep:

      apt-cache search  .  > apt-cache0.list
      apt-cache pkgnames   > apt-cache1.list

## Why I don't like GNOME3

I don't know, I simply can't get used to it. On Ubuntu they make it
look like the old Unity desktop, which at one time I did get used to
and almost liked, and now GNOME3 has the shell extensions, something
very simular to the KDE widgets. But:

1. By default shell extensions are not enabled
2. To enable, you need to install "gnome-tweaks"
3. Within the "gnome-tweaks" there are a few that can be enables, but the bulk goes via a firefox/chrome plugin!
4. https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/
5. To connect the desktop with that extension, you need to install "chrome-gnome-shell"
6. In firefox/chrome there is now a little gnome foot icon, which is the entry point to maintaining your extensions.
   You can search through (as of this writing) 124 pages of 10 extensions per page...  But pick current version only,
   and it's only 13 pages. Uninstalling and confuring is annoying too.  You do that best from the Tweaks->Extensions tool.

This overly complex workflow really does not make me feel warm and
fuzzy. I tried it again with 20.04, because last time I tried this it
was very frustrating to see that the majority of extensions simply
didn't work (author maintenance issues perhaps). I had the same experience again. The first two a red ERROR came up, go
figure where the message is. The third one seems to work, so at least my workflow is ok.

Compare this to KDE, none of these 6 steps are needed. Simply
right-click to "install widget" (although for newcomers the installion
of a widget is arguably non-intuitive).

### My favorite tuning:

1. Tweaks -> Windows -> Raise Windows When Focused + Focus on Hover
2. Tweaks -> Workspaces : 4 (static)
3. Tweaks -> Top Bar -> Clock: Weekday / Date / Seconds
4. Settings -> Appearance -> Light (there is NO contrast top bar and top window edge)
5. Settings -> Appearance -> Dock : Icon size 32 (default is too big)



## My KDE Setup

KDE can be confusing too, because settings appear in different places
(menus/applications....). Some of this work is painful if you have to
repeat it many times, so it would be nice to have a programmatic way
to do this for a virgin account. Unlike in GNOME, changing a setting is
not applied until you hit the Apply button on each screen....


A. Configure Desktop (right click)
      Wallpaper -> Layout -> pick:  'Desktop' or 'Folder View'
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
	        - put application menu top left

   (Workspace)
1. Workspace Bahavior
       General Behavior
           click behavior : single
       Desktop Effect
           Mouse Mark (shift-meta to draw, shift-meta-F11/F12 to erase)
	   Magic Lamp (vs. squash)
	   Fall Apart
       Screen Edges
           - TL:   Desktop Grid
           - TR:   Present windows current desktop
           - BR:   Present windows all desktops
	   - TM:   Krunner
                   https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/
	   	   this will enable krunning to find tabs in mozilla
	   Switch desktop on edge:  Only when moving windows
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
       Window Rules
       
3. Shortcuts
       Global Shortcuts
           Kwin 
               Switch One Desktop Down
               Switch One Desktop Left
               Switch One Desktop Right
               Switch One Desktop Up

   (Personlization)
7. Online Accounts
      make a google account, this will give you access to google Drive etc.

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


- Task Manager (on bottom bar) may need some tinkering:
      Appearance
	  ?  i don't understand what max.rows and the checked item do ??
      Behavior
          - grouping of tasks -> 
      	  - show tasks for all desktops
      - resize it a bit, it's too tall for my taste

TO BE SOLVED:


https://github.com/shalva97/kde-configuration-files/


SAVING YOUR SESSION
- there is no good tool, there is kwriteconfig5/kreadconfig5
- best is to save ?
     ~/.config/kdeconnect  -R
     ~/.config/k*rc
     ~/.kde/share/config
     ~/.kde/share/apps
     ~/local/share


OLD STUFF....

   
2. Add Widgets (in various places)
3. Activities (not to be confused with multiple desktops as displayed in the Pager)
4. Window Manager Settings (from top left "More Actions->")
   * Window Decorations -> Buttons
     - Application Menu drag it to TL  [DUBIOUS NOW IF THAT"S USEFUL, BUT IT DOES CUT DOWN ON VERTICAL SPACE]
   * Desktop Effects
   * Screen Edges (hot corners)
     - TR:   Present windows current desktop
     - BR:   Present windows all desktops
     - TL:   Desktop Grid
   * Focus:
     * click "focus follows mouse - ...." (setting 4/6)  CHECK
     * raise on hover, delayed by 750ms
5. From the System Settings there are:
   1.  Workspace Theme
   2.  Application Style
   3.  Desktop Behavior
       * Screen Locking
       	 
       * Virtual Desktops
       	 * Desktops  :  6 desktops, in 2 rows
	 * Switching :  - do not wrap around
	     	        - cube animation [MAYBE CUTE]
	                - enter the 4 ctrl-alt up/down/left/right arrows = [ANNOYING MANUAL LABOR]
   4.  Hardware
       * Input Devices
       	 *  Mouse
	    - no need to do Reverse Scrolling (Mac calls this natural scrolling)
	    - Single Click to open files and folders
   5.  Power Management
       * Energy Saving : on my laptop they did not get properly populated at all, that was bad.
       	 -  Dim Screen    1-5 min
	 -  Screen Energy Saving
	 -  Suspend session
	 
       


## issues

1. sometimes loose the KDE window manager. It can be restarted from
   the commandline with

       kstart plasmashell

2. application menu issues I had under 17.10 with chrome and thunderbird were bad.

3. the directory .local/share/akonadi can get pretty big, this is for finding files (like the finder on Mac)
   but the "locate" command does functionally something very similar.

   ->  is this now baloo in 20.04 ??

## Linux for Development

* https://www.ostechnix.com/simple-script-setup-development-environment-ubuntu/
  * https://github.com/sojharo/mangi-script/    This does a lot, but isn't really my taste.

## Thunderbird

your_name@gmail.com
imap.gmail.com SSL 993
smtp.gmail.com SSL 465

calendar: 2 add-ons:  Lightning and Google Provider

## GNOME/KDE

GNOME3 uses:  dash (ubuntu dock on the side), dock, message tray (top bar)

KDE uses: panel, latte dock (mac lookalike), 

## Install

Here is what I have now (Mar 31)

     Operating System: Kubuntu 20.04
     KDE Plasma Version: 5.18.3
     KDE Frameworks Version: 5.68.0
     Qt Version: 5.12.5
     Kernel Version: 5.4.0-21-generic
     OS Type: 64-bit
     Processors: 8 × Intel® Core™ i7-8550U CPU @ 1.80GHz
     Memory: 15.3 GiB of RAM
