#  Windows 11


This time a real piece of hardware.  A Lenovo Thinkpad T14. Much too fine a laptop to have it running windows.

The install is the first thing you're forced to go through. I don't know why this can't be done in 10 seconds,
it took 3 or 4 reboots and 14 minutes of aggrevation.

## Executive Summary

- Set up my own plus a local account
- WSL2 installed (runs ubuntu inside of windows)
- copy and paste ala X windows working (quite essential) 
- micro-emacs compiled and installed as my quick goto editor
- NEMO installed, including pgplot graphics.   nemobench5 scored a respectable 1170 on this i5-1235U
- anaconda3 (2023-09-0) installed - thought spyder doesn't work. dunno how to start a notebook either in WSL2

## To be resolved

- Qt not working (e..g qtrun)
- network from WSL2 can't go outside???


## Local Accounts?

I could not figure out how to do this. But I was able to make a local "astro" guest account.

## MS Account

I had to recover my account, but with a PIN I can now login.   Chromebook do that too.

## WSL2

This is probably the more useful.   MS has a lot of good info on https://learn.microsoft.com/en-us/windows/wsl/install
and there are numerous website with additional helpful guidance.
By default WSL is not installed, so open a powershell and issue

      wsl --install

it will be quick, just few mins. System needs to reboot after (really, again?). That's another amazing deal with MS. Where
the heck is the reboot button.  Ah, it's ctrl-alt-del and there's a power button on screen :-)    who would have thought of
that!

After reboot, it will prompt for a new username, and password, the linux style.  It's interesting to note that installing
Windows took so long, and installing WSL2 took maybe 2 minutes (but with a reboot).


Installing development packages was a bit confusing, but after a

      sudo apt-get update

it was fine and found things like make, gcc, g++, gfortran.

Next stumbling block: copy and paste.    The select with left mouse , and middle click didn't work. Another advertised
shift-ctrl-C and shift-ctrl-V didn't. More aggrevation. OK< the solution here was to add this to the properties of the
WSL window. Right click on the title bar and select *Properties*, and enable the "Use Ctrl+Shift+C/V as Copy Paste" option.



## Apps

### Python 3.11

Might not be what I want, since i want anaconda3. But the MS app store has this available

### Anaconda3

Just go to anaconda.com and do the download.  But I used the installation for all users option.  Another restart was required for this.

Comes with a navigator. Now at 2.5.1   Spyder can be launched from it.



### Github

Nothing matches the App store now.   Just go to github desktop.   Also on desktop.github.com and download. Once logged in, and
authenticated (2FA now), it needs to auteh

### Drive for Desktop 

## Technical Details

T40 - 32GB memory,  1TB disk.   1920x1200 .    i5-1235U

Win11-Pro. (22H2) build 22621.4


## Useful Links


* https://learn.microsoft.com/en-us/windows/wsl/setup/environment
