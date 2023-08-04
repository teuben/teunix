# Linux Kfocus XE Gen 2 w/ Kubuntu 22.04 LTS

*Draft version 3-aug-2023*

???  <--- Items starting with this line are questions Kfocus might be able to answer

I got this pre-installed linux laptop in July 2023 from
https://kfocus.org - though a few weeks before I had installed their
Kfocus Kubuntu distro on my Lenovo X1 Yoga, Gen 4, and was happy with it.  It
seems it also solved some *Xe graphics* bugs, but was more aggressive
with power. More on that below.

## Hardware choice

Kfocus currently has 3 laptop options, but I wanted a baseline around
$1000, so then it's between the XE and Ir14.  Also the M2 is really a
mobile workstation, powerful but heavy (5-7 lbs), the other two are more
like 3 lbs.

1. Ir14 has a better screen (good for my photo editing), both are 14"
2. XE has slightly better geekbench5 (5 is deprecated now, use geekbench6)
   i5-12450H vs. i7-1260P - but this may be subject to available power (see below)
3. XE has slightly better battery life (might look conflicting with previous item)
4. ??? XE has an ethernet port, 2.5GB  - website says (10/100/1000 Mbit/s)
5. XE has an SD card reader (again good for the photography)
6. Both laptops have their own proprietary powerbrick, not usb-C. That's bad, in fact it would have been
   the dealbreaker. Luckily it can also charge
   from the usb-C on the left side. With a caveat I found later, it won't reach full power,
   not even on a 100W charger, so you get maybe 70-80% of the speed. That's bad. Hopefully
   this is fixable.
7. I'm used to Lenovo's with 3 mousebuttons. Kfocus doesn't do that,
   neither does Dell.  Almost a dealbreaker too.
8. The lower left on the keyboard are in Ctrl-Fn order , not the lenovo order (Fn-Cntr) that I'm used to.
   Dell also uses the Ctrl-Fn order. Apple has another key to the left of Ctrl-Fn. Even more annoying.
9. ??? Is the keyboard one of those "spilling is ok" ones?
    
... bottom line, it became the XE (Gen 2).  Decided to start with 16GB and a rather small 256GB disk. If I like it,
both will no doubt grow. And Kfocus makes it easy to do that yourself. 

I had decided to modify two items on their default configuration options, which they happily do for you:

1. No encryption. Until I understand how to read this disk on another laptop, TPM or not.
2. Add a swap partition, 4GB. The system also comes with the usual (small, 512MB) EFI partition.
3. ??? the website seems to claim one could configure the right side USB-C for power too ???


Here are the specs: https://kfocus.org/spec/spec-xe.html


## Unboxing

Nothing special to report on the always exciting "unboxing party". I even made a few pics of the party,
but not really interesting to share here. Here are some impressions from the first hour:

1. The laptop is light, but feels a bit cheap, certainly after using my old Lenovo X1Y4.

2. ??? The motherboard is from **Insyde**. I had to hit ESC to get me in the UEFI setup (from grub), and this
   got me into the BIOS.   There might be an easier way, maybe F11 or F12?   F1 seems to run the verbose
   boot mode? The system is announced at **NV4xPZ** (e.g. on geekbench)

3. ??? The SSD is a 970 EVO plus. The 2nd slot is used by the WiFi, and it short. Question: the posted
   4TB max disksize, is that for one slot, or does this imply I can only add 2GB in the current 80mm slot?
   SDD is 2000 MB/sec (as measured with hdparm)

2. ??? I did have a strange crash after I set up my account, but I guess nothing important was missed, as the
   system booted fine after this.

4. chrome is the default browser, plasma integration works, sync works, this is nice.  I was more used to firefox,
   so this will be a battle.

5. ??? wondering if the USB I got from them the same as the Kfocus ISO online?   I didn't have to use the USB key
   since the system was pre-installed.

6. Was nice to see the extra packages being installed (DVD software, MS Fonts, virtualbox etc.) - but it's an option
   in one of the 10 steps you start with when setting it up. Most of the 10 steps I did wind up skipping.

7. It took exactly 30 minutes from turning the machine on, until I had my own software and preferences
   installed (teunix) and ran the nemobench5. That's impressive. OF course many hours of tuning and discovery
   followed.


The next thing is tuning the desktop to my favs.


## Desktop

I had already established my preferences on KDE, so a few common modifications were needed
I do on day one. A few more will come in due time. The most important ones for me are:

1. focus follows mouse, and auto-raise. for me the most important one. Such a time saver!
2. virtual in a 2x2 layout (their tiny 4x1 icons on the task manager are really tiny)
3. clicking on files opens them (the default selects them)
4. add a few candy desktop effects (fall apart, translucency, wobbly windows, magic lamp, overview)
5. screen edges: TL=Desktop Grid (TR and BR are already good for me)
6. screen locking (i don't)
7. window decorations: i add the application menu to the top left
8. keyboard: add compose as Right-Alt, but I keep forgetting how to use it
9. widgets:  I do add a few, but you need to Meta-D to view them, as my windows always block them.

A few new things I learned from the ever so helpfull and responsive kfocus staff

1. The triple finger tap the same as middle-mouse pasting the selected buffer


## Odd Hardware Things


1. my M720 Triathlon bluetooth mouse keeps disconnecting, and although the mouse can still move on the screen,
   it cannot do anthing  like copy/paste, or pick up and move a window etc.  Solution suggested by
   the Kfocus people was to switch to a virtual console (VC)  and back to X. That worked.
   In case you didn't know the trick:   ctrl-alt-F2 and then ctrl-alt-F1.  I have some suggestions
   to work on solving this.  TDB.
   
2. I got the laptop with a nice embroiled logo, but it doesn't seem well done, can collect dust
   underneath the edges that lift up a bit. Or is this normal?
   Nice addition is that there is *nothing* on this laptop. 
   even the battery is labeled "Vendor: Notebook" with "Serial Number: 0001" and "Model: BAT"
   
3. The screen opens to about 130 degrees, not the full 180. My lifestyle is that I regularly
   lie down, knee up, and the laptop resting between stomach and knee. This often results in a
   partially collapsing screen. My xps13 is the same. Two other laptops open to 180, and don't
   suffer from this. Also the hinges are not stiff enough. That could also prevent the collapse.
   
4. After the first boot the laptop worked fine for 6 days, but then the bluetoooth failed, and a
   reboot was needed.
   
5. The next day the camera was absent. No sure if I played too much with *Webcamoid*, or it was like with the
   bluetooth. A reboot did the job.  Need more days of stability to say what's going on here, same with
   previous item. Nothing to worry unless it keeps on happening.
   
6. ??? The battery is formally designed for 51.53Wh (though the label inside when I had the cover
   off said it was 53.35 Wh) but when the laptop arrived it was 56.42, almost
   10% more. On day 5 the Last Full Charge (LFC) was 54.20.  On day 8 at 54.07. I hope this is
   not continuing, or the battery might be at 50% in 10 weeks! I will need to monitor this.
   
7. ??? While on zoom, the colors in my image seem to vary a lot between red-ish tint and blue-ish tint.
   Is that auto-coloring, or a problem in the hardware?  None of my other laptops with zoom do this. And I've
   used 4 different laptops and never change the defaults.

8. The touchpad is very sensitive. Often when I type, it must accidentally hit the touchpad and
   because I used focus follows mouse, it can switch window!  Tried setting trackpad sensitivity,
   no good solution yet.
   
9. Imprints of keyboard on screen. Need that cover and/or cleaning thing. Very normal for laptops.

10. ??? SD card was advertised as '6 in 1'  but it says '3 in 1' on the placeholder insert.
    That insert is actually very hard to get out. The SD card sticks about half out of the
    laptop, so be careful with walking around with it.
    Website says: 1 x 6-in-1 Card Reader (MMC / RSMMC / SD / mini SD / SDHC / SDXC)

11. Iris Xe graphics listed online, but is KDE *About this system* reported a Mesa Intel Graphics. To add
    to the confusion, **lscpi** reported *Alder Lake-P Integrated Graphics Controller*

12. ??? Ethernet port does not have the comforting green/orange lights to tell me what speed it's at

13. ??? Sound is not very loud. but can use the *Raise Maximum Volume* on the *Audio Volume* widget 

14. ??? The table on their website says there's a "Mini Display-Port 1.4", but I didn't see it. Just HDMI.
    Or is the the *USB-C with DisplayPort 1.4* on the right side, and you need an adaptor?

15. Twice now I lifted the laptop by the base, and didn't touch the touchpad or mouse, and it decided
    to logout. this was super annpying, as I lost my shell sessions. apps come back , even emacs remembers
    it's sessions, but Konsole cannot.

16. ??? The FlexiCharger option in the BIOS was disabled. It was suggested on the web site as a good thing,
    but in the BIOS it says that it will make the battery reporter in-accurate. True for Linux too?
    Website says: *Use FlexiCharger BIOS option to maximize battery life for laptops frequently plugged-in for long periods*

17. ??? I took the back-cover off to see how easy it was to replace components. It's easest to start in the
    back corners, one you've opened it a bit, it snaps off all the way pretty easily. There are 14 screws!
    One oddity, the two back corner screws are slightly bigger, so keep them separate. BTW, the website says
    12 screws.

18. I swear I've now closed the lid a few times, and it didn't go to sleep. Lost some battery juice over it.
    This is a common experience with linux though. Sometimes it works, sometimes it doesnt.  Even the "sleep"
    button doesn't seem to work all the time.  If it's in sleep, it seems to use about 2W. Seems a bit high.

## Odd Software things

1. When I close the *Discover Software Center* using the X in the top right corner,
   it claims it *closed unexpectedly* in a notification.
   When I re-open it, and X it again, no messages. Happens all the time.

2. Touchpad settings in KDE:    kfocus has 5.24.6, but my dell has 5/25/5 and is less capable (e.g. no tabs)
   This may be a KDE thing though.
   it's less sensitive, so was wondering if I could check their settings.

3. Insync, looked nice, but it's for money, now i don't want it.
   But now it starts up from the startup.  Had to remove it from *Autostart*.

4. The confusing power management (but see below). There are multiple apps.
   

## Power Management

This deserves a whole section, as I'm solidly confused. I also never see my freq go even above 3GHZ, and
when not on K-power (ie on USB-power or battery) I never get more than 80% of speed.

max power on battery cannot be achieved. I even used the 'Kfocus Power and Fan' app

a few tools were not installed by default, which I played with

* cpupower
* cpupower-gui
* cpufrequtils
* indicator-cpufreq - this will go into the widgets on the bottom panel
* s-tui

tried a few things

     sudo thermald --adaptive --ignore-cpuid-check
     sudo cpupower set --perf-bias 0
     sudo cpupower frequency-set --governor performance

     sudo cpupower frequency-set -d 4000MHz -u 4000MHz
     sudo cpupower frequency-set -d 4000MHz -u 4000MHz -g performance

I can go to NB5=808, 865 now, on battery. That;s up from 500-600 before.

Then on K-power, some items dropped a notch, but got NB5=1192.  Increased the notch  1215..
more of those sudo, then 1075. nuts.







