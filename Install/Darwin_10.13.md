# High Sierra (10.13.2)

Received brand new spanking MacBook Pro to try out. Just a few days after my first Darwin 10.12 was on my
desk. Coincidence?   This laptop has two USB-C's on the left and two on the right. That might be nice, but
you have to click it in really hard (until you hear the click) to get the connection. Not easy to get out,
small, and slippery hands will cause problems.

Getting a bluetooth mouse was a good choice. The trackpad is something for experts, doesn't translate well
between Mac and Linux. Good thing is that the middle mouse button does seem to paste with the middle mouse
after the left mouse button has selected.
 

## Install

Here's stuff I did:

1. Fix the mouse scrolling to be not natural but "normal":
   sys pref -> trackpad -> scroll & zoom -> tick off the natural (first checkmark)

2. Install google chrome

3. Install libre office

4. Install Xcode V9.2 (again, they need your credit card) - there is some question if you can get away with
   not installing the whole 2GB but just doing the "command line utilities/tools"

5. Install install_PandExo (a miniconda2) as a test

6. Install Homebrew (not Macports... yet)

   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

   a. brew install cvs cmake tkdiff gcc wget
   b. brew install gcc    [also does gfortran]
      Potential problem:   /usr/bin/gcc and /usr/local/bin/gfortran ???

7. Install CASA - now the pre-release is available for high sierra as of a few days ago.

   a. Note the CASA team recommends port, not brew.

8. Install sublime editor :  https://www.sublimetext.com/

9. Install a better terminal: https://www.iterm2.com/

10.  Install XQuartz : https://www.xquartz.org/ - needed if you need to compile and run X.org based application.
    I believe this installs the all important /opt/X11 tree


### Install to do

*.  ds9 from dmg or tgz ?? pros and cons?

*.  ssh remote access:   System Preferences -> Sharing  -> checkbox "Remote Login" from left panel



system_profiler SPPowerDataType
