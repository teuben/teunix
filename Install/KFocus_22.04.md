# Linux Kfocus XE Gen 2 w/ Kubuntu 22.04 LTS

*Draft version 10-dec-2023*

I got this pre-installed linux laptop in July 2023 from
https://kfocus.org - though a few weeks before I had installed their
Kfocus Kubuntu distro on my Lenovo X1 Yoga, Gen 4, and was happy with it.  It
seems it also solved some *Xe graphics* bugs, but was more aggressive
with power. More on that below.

## Hardware choice

Kfocus currently had 3 laptop options when I got it, but I wanted a baseline around
$1000, so then it's between the XE and Ir14.  Also the M2 is really a
mobile workstation, powerful but heavy (5-7 lbs), the other two are more
like 3 lbs and offer better battery life.

1. Ir14 has a better screen (good for my photo editing), both are 14"
2. XE has slightly better geekbench5 (5 is deprecated now, use geekbench6)
   i5-12450H vs. i7-1260P - but this may be subject to available power (see below)
3. XE has slightly better battery life (might look conflicting with previous item)
4. XE has an ethernet port, 2.5GB  - even though the website says "10/100/1000"
5. XE has an SD card reader (again good for the photography)
6. Both laptops have their own proprietary powerbrick, not usb-C. That's bad, in fact it would have been
   the dealbreaker. Luckily it can also charge
   from the usb-C on the left side. With a caveat I found later, it won't reach full power,
   not even on a 100W charger, so you get maybe 70-80% of the speed. That's bad. Hopefully
   this is fixable.
7. I'm used to Lenovo's with 3 mousebuttons. Kfocus doesn't do that,
   neither does Dell.  Almost a dealbreaker too, but the touchpad can do
   two or three finger middle mouse button (paste).
8. The lower left on the keyboard are in Ctrl-Fn order , not the lenovo order (Fn-Cntr) that I'm used to.
   Dell also uses the Ctrl-Fn order. Apple has another key to the left of Ctrl-Fn. Even more annoying.

... bottom line, it became the XE (Gen 2).  Decided to start with 16GB and a rather small 256GB disk. If I like it,
both will no doubt grow. And Kfocus makes it easy to do that yourself!

I had decided to modify two items on their default configuration options, which they happily do for you:

1. Did not add encryption. Until I understand how to read this disk on another laptop.
   * No TPM is used, ubuntu uses **luks**. See https://kfocus.org/wf/recovery.html#bkm_use_chroot_to
   * It should be noted that ubuntu's *vault* uses CryFS, EncFS or gocryptfs.
2. Add a swap partition, 4GB. The system also comes with the usual (small, 512MB) EFI partition. Later
   I found at that Firefox is a nasty memory grabber, and I often got into swapping wars where the machine
   became unresponsive.
3. Some website seems to claim one could configure the right side USB-C for power too. Not true, but you
   can convert barrel (5.5x2.5mm) to usb-C with an $8 adaptor. Even more odd, my 65W and the barrel adaptor
   still gave me full compute power (see below)
   


Here are the specs: https://kfocus.org/spec/spec-xe.html

## Summary:

After a few months of use, what's the bottom line for me?

1. Super annoying that under USB-C power (even if it delivers 90W) i can only get about 70% of the performance
   from being on 90W barrel charger. Oddly enough a 65W charger and the barrel converter gives me full performance
   at 4.7GHz

2. The internal speakers suck. For zoom I need to hook up something external. Watching movies is also a pain.

3. The hinges on the display are not stiff enough, they often collapse on me when doing comfy computing.
   It doesn't help that the hinges only open to 130 deg, not 180.


4. The sleep mode doesn't always work, overnight the battery is empty. Only positive point to note here
   is that unlike for example Dell and Thinkpad, it will boot up right away. My others need to be on
   charge for 10 or 20 minutes as they seem to want some minimum charge before even booting.
   I have a thinkpad on kfocus as well, it seems to sleep fine and really use very few watts. On one
   case K2 was using 7W during a sleep.
      
5. Several times now my desktop preferences (e.g. hot corners, power savings setting) have been reset. Did
   this happen during a package update?   I have a thinkpad laptop on the kfocus as well, same issue. Never
   seen this on regular kubuntu.

6. There are still issues with the mouse or desktop. I then need to use ctrl-alt-F2 and F1 to get back to plasma.

7. The ethernet port is NOT 2.5Gb, tested with USB-c dongle that does give me 281 MB/s, where the builtin
   gave me 113 MB/s. Clearly just a 1000Mbit.gi


## Unboxing

Nothing special to report on the always exciting "unboxing party". I even made a few pics of the party,
but not really interesting to share here. Here are some impressions from the first hour:

1. The laptop is light, but feels a bit cheap, certainly compared to using my old Lenovo X1Y4.

2. The motherboard is from ..., the BIOS from **Insyde**. I had to hit ESC to get me in the UEFI setup (from grub), and this
   got me into the BIOS.   F2 gets you directly into the BIOS setup.  F1 seems to run the verbose
   boot mode? The system is announced at **NV4xPZ** (e.g. on geekbench)
   BTW, the BIOS has very few options, like very few.
   
3. The SSD is a 970 EVO plus. The 2nd slot is used by the WiFi, and is the usual short one. The maximum disk size is whatever
   your hardware can fit on one slot.  Might have to be single sided though ???
   SDD is 2000 MB/sec (as measured with hdparm) - website claims it should be 3500 MB/sec, hmmm.

3. I did have a strange crash after I set up my account, but I guess nothing important was missed, as the
   system booted fine after this.

4. Chrome is the default browser, plasma integration works, sync works, this is nice.  I was more used to firefox,
   so this will be a battle. firefox default is a snap, which also limits the kruler integration.

5. The complimentary USB key is empty, better (ISO) media can be found online at https://kfocus.org/try

6. Was nice to see the extra packages being installed (DVD software, MS Fonts, virtualbox etc.) - but it's an option
   in one of the 10 steps you start with when setting it up. Most of the 10 steps I did wind up skipping.

7. It took exactly 30 minutes from turning the machine on, until I had my own software and preferences
   installed (teunix) and ran the nemobench5. That's impressive. Of course many hours of tuning and discovery
   followed.


The next thing is tuning the desktop to my favs.


## Desktop

I had already established my own preferences on KDE, so a few common modifications were needed
I do on day one. A few more will come in due time. The most important ones for me are:

1. focus follows mouse, and auto-raise. for me the most important one. Such a time saver!
2. virtual in a 2x2 layout (their tiny 4x1 icons on the task manager are really too tiny)
3. clicking on files opens them (the default selects them)
4. add a few candy desktop effects (fall apart, translucency, wobbly windows, magic lamp, overview)
5. screen edges: TL=Desktop Grid (TR and BR are already good for me)
6. screen locking (i don't)
7. window decorations: i add the application menu to the top left
8. keyboard: add compose as Right-Alt, but I keep forgetting how to use it
9. widgets:  I do add a few, but you need to Meta-D to view them, as my windows always block them.

A few new things I learned from the ever so helpfull and responsive kfocus staff

1. The triple finger tap the same as middle-mouse pasting the selected buffer. Later I switched touchpad software
   and made two finger tap the middle-mouse (pasting) action.


## Odd Hardware Things


1. my M720 Triathlon bluetooth mouse keeps disconnecting, and although the mouse can still move on the screen,
   it cannot do anthing  like copy/paste, or pick up and move a window etc.  Solution suggested by
   the Kfocus people was to switch to a virtual console (VC)  and back to X. That worked.
   In case you didn't know the trick:   ctrl-alt-F2 and then ctrl-alt-F1.  I have some suggestions
   to work on solving this.  TDB. - the new patch Mike did seems to do the trick.
   
2. I got the laptop with a nice embroiled logo, but it doesn't seem well done, can collect dust
   underneath the edges that lift up a bit. Or is this normal?
   Nice addition is that there is *nothing* on this laptop. 
   even the battery is labeled "Vendor: Notebook" with "Serial Number: 0001" and "Model: BAT"
   
3. The screen opens to about 130 degrees, not the full 180. My lifestyle is that I regularly
   lie down, knee up, and the laptop resting between stomach and knee. This often results in a
   partially collapsing screen. My xps13 is the same. Two other laptops open to 180, and don't
   suffer from this. Also the hinges are not stiff enough. That could also prevent the collapse.
   
4. After the first boot the laptop worked fine for 6 days, but then the bluetoooth failed, and a
   reboot was needed. Hasn't happened since.
   
5. The next day the camera was absent. No sure if I played too much with *Webcamoid*, or it was like with the
   bluetooth. A reboot did the job.  Need more days of stability to say what's going on here, same with
   previous item. Nothing to worry unless it keeps on happening.
   
6. ??? The battery is formally designed for 51.53Wh (though the label inside when I had the cover
   off said it was 53.35 Wh) but when the laptop arrived it was 56.42, almost
   10% more. On day 5 the Last Full Charge (LFC) was 54.20.  On day 8 at 54.07.
   I will need to monitor this, as you do expect to see a slow  decline. Here are some Last Full Charges:
   1. Aug 1:  56.42
   2. Sep 27:  52.29
   3. Dec 8: 49.14 
   
7. ??? While on zoom, the colors in my image seem to vary a lot between red-ish tint and blue-ish tint.
   Is that auto-coloring, or a problem in the hardware?  None of my other laptops with zoom do this. And I've
   used 4 different laptops and never change the defaults.

8. The touchpad is very sensitive. Often when I type, it must accidentally hit the touchpad and
   because I used focus follows mouse, it can switch window!  Tried setting trackpad sensitivity,
   no good solution yet. Changed touchpad software, more on this later.
   
9. Imprints of keyboard on screen. Need that cover and/or cleaning thing. Very normal for laptops.

10. ??? SD card was advertised as '6 in 1'  but it says '3 in 1' on the placeholder insert.
    That insert is actually very hard to get out. The SD card sticks about half out of the
    laptop, so be careful with walking around with it.
    Website says: 1 x 6-in-1 Card Reader (MMC / RSMMC / SD / mini SD / SDHC / SDXC)

11. Iris Xe graphics is listed online, this is Intel's marketing term. You might find KDE reporting it as a Mesa Intel Graphics.
    To add to the confusion, **lscpi** reported *Alder Lake-P Integrated Graphics Controller*

12. Ethernet port does not have the comforting green/orange lights to tell me what speed it's at. Still have to test if it
    works at 2.5Gb, one of the reasons I got this laptop.

13. Sound is not very loud. but can use the *Raise Maximum Volume* on the *Audio Volume* widget, but still,
    it's underpowered. Should use my dB app on the phone.

14. ??? The table on their website says there's a "Mini Display-Port 1.4", but I didn't see it. Just HDMI.
    Or is the the *USB-C with DisplayPort 1.4* on the right side, and you need an adaptor? Maybe not
    understanding the lingo.

15. Twice now I lifted the laptop by the base, and didn't touch the touchpad or mouse, and it decided
    to logout. this was super annpying, as I lost my shell sessions. apps come back , even emacs remembers
    it's sessions, but Konsole cannot.

16. ??? The FlexiCharger option in the BIOS was disabled. It was suggested on the web site as a good thing,
    but in the BIOS it says that it will make the battery reporter in-accurate. True for Linux too?
    Website says: *Use FlexiCharger BIOS option to maximize battery life for laptops frequently plugged-in for long periods*

17. I took the back-cover off to see how easy it was to replace components. It's easest to start in the
    back corners, one you've opened it a bit, it snaps off all the way pretty easily. There are 14 screws!
    One oddity, the two back corner screws are slightly bigger, so keep them separate. BTW, the website says
    12 screws. New pictures on website also clearly show 14 screws.

18. I swear I've now closed the lid a few times, and it didn't go to sleep. Lost some battery juice over it.
    This is a common experience with linux though. Sometimes it works, sometimes it doesnt, but this laptop
    seems to be worse. Even the KDE "sleep" button doesn't seem to work all the time.
    If it's in true sleep, it seems to use about 2W. Still seems a bit high.

19. The keyboard is **not** one of those "spilling is ok" ones!! There are some that claim you can spill on them,
    so be careful with this one.

20. The 90W barrel charger takes XX hours to charge (seems long), and a 90W charger on the usb-C port takes
    even longer (XX hours). Compared to some other common laptops I have, this seems long/slow.
    Perhaps a good solution is a barrel-USB converter, so normal USB-c power can be used
    chicony  A16-090P1A    19v-4.74A 90W      Tip: 5.5 x 2.5mm 
    I tried two solutions: one converter with a small wire between them components,
    *cablecc Type C USB-C Female Input to DC 5.5x2.5mm Power PD Charge Cable fit for Laptop 18-20V *
    or this single *chenyang USB C to DC 20V 5.5x2.5mm PD 65W Emulator Trigger 90 Degree Angled Converter Adapter *
    Interesting to note that a 65W power with converter in the barrel still gave me full compute power (i.e. 4.7GHz)

## Odd Software things

1. When I close the *Discover Software Center* using the X in the top right corner,
   it claims it *closed unexpectedly* in a notification.
   When I re-open it, and X it again, no messages. This is a harmless KDE problems, should
   be fixed in the next upgrade (Plasma 5.24.7 -> 5.27.7)

2. Touchpad settings in KDE:    kfocus has 5.24.6, but my dell has 5/25/5 and is less capable (e.g. no tabs)
   This may be a KDE thing though.
   it's less sensitive, so was wondering if I could check their settings.
   NOTE:   this was triggered by the new setting of the touchpad via 

3. Insync, looked nice, but it's for money, now i don't want it.
   But now it starts up from the startup.  Had to remove it from *Autostart*. I also got added to their
   mailing list. Had to unsubscribe.

4. The confusing power management (but see below). There are multiple apps.
   

## Power Management

Executive summary: The peak 4.7 GHz can only be achieved via the barrel charger on the right,
on left side USB-C charger the peak is 4.2, on battery the peak seems to be 3.8.
Base seems to be 2.5GHz  (website says base is 2.1)

This deserves a separate section, as I got solidly confused. I also
never see my freq go even above 3GHZ, and when not on K-power (ie on
USB-power or battery) I never get more than 80% of speed.

max power on battery cannot be achieved. I even used the 'Kfocus Power and Fan' app.

Using a good tool to show the CPU frequencies gave the best indication wht's going on here.
The command **cpufreq-aperf** seems to give frequent  updates, but it also seems to be incorrect,
as I saw freqs over 5GHz pop up. The best is to add a graph to the **System Monitor**:
"+Add New Page..." -> Name=CPUfreq -> click to show the right panel -> Display Style = Line Chart ->
Sensors = [Group]CPU -> [Group]Clock Frequency(MHz) -> Save Changes.

On the USB-C charger I would get 4.2GHz at best, while the K-power would give 4.7GHz. Clearly something
is limiting the CPU frequencies to go above 4.2.  The tool **cpupower-gui** does not seem to
have any influence.

On battery we get about 3.6 GHz.

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

I can go to NB5=808, 865 now, on battery. That's up from 500-600 before.

Then on K-power, some items dropped a notch, but got NB5=1192.  Increased the notch  1215..
more of those sudo, then 1075. nuts.







## Welcome Session

This is probably the most thrilling about getting a KFocus
laptop. They offer a 30 minute welcome session, complimentary.
I decided to take them up on this offer, but not after I had played
for a week and at least ran into some questions. This is done using
google desktop shared, a first for me too.  Kfocus could control
my desktop, we tried out several optimizations.The most useful for
me was how to add new pages to the System Monitor, notably the CPU
frequencies from which we learned so much.  We tried working on that
mousepad sensitiviy problem, but it's still plagueing me.


## Comparing CPUs

With all of this experimenting, I had to compare the Ir14 and XE/2 options again.

* https://nanoreview.net/en/cpu-compare/intel-core-i7-1260p-vs-intel-core-i5-12450h
* https://www.cpu-monkey.com/en/compare_cpu-intel_core_i7_1260p-vs-intel_core_i5_12450h
* https://www.cpubenchmark.net/compare/Intel-Core-i7-1260P-vs-Intel-Core-i5-12450H/4707vs4727
* https://www.topcpu.net/en/cpu-c/intel-core-i7-1260p-vs-intel-core-i5-12450h

Both processors were released Q1/2022


                         i7-1260p             i5-12450H
     Cores/Threads       12C/16T              8C/12T
     physical cores      4                    4
     performance         4                    4
     efficiency          12                   8
     L1/L2/L3            768KB, 4.0MB, 18MB   384KB, 2.0MB, 12MB
     base freq A/B       2.1 / 1.5            2.0 / 1.5
     peak peak A/B       4.7 / 3.4            4.4 / 3.4
     graphics            Iris Xe (96EU)       UHD (48EU)
     TDP (PL1)           20-28                35-34
     Max Boost TDP (PL2) 64W                  95W or 115W
     Geekbench5          1607/9088            1650/7786
                         1756/9118            1622/8410
     Geekbench6          2151/7655	      n/a

## Upgrading

Eventually I did upgrade the 256GB to a 2TB M.2.   I used 'dd' to copy the
/dev/nvme0n1 to the now externally mounted 2TB (this took a long time,
as for some reason that interface only ran at 50MB/sec, and the 'dd'
even less by several factors. 


## Bizarre Things

- regularly needing the ctrl-alt-F2 and F1 switch to get control back over the mouse

- one time now the active desktop would do the focus switch of windows, but could not
  switch desktops, until I did a "restart_kde"

- under heavy load when I use the USB-barrel converter the battery goes on and off.
  this includes a beep

- i cannot get to the grub menu anymore...   turns out the /etc/default/grub file
  wasn't using the menu, and a timeout=0, so changed that to menu/5

- the grub entry "uefi settings" takes me to the bios. is that meant to be?

- sleep (S3) vs. hibernation (S4) state. - only does sleep

- When sleeping too long, it will not wake up.


