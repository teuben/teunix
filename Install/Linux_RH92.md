# Linux  Redhat Enterprise 9.2

For the fun of it!   UMD makes it possible to run the enterprise version of Redhat,
but in order to use it, you'll need to be online via VPN (or be on campus).

Compared to Ubuntu, Redhat is just a hassle. Maybe because it's the UMD enterprise,
even Fedora installs a little easier for sure. Still, a lot more manual steps compared
to Ubuntu.

See https://itsupport.umd.edu/itsupport?id=kb_article_view&sysparm_article=KB0010805
how to activate redhat.  You can take the ISO and install it, but after that you'll need
to activate it to get access to upgrades.  This is done in two steps:

1. Grab the UMD certificate (using your UMD credentials).

     wget https://www.rhelops.umd.edu/pub/katello-ca-consumer-latest.noarch.rpm

   and install it

     rpm -ivh katello-ca-consumer-latest.noarch.rpm

   These two commands can be combined in one, as rpm handles that URL.

2. Register

     subscription-manager register --org="umd" --activationkey="fake-21af8-0ee62-f6dff-fake" 

   Again you have to be in the UMD domain to make this work. VPN will work.


## Basic Tools

For me the first step would be basic packages

      yum install git make

this will get me to teunix.    dnf0 didn't work.

Missing rpc/rpc.h did not get solved the fedora way, the libtirpc-devel did not exist, whereas
libtirpc did. Go figure. I can't read the docs, need to use redhat enterprise login.

But on lma we have :  libtirpc-devel-1.3.3-2.el9.x86_64

yum --enablerepo=\* search dav_svn

## repos on astroumd

When activated, I only had **redhat.repo**, but our office machines have a lot more.

cuda.repo
epel-cisco-openh264.repo
epel-testing.repo
epel.repo
google-chrome.repo
redhat.repo
rpmfusion-free-updates-testing.repo
rpmfusion-free-updates.repo
rpmfusion-nonfree-updates-testing.repo
rpmfusion-nonfree-updates.repo
virtualbox.repo

but for NEMO I needed rpmfusion (for pgplot) and coderead (for libitrpc-devel, not obvious).

This command didnt work for me to enable to missing repo:

      sudo subscription-manager repos --enable codeready-builder-for-rhel-9-x86_64-rpms

after this frustration, I edited the file, and replaced the enable=0 to enable=1 for
codeready

      sudo vi /etc/yum.repos.d/redhat.repo

after this

     yum install libtirpc-devel

worked, and gyrfalcON would compile with the new rpc.h - there was some python complaint after the
install, but it seemed to have installed it properly.


