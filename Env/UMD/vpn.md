# GlobalProtect (GP) VPN

UMD is using Palo Alto Networks' VPN tool "GlobalProtect' for more secure access to the UMD network.

In summary: Very unstable on my kubuntu linux. Also can limit your download speed for high-speed internet providers.

## GP Icon

The icon on the desktop is fixed, it doens't show your connection status.

when you open it,  there's a check mark icon inside the earth globe icon when it connected
  there's a home icon when it's not connected
  anything else is trouble



1. Not Connected
2. Connecting ... { Connecting ... <check> }_repeating   
3. Yellow "still working" is bad news.

IP range:   "best available"  - 10.206.37.128
"tunnel all" - 10.206.96.142

## Links

* https://itsupport.umd.edu/itsupport?id=kb_article_view&sysparm_article=KB0016076
* https://www.paloaltonetworks.com/sase/globalprotect

## info

on debian, libqt5webkit5 is needed


## launch

Executes: globalprotect launch-ui

## annoying icon

## weird scenario

nothing works, not evern restar.

manually killed all GP tasks, then manually did 'globalprotect launch-ui', but still neeeded to\ click on the GP ikcon.  now it worked.



## many failing scenarios


1) access.umd.edu window comes up, browser comes up, paloalto comes up to click on link, 
   but no gpd0, 
   GP window :  { Connecting ... <check> }_repeating


2) restart?

- sudo systemctl restart gpd


See also  /opt/paloaltonetworks/globalprotect/pre_exec_gps.sh

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

## another

1. It keeps a launch file in ~/GP_HTML/saml.html - in some cases the GP



note sometimes one needs to execute the ~/GP_HTML/saml.html file kif the browser doesn't pick it up.

the GUI on linux is awkward, but it may also be due to the different window managers.
Especially those that use focus follows mouse have a hard time with the window disappearing all the time.

- sometimes it claims it's up (gpd0  is up with an IP), but ssh to lma reveals it's not.
  status window bad.  took longer time.

- switching to TA (from BA) is not reliable.    yelow "still working..." comes up and usually doesn't 
  get to a proper connection.

- often I have to "ssh lma" and check with "who" where i came from and find out I wasnt on vpn. 

- sudo systemctl restart gpd


## another

https://access.umd.edu/SAML20/SP/ACS

is reloading every minute or so

## browsers

Sometimes in a cafe I see the PanGPUI come up.

## gpd0 up?

I do see cases where gpd0 is "up", i see a 10.206.x.x IP, but it won't let me on.
The GUI claims i'm up.

-> why do I need to click on a gui to see the VPN status, why is

the icon has a link on it.
* <2025-08-01 Fri>

globalprotect show --version
GlobalProtect: 6.2.1-276
Copyright 2009-2024 Palo Alto Networks, Inc.


BA: 10.206.37.155
TA: 10.206.96.36


- what does it do on suspend?
  -> seems to work on a short suspend

- what does it do on a reboot?
  -> will not re-connect


- also note the two useless icons that seem to come up


# when things looks good

root        1581  0.3  0.0 1301948 45880 ?       Ssl  17:56   0:01 /opt/paloaltonetworks/globalprotect/PanGPS
teuben      4160  0.0  0.0   6500  2432 ?        Ss   17:56   0:00 /usr/bin/dbus-run-session /opt/paloaltonetworks/globalprotect/PanGPUI
teuben      4196  0.0  0.1 820812 111884 ?       Sl   17:56   0:00 /opt/paloaltonetworks/globalprotect/PanGPUI
teuben      4572  0.3  0.3 2685728 242936 ?      Sl   17:56   0:01 /opt/paloaltonetworks/globalprotect/PanGPUI -session 106b3200000175357758400000039590007_1754085351_389207
teuben      4838  0.3  0.3 2681040 237436 ?      Sl   17:56   0:01 /opt/paloaltonetworks/globalprotect/PanGPUI -session 106b3200000175237953900000039850007_1754085351_389241
teuben      4898  0.3  0.3 2681044 237520 ?      Sl   17:56   0:01 /opt/paloaltonetworks/globalprotect/PanGPUI -session 106b3200000174727495000000029120006_1754085351_389235
teuben      5205  0.0  0.0 473516 42796 ?        Ssl  17:56   0:00 /opt/paloaltonetworks/globalprotect/PanGPA start


- why do I need to re-certified by CAS for every type of app?    eg. chrome, firefox, 

- widgets that show the public IP on the desktop still tell me my comcast IP. Only in "TA" mode will it use the UMD.

  explain BA->TA is free.   but TA->BA needs another login.



 10.206.37.162
 10.206.96.39 
 10.206.37.162

 pulic ip address 1.1

 has maps to

 
https://cdimage.ubuntu.com/kubuntu/releases/25.04/release/kubuntu-25.04-desktop-amd64.iso

at  umd  - 52 MB/sec

on VPN:   ~ 6MB /sec while on VPN

at this speed, there's no penalty on VPN


## CLI interface

apt-get install libqt5webkit5

GlobalProtect_UI_deb-6.2.7.1-1050.deb


```
sudo dpkg -i GlobalProtect_UI_deb-6.2.7.1-1050.deb 
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


after upgrading, it failed connecting.  Eventually with some hocus-pocus got it back.
