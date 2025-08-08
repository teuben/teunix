# GlobalProtect VPN

UMD is using Palo Alto Networks' VPN tool "GlobalProtect" for more secure access to the UMD network.

For some workflows you'll need to be on VPN, e.g. ssh keys only work when on VPN.

For me GP has not always been stable, with the following issue remaining:

1. can limit your download speed for high-speed internet providers.
2. printing from home may not work to auto-detected (bonjour) printers. seems fixed IP printers are better.
3. <SERIOUS> occasional change of state in GP will cause it to hang. Do your magic or reboot laptop. 
4. round trip using ssh agents? and/or kerberos? use ssh tunnel?
5. WARNING:   when on eduroam and switching to wired can cause eduroam to keep the default route.
   better to manually disable GP if you need to speed.

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
4. Connected. OK. You can disconnect or switch between BA or TA.

At the bottom the gateway is displayed. One of two states:

1. BA = "best available"  - 10.206.x.x
2. TA = "tunnel all" - 10.206.y.y

Switching from BA (the initial default) to TA works fine, but from TA back to BA needs another CAS confirmation.  

### annoying icon lifetime

the GP icon is destroyed when something else gets focus. Very annoying for those who prefer focus follows mouse.
Clearly something engineers at PA never heard of.
Sometimes it disappears before I can take action. Similar effects seen on both mac and win.


### KDE widget

On KDE there is a useful widget `Public IP Address 1.1` that shows the public IP adress. In BA mode it will still show
your IP providers address, in TA mode it will be a UMD address, as all your traffic is now routed through
UMD.

Also has a link to OpenStreetMaps where you are "located" on the planet.


## CAS tricks

The CAS interface will remember you for  (5?) days. If once every 5 days you would
jump the gun and deliberately engage CAS, then things will not get in your way when
you need to jump on zoom, or VPN or ....

GP locks you in for 7 days.

## Links

* https://itsupport.umd.edu/itsupport?id=kb_article_view&sysparm_article=KB0016076
* https://www.paloaltonetworks.com/sase/globalprotect
* Some recent debian packages
  * GlobalProtect_UI_deb-6.1.1.0-49.deb
  * GlobalProtect_UI_deb-6.1.3.0-703.deb
  * GlobalProtect_UI_deb-6.2.0.1-265.deb
  * GlobalProtect_UI_deb-6.2.1.1-276.deb
  * GlobalProtect_UI_deb-6.2.7.1-1050.deb - superfluous bottom icons fixed
  * GlobalProtect_UI_deb-6.2.9.1-407.deb  - testing 6-aug


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

There has even been cases wehre 'ssh lma' just hangs.... not even the request for the password. A reboot solved this, grrr.


## Processes

This may also depend on the version.  Older versions seems to have more processes running. Why does PanGPUI have so many sessions, even
after a reboot?

```
    ps aux | grep GP
```
on the latest version seems to make more sense with just 3 processes. Earlier versions had different PanGPUI sessions.

```
root        1583  0.2  0.0 786292 23704 ?        Ssl  21:26   0:00 /opt/paloaltonetworks/globalprotect/PanGPS
teuben      3636  0.2  0.0 408368 27556 ?        Ssl  21:26   0:00 /opt/paloaltonetworks/globalprotect/PanGPA start
teuben      5245  4.8  0.3 2685160 241480 ?      Sl   21:26   0:00 /opt/paloaltonetworks/globalprotect//PanGPUI -session 106b3200000175409761100000039690028_1754097978_210703

```


## FAQ



- what does it do on suspend?
  -> seems to work after a suspend. Even if you switch locations, e.g. home to cafe. But there is a timeout where your UMD IP can be retained.

Your GlobalProtect session has been disconnected due to network connectivity issues or session timeouts.

The lifetime of GP is 7 days.

- what does it do on a reboot?
  -> will not re-connect


- also note the two useless icons that seem to come up, seems to be fixed in 1050


- why do I need to re-certified by CAS for every type of app?    eg. chrome, firefox, 

- Network icon disappeared from tray.  This one saved me:   `sudo systemctl restart NetworkManager`


## Connection speeds

Evolving story that scp a file between UMD and home suffers from being on VPN.

## Local printing

This never worked on auto-detected printed on linux. Seemed fine on mac though.
 
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




# GP on Mac and Win

On a *Mac* a persistent icon appears on the top right of the menu, and you toggle it from there.  The icon will reflect status
of being connected or not. Nice.  There is no **gpd0** interface, in fact, no difference was noted with and without VPN, they
are using an existing interface, in my case **utun4**.  version 6.2.8-223

On *Windows* the application has to be started. Icon doesn't change visually when status changes, only Mac seems to do this.


# ssh tunnel


Tunneling SSH keys works. Start the tunnel this way:

```
  ssh -TNL localhost:2222:localhost:22 lma.astro.umd.edu
``
Then I put this in my home ~/.ssh/config:

```
  Host lma.local
  Hostname localhost
  Port     2222
```
Now I can 'ssh lma.local' using an SSH key, once the tunnel is running; no VPN
needed because the tunneled login originates inside lma itself. It probably
involves double-encrypted traffic though, as both the tunnel traffic and SSH
session traffic will be encrypted individually (I think).

# Oddities

1. The routing table `route` is nuts.
2. same ip for some time, e.g. overnight down
