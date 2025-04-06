# some notes on using openconnect with globalprotect

(you really need to have the PS-GlobalProtect-OpenSourceClient-111121-0843-82.pdf document)

This procedure worked for me (teuben) on Ubuntu 20.04.4 - Jan 2022.

FILES and their final locations:

     1.   ~/.config/systemd/user/vpn.service           make sure the path to gp-saml-gui is correct

     2.    /etc/polkit-1/rules.d/10-admin.rules

     3a.   /usr/local/bin/gp-saml-gui                  check path in your vpn.service file
     3b.   /usr/libexec/openconnect/hipreport.sh       check path in your vpn.service file

If your distribution uses sudo instead of PolicyKit's pkexec, change the argument --pkexec-openconnect to --sudo-openconnect.
(i didn't need that)

See also https://github.com/dlenski/gp-saml-gui/blob/master/README.md for info on gp-saml-gui and installation guidelines.

Then to start/run/status....

     systemctl --user daemon-reload
     systemctl --user start vpn
     systemctl --user status vpn
     systemctl --user stop vpn

## if trouble with GUI

     systemctl --user import-environment DISPLAY

## start VPN each time you login:

     systemctl --user enable vpn

##  keep the VPN running after you log out

     loginctl enable-linger

##  my first time on:
$ systemctl --user status vpn
 vpn.service - UMD virtual private network
     Loaded: loaded (/home/teuben/.config/systemd/user/vpn.service; disabled; vendor preset: enabled)
     Active: active (running) since Thu 2022-01-13 20:22:18 EST; 5min ago
    Process: 334858 ExecStart=/usr/local/bin/gp-saml-gui --gateway --pkexec-openconnect access.umd.edu -- --background --pid-file=${XDG_RUNTIME_DIR}/vpn.pid --set>
   Main PID: 334961 (openconnect)
     CGroup: /user.slice/user-1000.slice/user@1000.service/vpn.service
             334961 /usr/sbin/openconnect --protocol=gp --user=umd.edu\teuben --os=linux-64 --usergroup=gateway:prelogin-cookie --passwd-on-stdin access.umd.edu>

Jan 13 20:21:09 T480 systemd[2105]: Starting UMD virtual private network...
Jan 13 20:22:17 T480 pkexec[334858]: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 13 20:22:18 T480 systemd[2105]: Started UMD virtual private network.
Jan 13 20:22:18 T480 gp-saml-gui[334961]: ESP session established with server
Jan 13 20:22:18 T480 gp-saml-gui[334961]: ESP tunnel connected; exiting HTTPS mainloop.


## but then it failed 

     Job for vpn.service failed because the control process exited with error code.
     See "systemctl --user status vpn.service" and "journalctl --user -xe" for details.



# Interesting (?) notes:

FILE /etc/resolv.conf during VPN



     options edns0 trust-ad
     nameserver 128.8.76.2
     nameserver 128.8.74.2
     search umd.edu net.umd.edu aws.umd.edu glue.umd.edu

This file didn't change when back off VPN. Before VPN was on,
Ubuntu would be using

     nameserver 127.0.1.1

the resolvectl command gives the DNS servers.

## Some comments on GlobalProtect itself

1. there is a UMD enforced max connect time of 7 days, the app can tell you

2. their app self-distructs after a second or if if your focus is gone, this doesn't apply to the settings window, is stays up. this is for linux, 
   did not try on mac/win
 
3. on a laptop suspend does not kill the VPN, it stays up

4. There are two ways to set your VPN gateway: TunnalAll and UMD Gateway. The latter is the least intrusive, as it will not touch 
   your non-UMD routing, but will still the UMD DNS. For example if you're on zoom,  it should continue to run if you happen to loose VPN
   after 7 days. With TunnelAll you would loose them.

5. The latest version GlobalProtect_UI_deb-6.2.1.1-276.deb according to https://terpware.umd.edu/Linux/Package/4863
