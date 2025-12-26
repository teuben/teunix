#  UMD Setup

Several useful apps when you are in the UMD sytem

1. eduroam for wifi


Onboarding is needed, this will place a UMD certificate on your device, and you will
need to go through CAS authentication.


* tool: https://itsupport.umd.edu/itsupport?id=kb_article_view&sysparm_article=KB0011963
* manual: https://itsupport.umd.edu/itsupport?id=kb_article_view&sysparm_article=KB0014926 or better:
* https://www.astro.umd.edu/twiki/bin/view/AstroUMD/Wireless

2. GlobalProtect VPN

* https://itsupport.umd.edu/itsupport?id=kb_article_view&sysparm_article=KB0016076
* https://www.paloaltonetworks.com/sase/globalprotect

3. zoom

* https://zoom.us/download

4. kerberos for ssh

As an alternative to ssh key based authentication ...  TBD.

* https://wiki.umiacs.umd.edu/umiacs/index.php/Kerberos
* https://hpcc.umd.edu/hpcc/help/basics.html

5. Printing

CUPS.  Autodetected when in the internal 10.225.24.x or 10.225.25.x network
but harder when on eduroam.   TBD.

6. Secure W2-managed EAP-TLS certificates

https://www.securew2.com/blog/what-is-eap-tls

## Workflow


Noting:

1. On VPN "ssh zaratan" works, but on NET it will ask for passswd (CAS/2FA)

2. On VPN "ssh lma" works, but from there on "ssh zaratan" still asks for password.
   After network 

3. On NET with "kinit" to teuben@UMD.EDU "ssh zaratan" still asks for a password.

