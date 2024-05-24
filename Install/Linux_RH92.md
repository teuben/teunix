# Linux  Redhat Enterprise 9.2

For the fun of it!   UMD makes it possible to run the enterprise version of Redhat.

See https://itsupport.umd.edu/itsupport?id=kb_article_view&sysparm_article=KB0010805
how to activate it.  You can take the ISO and install it, but after that you'll need
to activate it to get access to upgrades.  This is done in two steps:

1. Grab the UMD certificate (using your UMD credentials).

     wget https://www.rhelops.umd.edu/pub/katello-ca-consumer-latest.noarch.rpm

   and install it

     rpm -ivh katello-ca-consumer-latest.noarch.rpm


   These two commands can be combined in one.

2. Register

     subscription-manager register --org="umd" --activationkey="fake-21af8-0ee62-f6dff-fake" 

   Again you have to be in the UMD domain to make this work. VPN will work.


It goes without saying (?) you need to be in the UMD domain in order to update packages.

 
## Basic Tools

For me the first step would be basic packages

      yum install git make

this will get me to teunix.    dnf0 didn't work.

Missing rpc/rpc.h did not get solved the fedora way, the libtirpc-devel did not exist, whereas
libtirpc did. Go figure. I can't read the docs, need to use redhat enterprise login.

But on lma we have :  libtirpc-devel-1.3.3-2.el9.x86_64

yum --enablerepo=\* search dav_svn 
