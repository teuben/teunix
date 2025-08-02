# GlobalProtect VPN

UMD is using Palo Alto Networks' VPN tool "GlobalProtect' for more secure access to the UMD network.

For some workflows you'll need to be on VPN, but ssh keys only work when on VPN.

For me GP has been quite unstable on my kubuntu linux, with some additional anekdotal issues:

1. can limit your download speed for high-speed internet providers.
2. printing from home may not work to auto-detected printers (not re-tested recently)

## GlobalProtect Icon

This launches `globalprotect launch-ui`

```
globalprotect show --version
GlobalProtect: 6.2.7-1050
Copyright 2009-2025 Palo Alto Networks, Inc.
```

The icon on the desktop does not show the connection status, instead
you have to open it to see that. There's a check mark icon inside the earth globe
icon when it connected there's a home icon when it's not connected
anything else is trouble.  

Here are the states I noticed:

1. Not Connected. OK
2. Connecting ... { Connecting ... <check> }_repeating    -- bad news
3. Yellow "still working" --  bad news
4. Connected. OK. You can disconnect or switch between BA or TA.x

At the bottom the gateway is displayed. One of two states:

1. BA = "best available"  - 10.206.x.x
2. TA = "tunnel all" - 10.206.x.x

Switching from BA (the initial default) to TA works fine, but from TA back to BA needs another CAS confirmation.  

### annoying icon lifetime

the GP icon looses focus when my mouse hovers away. Sometimes it disappears from I can take action. It is also
related that I use "mouse follows focus", which clearly is something engineers at PA never heard of.


### KDE widget

On KDE there is a useful widget `Public IP Address 1.1` that shows the public IP adress. In BA mode it will show
your IP providers address, in TA mode it will be a UMD address, as all your traffic is now routed through
UMD.

Also has a link to OpenStreetMaps where you are "located" on the planet.


## CAS tricks

The CAS interface will remember you for  (5?) days. If once every 5 days you would
jump the gun and deliberately engage CAS, then things will not get in your way when
you need to jump on zoom, or VPN or .... 

## Links

* https://itsupport.umd.edu/itsupport?id=kb_article_view&sysparm_article=KB0016076
* https://www.paloaltonetworks.com/sase/globalprotect
* Some recent debian packages
  * GlobalProtect_UI_deb-6.1.1.0-49.deb
  * GlobalProtect_UI_deb-6.1.3.0-703.deb
  * GlobalProtect_UI_deb-6.2.0.1-265.deb
  * GlobalProtect_UI_deb-6.2.1.1-276.deb
  * GlobalProtect_UI_deb-6.2.7.1-1050.deb - superfluous bottom icons fixed

Note, on debian, libqt5webkit5 is needed as well.

This is an issue with Ubuntu 25.05 and up, where Qt6 is the default. So the current
versions of GP won't work.


## Weird Scenarios

Some frustrating side-effects of GP getting stuck in some endless loop

### Reloading browser

the address `https://access.umd.edu/SAML20/SP/ACS` kept on being
added into a tab of my browser. Happened more than once. Never found out why this happened.

### Killing GP tasks

when nothing works, not even restarting using `sudo systemctl restart gpd`

manually killed all GP tasks, then manually did 'globalprotect launch-ui', but still neeeded to click on the GP ikcon.
but now it worked.

### not connecting to the browser

It keeps a launch file in ~/GP_HTML/saml.html - in some cases the GP doesn't seem to load that
into your default browser. Manually loading it (e.g. via a desktop link) can save you.

the GUI on linux is awkward, but it may also be due to the different window managers.
Especially those that use focus follows mouse have a hard time with the window disappearing all the time.

- sometimes it claims it's up (gpd0  is up with an IP), but ssh to lma reveals it's not.
  status window bad.  took longer time.

- switching to TA (from BA) is not akways reliable.    yelow "still working..." comes up and usually doesn't 
  get to a proper connection.


### browsers

Sometimes I see the PanGPUI come up. In earlier releases it would use PanGPUI on the first time,
but this funky browser will not remember the password like chrome/firefox/.... do

### Default Browser

Something odd on Kubuntu. There was a time it would always go to chromium. Could be a Kubuntu problem.
Add to this when on a new system their disfunctional GP browser came up.

### gpd0 up?

I do see cases where gpd0 is "up", i see a 10.206.x.x IP, but it won't let me on.
The GUI claims i'm up.


## Processes

This may also depend on the version.  Older versions seems to have more processes running. Why does PanGPUI have so many sessions, even
after a reboot?

```
    ps aux | grep GP

root        1801  0.0  0.0 1318004 56564 ?       Ssl  Jul18   3:02 /opt/paloaltonetworks/globalprotect/PanGPS
teuben      3024  0.0  0.0   6496  1524 ?        Ss   Jul18   0:00 /usr/bin/dbus-run-session /opt/paloaltonetworks/globalprotect/PanGPUI
teuben      3030  0.0  0.3 3043068 248884 ?      Sl   Jul18   1:36 /opt/paloaltonetworks/globalprotect/PanGPUI
teuben      3038  0.0  0.0 473220 41536 ?        Ssl  Jul18   2:34 /opt/paloaltonetworks/globalprotect/PanGPA start
teuben      3183  0.0  0.3 3029228 233168 ?      Sl   Jul18   1:33 /opt/paloaltonetworks/globalprotect/PanGPUI -session 10767c3534000175201257400000032110004_1752851470_959150
teuben      3207  0.0  0.1 1170280 125716 ?      Sl   Jul18   0:42 /opt/paloaltonetworks/globalprotect/PanGPUI -session 10767c3534000175253380500000047650006_1752851470_959971




teuben      3024  0.0  0.0   6496  1524 ?        Ss   Jul18   0:00 /usr/bin/dbus-run-session /opt/paloaltonetworks/globalprotect/PanGPUI
teuben      3030  0.0  0.3 3043068 248888 ?      Sl   Jul18   1:37 /opt/paloaltonetworks/globalprotect/PanGPUI
teuben      3038  0.0  0.0 538756 46988 ?        Ssl  Jul18   2:35 /opt/paloaltonetworks/globalprotect/PanGPA start
teuben      3183  0.0  0.3 3029228 233168 ?      Sl   Jul18   1:33 /opt/paloaltonetworks/globalprotect/PanGPUI -session 10767c3534000175201257400000032110004_1752851470_959150
teuben      3207  0.0  0.1 1170280 125716 ?      Sl   Jul18   0:42 /opt/paloaltonetworks/globalprotect/PanGPUI -session 10767c3534000175253380500000047650006_1752851470_959971

root     2074967  3.2  0.0 785496 28044 ?        Ssl  17:13   0:00 /opt/paloaltonetworks/globalprotect/PanGPS
teuben   2075054  0.0  0.0   3476  1692 pts/70   S+   17:13   0:00 grep --color=auto GP

```

and when things looks good


```
root        1581  0.3  0.0 1301948 45880 ?       Ssl  17:56   0:01 /opt/paloaltonetworks/globalprotect/PanGPS
teuben      4160  0.0  0.0   6500  2432 ?        Ss   17:56   0:00 /usr/bin/dbus-run-session /opt/paloaltonetworks/globalprotect/PanGPUI
teuben      4196  0.0  0.1 820812 111884 ?       Sl   17:56   0:00 /opt/paloaltonetworks/globalprotect/PanGPUI
teuben      4572  0.3  0.3 2685728 242936 ?      Sl   17:56   0:01 /opt/paloaltonetworks/globalprotect/PanGPUI -session 106b3200000175357758400000039590007_1754085351_389207
teuben      4838  0.3  0.3 2681040 237436 ?      Sl   17:56   0:01 /opt/paloaltonetworks/globalprotect/PanGPUI -session 106b3200000175237953900000039850007_1754085351_389241
teuben      4898  0.3  0.3 2681044 237520 ?      Sl   17:56   0:01 /opt/paloaltonetworks/globalprotect/PanGPUI -session 106b3200000174727495000000029120006_1754085351_389235
teuben      5205  0.0  0.0 473516 42796 ?        Ssl  17:56   0:00 /opt/paloaltonetworks/globalprotect/PanGPA start
```

and the latest version seems to make more sense with just 3 processes:

```
root        1583  0.2  0.0 786292 23704 ?        Ssl  21:26   0:00 /opt/paloaltonetworks/globalprotect/PanGPS
teuben      3636  0.2  0.0 408368 27556 ?        Ssl  21:26   0:00 /opt/paloaltonetworks/globalprotect/PanGPA start
teuben      5245  4.8  0.3 2685160 241480 ?      Sl   21:26   0:00 /opt/paloaltonetworks/globalprotect//PanGPUI -session 106b3200000175409761100000039690028_1754097978_210703
```


## FAQ




- what does it do on suspend?
  -> seems to work on a suspend

- what does it do on a reboot?
  -> will not re-connect


- also note the two useless icons that seem to come up, seems to be fixed in 1050


- why do I need to re-certified by CAS for every type of app?    eg. chrome, firefox, 


## Connection speeds

Evolving story that scp a file between UMD and home suffers from being on VPN.

## Local printing

This never worked on auto-detected printed on linux. Seemed fine on mac. Needs to be tested
again on version 1050.
 
## CLI upgrading

```
sudo dpkg -i GlobalProtect_UI_deb-6.2.7.1-1050.deb
```
and
```
(Reading database ... 455271 files and directories currently installed.)
Preparing to unpack GlobalProtect_UI_deb-6.2.7.1-1050.deb ...
gp service is running and we need to stop it...
Disable service...
PanGPA is running and we need to stop it...
stop gpa for sudo user teuben
Disable gpa user service...
Start upgrading gp...
Unpacking globalprotect (6.2.7-1050) over (6.2.1-276) ...
systemd is detected.
Setting up globalprotect (6.2.7-1050) ...
Enable gp service...
Starting gp service...
Set default browser, errors other than gp.desktop can be ignored ...
Starting gpa...
start GPA for sudo user teuben
start PanGPUI for sudo teuben
Processing triggers for desktop-file-utils (0.27-2build1) ...
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-teuben'
Processing triggers for hicolor-icon-theme (0.17-2) ...
Processing triggers for man-db (2.12.0-4build2) ...
```


after upgrading, it failed connecting.  Eventually with some hocus-pocus got it back. reboot normally also works.


