# Linux  Ubuntu 20.04 LTS

This description is currently being revised, as I modify it from 18.04 to 20.04

Before we start, there are two ways to install U20:  fresh  and updating from U18. My
experience has always been that the former is more stable. More than often weird things happen
when you upgrade.

Secondly, installing a desktop based OS is getting pretty involved, and taking the better
part of the day. Why?

1. Install a few hundred packages
2. Install and configure the various KDE components
3. Install plugins for various apps (firefox, thunderbird, gimp, ....)
3. Setting up your personal shell


## My KDE Setup

KDE can be confusing, because settings appear in different places (menus/applications....). Some of this
work is painful if you have to repeat it many times, so it would be nice to have a programmatic way
to do this for a virgin account.


1. Configure Desktop (right click)
    Wallpaper -> Layout -> pick:  'Desktop' or 'Folder View'
    Mouse Actions ->  Add Action -> Left Button -> Switch Activity -> Apply
2. Window Management
     Window Behavior
       Focus -> Focus follows mouse (mouse precedence)
       Raising Windows -> Raise on hover
3. Workspace Bahavior
     General Behavior
       ? click behavior (single or double)
     Desktop Effect
     Screen Edges
       - TR:   Present windows current desktop
       - BR:   Present windows all desktops
       - TL:   Desktop Grid
     Screen Locking
       only after waking from sleep
       allow unlocking wihtouth password for 65"
     Virtual Desktop
        6 desktops in 2 rows
        navigation *do not* wrap around
        show on-screen display when switching
4. Power Management
     Energy Saving : on my laptop they did not get properly populated at all, that was bad.
       -  Dim Screen    1-5 min (was default)
       -  Screen Energy Saving
       -  Suspend session


- Task Manager (on bottom bar) may need some tinkering:
  - grouping of tasks	 
  - tasks per desktop?

TO BE SOLVED:

- the meta key doesn't open for typing and app name



OLD STUFF

   
2. Add Widgets (in various places)
3. Activities (not to be confused with multiple desktops as displayed in the Pager)
4. Window Manager Settings (from top left "More Actions->")
   * Window Decorations -> Buttons
     - Application Menu drag it to TL  [DUBIOUS NOW IF THAT"S USEFUL, BUT IT DOES CUT DOWN ON VERTICAL SPACE]
   * Desktop Effects
   * Screen Edges
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
