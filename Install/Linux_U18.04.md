# Linux  Ubuntu 18.04 LTS

This is going to be my attempt to use KDE for real. I already gave up on Gnome3 after
Unity was going to be abandoned. It has gotten more and more issues anyways.
In gnome one nuisance was the large amount of work needed to set up my preferred environment,
needing to adjust and add
a lot of 'widgets'. How is one then to port such an environment to another machine?
KDE is not a lot better, but seems more manageable.

## My KDE Setup

KDE can be confusing, because settings appear in different places (menus/applications....). Some of this
work is painful if you have to repeat it many times, so it would be nice to have a programmatic way
to do this for a virgin account.

1. Configure Desktop (under the triple-bar in top right default widget)
2. Add Widgets (in various places)
3. Activities (not to be confused with multiple desktops)
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

3. the directory .local/share/akonadi can get pretty big

## Linux for Development

* https://www.ostechnix.com/simple-script-setup-development-environment-ubuntu/
  * https://github.com/sojharo/mangi-script/    This does a lot, but isn't really my taste.
