# Astronomy on Ubuntu Linux a.k.a. Linux Setup  (**DRAFT**)


On the [AstroBetter WiKi](https://www.astrobetter.com/wiki/Wiki+Home)
a section is dedicated to
[Mac Setup](https://www.astrobetter.com/wiki/tiki-index.php?page=Setup+a+New+Mac+for+Astronomy).
Is **Linux** so much easier to set up that we don't need one?  I do remember the times
this was really involved, but not so much anymore.
Recently I started from scratch with a spanking new Ubuntu 20.04LTS.
You could also argue Linux is used more by geeky types who know
a lot of what's going on in the trenches, and they don't bother writing it up.  We are
going to change that here! 

*Loosely following the steps of the Mac Setup page:*

If you're a scientist with a new Linux computer, read on. This page
assumes you want to write scripts, reduce data, plot results, work
with LaTeX, and give presentations, among other handy things. This is
not a tutorial. We will point out some salient differences where things
work differently on a Mac.

As a brief introduction: Linux is a catch-all name for a linux kernel
and GNU software based operating system. Linux is part of the Unix family, of
which Mac OSX is also one.  Therefor many tools you will see described here,
apply to Mac as well. Linux normally comes with a choice of a 
graphical interface (e.g. GNOME, KDE, XFCE, ....), which we will not
cover here, and keep the description agnostic to your GUI choice.
We will also not cover the actual installation of Ubuntu Linux, and assume you
have done this.

[ Find out which version of Linux you have. You can either look at the
file **/etc/issue**  or one of  **/etc/debian_version** or **/etc/redhat-release**. If that does
not tell you enough, try the command **lsb_release  -a**. ]


Many of the apps are large files and can take a while to
download. You should be on a good internet connection and allow at
least a couple hours to complete the entire setup.  Most of the
installation is terminal based, that should be no surprise.

## Bootstrap your packages

Although we will discuss quite a few packages, there are
some very basic ones that most of us will need right away, so
consider this the boostrapping procedure, as Ubuntu doesn't even
come with these. This is the command to install them

      sudo apt install git emacs tcsh wget curl unzip openssh-server -y

you can get away without emacs, but the others are often needed when you
work with astronomical software.

## Package tools:  apt and dpkg

It is useful to know a few shortcuts about your package
manager. When you compile a program and find that it needs a file, you
can use **locate**, or **dpkg -S**, or **dpkg -L** to sherlock your way around the
file system to solve your problem. Of course *google* and *stackoverflow* can
also be very useful. Here are a few example commands:


      dpkg -S file                 which package owns that file
      dpkg -L package              list what files the package gives
      dpkg --list                  list all packages you have
      apt-get -f install           post-install if errors occur
      apt autoremove               cleanup old stuff not needed anymore

And here is how to create a list of all possible packages (there are over 60,000)
and installed packages. Useful if you like commands like **grep** to search for things
and the usual GUI tools let you down:

      apt-cache search  .  > apt-cache0.list
      apt-cache pkgnames   > apt-cache1.list
      dpkg --list          > dpkg0.list
      
      grep fits apt-cache0.list
      grep fits dpkg0.list
      

In addition, if you install synaptic and aptitude, you have the more classic debian style queries
available

      sudo apt install synaptic aptitude -y
      aptitude search '~i !~M'

Depending if you use Kubuntu or Ubuntu, there are different GUI tools to install software:
Discover for Kubuntu, and XXX for Ubuntu.

## Neat things about Ubuntu

* if you type a command that Ubuntu knows exists, but you didn't
install yet, it will remind you. For example if you typed **ds9** you
might see

      sudo apt install saods9

* the command **xdg-open** will open any file with the appropriate
mime-type. If the argument is a directory, a file browser
(e.g. Nautilus or Dolphin will be used)

* ...

## Less nice things about Ubuntu

* snaps and flatpaks (appimage work a lot better ) - but this is
controversial. I'll devote a whole section on this below.

* related to xdg-open: when you install certain new packages,
sometimes this will bump the program you had before and you
loved. I've been unpleasantly bitten by this a few times. My JPG's
were opened by gwenview, when I installed krita, suddenly by this
krita editor. WTF.  Now where again is this mime-type list and how do
you edit it?  This will sadly depend onthe distro.  Kubuntu is
different from Ubuntu. grrr.

* 32 bit applications are on the way out: increasingly it will become
harder to add this support in an 64-bit OS. There are still some popular
astronomy legacy applications (e.g. karma) that have not been converted.


* ...

## Astronomy Packages

Ubuntu does come with a modest set of astronomy packages 

      sudo apt install montage aladin saods9 xpa-tools pgplot5 -y
      sudo apt install aoflagger libcfitsio-dev libccfits0v5 topcat -y
      sudo apt install gnuastro -y

### ASCL

The [Astrophysics Source Code Library (ASCL)](https://ascl.net) is a registry where
you can find 2000+ codes. Most of those you will have to install via source, or in binary
if the author made them available.

## Change Shell - bash or tsch

To note here is there is some zsh movement as a better bash. Also discuss the **chsh** command, because MacOS is not
true to unix, it doesn't work there. On a Mac they don't distiguish anymore between a login and an interactive shell,
which is why on a mac you need to edit your **.bash_login** file, and on linux the **.bashrc**

On a default Ubuntu (t)csh is not even installed, only bash.

bash has smart file completion, which can be super annoying at times. do I really need to explain?

Dotfiles: another cottage industry.
Searching in github for ditfiles gives you > 100 thousands. Talk about reinventing the universe. But
if you install Unix regularly, it is probably useful to have a mechanism to get your dotfiles organized.

## XQuartz & X11

there is no such thing on Linux (yet). It just works, and it's called X11, and comes include with Ubuntu.
There is a move towards Wayland, but that's still experimental.

## XCode: Command Line Tools + Compilers

there is no such think on Linux. It just works, and it's part of the
packaging system. No need for Xcode, or Port, or Brew. It's all in the same packaging system.

One thing to note: there is a **brew** version for linux now. I personally don't quite understand why
you would want to do that, but if there is something in brew that cannot be found somewhere else,
be me guest and head over to https://docs.brew.sh/Homebrew-on-Linux

## Python

* native ubuntu (apt install)
* miniconda - a smaller version
* anaconda - a full version
* AstroConda (is that still viable?) - IRAF/pyiraf
* Python (install from source) - nobody does that anymore

Do we need to say something about virtual environments?

What about  PyRAF, AstroPy,
PyFITS, PyWCS, VOTable, NOVAS, and astrolib.coords. 
CosmoloPy, APLPy, PyEphem, and
NASA's OSCAAR software that are installable via apt-get.


## R

but what about R. they usually have a lot of packages you need.

##  Julia

too early for julia

## IRAF/PyRAF

TBD ?

## Other Development stuff

Developing software and writing papers, collaborative or not, is very useful with one
of the modern Content Management Systems (CMS), and git is probably the main contender these
days.

      sudo apt install git hub gitg gitk meld tkdiff -y

and if you need to need some legacy ones, try

      sudo apt install rcs cvs subversion mercurial -y



### what about all the *-dev packages


## Other Astronomical Software

* Skycalc, by John Thorstensen, provides almanac, ephemeris, and
     airmass information, invaluable for planning observing
     runs. Jskycalc is the new graphical version that runs on any
     platform, and has an AstroBetter walkthrough. Also available as
     the classic shell version.

* Multinest, PyMC, or emcee for Bayesian statistical analysis.

* Gemini Observing Tool

## KERN

This extremely large well supported [KERN package](https://kernsuite.info/) is available
for Ubuntu18.04, but I believe an update for 20 will be forthcoming soon. There are
XXX packages in KERN, and mostly useful for radio astronomy.

Here is the example how you get started in Ubuntu 18.04

        sudo apt-get install software-properties-common
        sudo add-apt-repository -s ppa:kernsuite/kern-5
        sudo apt-add-repository multiverse
        sudo apt-add-repository restricted
        sudo apt-get update

After which you are ready to install some packages, for example meqtrees:

        sudo apt-get install meqtrees
                
## IDL

Of course IDL is commercial software, but it is widely used in some of the astronomy
community, and the current owner will happily sell you a license. If you are lucky, it will work under GDL

        sudo apt install gnudatalanguage -y

or somebody has ported it to python.  Otherwise, $$$.


## Publishing: LaTex

Pretty straightforward here:

      sudo apt install texlive texlive-latex-base texlive-publishers -y

there are some neat bibtex organizing tools we should advertise here too. 

what about PDF annotation, useful if you make your own PDF libary. I use okular, but that's
KDE centric. And a PDF library search engine, you store your PDF's in a big container, and have it indexed.

Overleaf is heavily used by a lot of astronomers. But did you know you can keep
a local copy on your own system using git? And even make local changes and push them
back to overleaf? It's always a good idea to have a 2nd backup. Under the top left MENU button for
a document, you will find the **git** link (not the github).

Some agencies have strict font requirements.  The MS fonts library is freely available for this:

      sudo apt install ttf-mscorefonts-installer -y
      fc-cache -f

this will give you "Arial", "Times New Roman", and "Impact", to name a few. Also useful for LibreOffice.

## Publishing: LibreOffice

This actually comes standard with Ubuntu. But maybe a few comments are in place here:

* it will never be 100% compatible with MS Office
* you can open most PDF files and edit them directly, useful for filling out PDF forms
* there are several other open source MS Office clones. E.g. OnlyOffice, G Suite, OpenOffice, WPS Office.

## Other tools

* gedit - is this the easy way not to offend emacs or vim users ?
* sublime, atom - code editors - not in ubuntu
* aspell and aspell-dict-en
* R - lot of packages here, is there an easy name that grabs a lot
* gimp
* xfig and GraphicsMagick
* dia
* imagemagic
* xv, geeqie, ...

## "amateur" tools

I'm not sure if people spend 100k on equipment, are they still called "amateur" ?

- skytools such as
  - celestia
  - stellarium
  - kstars
  - AstroImageJ
  - Skychart
  - Digital Universe Atlas (AMNH) - partiview
  - OpenUniverse Space Simulator
- astrophotography:   gimp, darktable, digikam, ekos
- OpenRocket
- http://www.distroastro.org/   (mate based)

## others

is ESO SciSoft still active ?




## Russian Dolls and other such containers

Unix used to be a little simpler, there was just Unix. Now we have virtual machines, containers etc.etc.
Within the Linux there is another type of fragmentation going on, coming out of the frustration of
so many Linux distrutions, and that is the distribution agnostic executable. But first a few
names to put some terms on the table you may have heard about

* appimage
* flatpak
* snap
* docker
* virtual machine (VirtualBox, VMware, KVM, ....)
* kubernetes


### AppImage

This is the simplest of the "build once, run anywhere" executable in linux. super simple,
one file, make it exectable
(**chmod +x**) and run it. All the pain is for the developer. Has some (security?) issues?
AppImages are not signed (some AppStored refuse to publish those)
and do not support ICU (language extensions), for one.

### flatpak

This is RedHat's attempt to provide portable executables that can be deployed anywhere. Remember this thing
called "build once, run anywhere" ? How did that work for you?

Well, I have  bones to pick when you have mounted filesystems. More about that later.
But just to give an example, this is what I had to do the other day (I may find a better way,
I don't like the sudo portion)

      sudo apt install flatpak
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install flathub org.kde.digikam
      
after which you can run it as follow

      flatpak run org.kde.digikam

This runs digikam in a container, so by default you don't see much of what's outside of this. You have
limited access to folders (/home and /media being the exception).


      flatpak install flathub flatseal           
      sudo flatpak override org.kde.digikam --filesystem=/Photos

Now it should be said that if you use the GUI approach, you are better off. No need to remember nasty
ways to run digikam to flatpak, but you do need to understand all the flatseal issues.


### snap

This is Ubuntu's (i.e. Canonical) answer to portable executables. Don't look nice at all either, your mount table
will look horrific. Has the same kind of problem with files or directories that are symlinked out of
your /home. Talk about mount/bind ?   Also, some people object to the fact that not all of the
snap infrastructure is open source.

### docker

Useful to know it exists, but out of scope for this paper?

### virtual machines

Probably VirtualBox is the way to go. If you head over to osboxes.org, there are a large number
of images ready to be used, saving you the sometimes painful process in VirtualBox to ingest an iso
image.

      sudo apt install virtualbox

### Kubernetes

Useful to know it exists, but out of scope for this paper?

## old PJT stuff to be organized


In this article/blog I would like to cover how to set up your Ubuntu
system for professional astronomy. This is a moving target So this
writeup is for the 2020 version of Ubuntu. Althugh I use the kubuntu
flavor, the details do not differ if yu use Ubuntu, or Xubuntu, or any
of the close derivatives.  Any other debian based system should also
(mostly) work, but the translation to a RedHat based system, for
example we use Centos at work, is a different story.  If there is
enough interest, I could be persuaded to try and write that up as
well.


Communications:
Browsers:   firefox      chrome, chromium
Slack
Skype
Zoom
Yakyak (an example of a snap)

I will not cover what to do when you have an old/existing system, and
you have two options: overlay the new on the old, or make a new one,
and copy the setup files . This requires some knowledge and understand
what parts of the old system changed, and which did not, and most
importantly, which files you need.

 convert from ImageMagick doesn't convert a PDF until you modify the /etc/ImageMagick-7/policy.xml file and
find make sure you have **<policy domain="coder" rights="read | write" pattern="PDF" />** in the policymap.


The big things:

Compilers (but also python, R, julia etc.)   [idl -> gdl]
Useful tools that exist as binary
Latex/Bibtex
Gimp, xfig, dia, ...
Grip (to preview your MD files)
    grip will download a lot of python3 stuff
LibreOffice (and competitors now around too)
Pdf tools:   mostly, how do I edit a PDF, my university/NSF often asks this
  (acroread is pretty useless, libreoffice does open PDF files)

ADS tools to set up my bibtex files?  (bibmanager?)
My CV tools

## SSH

One way to do rewmote computing is via ssh, one terminal at a time (more persistency
via screen/tmux or vnc/x2go)

      ssh-keygen
      ssh-copy-id 192.168.1.110
      
after which you can

      ssh 192.168.1.110

to connect to that remote server.
  
Don't forget to edit /etc/ssh/ssh_config  (or in your own ~/.ssh/config). Here is an example to make
your ssh commands a little more compact to use:

      # ssh -X or -Y not needed
      ForwardX11 yes
      ForwardX11Trusted yes
      
      # pesky server tthat time you out
      TCPKeepAlive yes
      ServerAliveInterval 60

      # examples of aliases
      Host lab
          Hostname lab002.astro.umd.edu
      Host aws0
          Hostname ec2-52-14-202-62.us-east-2.compute.amazonaws.com
          User ubuntu
          IdentityFile ~/.ssh/nemo123.pem
      Host gbt
          Hostname fourier
          ProxyCommand ssh ssh.cv.nrao.edu -W %h:%p
          User pteuben


### sshfs

Once you have established an easy ssh connection to your server, you could learn how to NSF mount
drives, but this requires admin (root) permissions. Perhaps an easier way is to use ssh again using
the sshfs protocol. Here is an example

      mkdir -p $HOME/mnt/data3
      sshfs 192.168.1.110:/data3 $HOME/mnt/data3

to mount the remote directory in $HOME/mnt/data3.   And to umount it, use

      fusermount -u $HOME/mnt/data3

### x2go

Excellent way, uses ssh, compresses much better than vnc. But needs the remote to have the x2go server
installed. In that sense , vnc is easier to use, just a bit slower.

## Quick Install

You can also download my **ubuntu20.list**, which is a long list of all the package we discussed here,
and install everything in one long download. You could always inspect this file and comment out the
one you don't need and then run it. Thare are some sparing comments in the file:

    sudo apt install  $(grep -v ^# ubuntu20.list) -y

or if you want to be really don't want to select and have enough disk space, try this

    sudo apt install astro-all

these are about XXX (300?) packages in 3GB.

## References

* [What operating systems do astronomers use
  ](https://www.astrobetter.com/blog/2011/12/20/os-apt-astronomers/) - 2011

* [What Operating Systems Do AstroBetter Readers Use?
  ](https://www.astrobetter.com/blog/2011/12/28/astrobetter-operating-systems) - 2011

* [Setting up Python for Astronomy
  ](https://www.astrobetter.com/wiki/Python+Setup+for+Astronomy)   - 2014

* [Setup a New Mac for Astronomy
  ](https://www.astrobetter.com/wiki/tiki-index.php?page=Setup+a+New+Mac+for+Astronomy) - 2016

* [AlternativeTo: Crowdsourced Softeware Recommendations
  ](https://alternativeto.net)

* [Debian Astro
  ](https://blends.debian.org/astro/)
