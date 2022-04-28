# Astronomy on Ubuntu Linux (**DRAFT for U22.04LTS**)


On the [AstroBetter WiKi](https://www.astrobetter.com/wiki/Wiki+Home)
a page is dedicated to
[Mac Setup](https://www.astrobetter.com/wiki/tiki-index.php?page=Setup+a+New+Mac+for+Astronomy).
Is **Linux** so much easier to set up that we don't need one?  There were the times
this was really involved, but not so much anymore.
Recently a spanking new Ubuntu 22.04LTS came out, good for 2 years until the next LTS.
You could also argue Linux is used more by geeky types who know
a lot of what's going on in the trenches, and they don't bother writing it up.  We are
going to change that here!!

So, if you're a astronomer with a new Linux computer, read on.
This page assumes you want to write scripts, reduce data, plot results, work
with LaTeX, and give presentations, among other handy things. This is however
not a tutorial. We will also point out some salient differences where things
work differently on a Mac.

If you have used Ubuntu for a while, this might be a nice checklist to see
if you have been missing out on some cool tools.

As a brief introduction: Linux is the catch-all name for a linux kernel
and GNU software based operating system. Linux is part of the Unix family, of
which Mac OSX is also one.  Therefor many tools you will see described here,
apply to Mac as well. Linux normally comes with a choice of a 
graphical interface (e.g. GNOME, KDE, XFCE, ....), which we will not
cover here, and we keep the description agnostic to your Desktop GUI choice.
We will also not cover the actual installation of Ubuntu Linux,
and assume you have done this. Within the Ubuntu family, there is also Kubuntu,
Xubuntu, Lubuntu etc. Again, we keep our discussion agnostic to which (GUI) flavor
you use. One word of caution:  it may be tempting to tinker with your
desktop to make it look like you're on a Mac or Windows. In one example
of using the McMojave, my application menu for ds9 (and maybe other apps) was
gone. Not a good move.

[ Find out which version of Linux you have. You can either look at the
file **/etc/issue**  or one of  **/etc/debian_version** or **/etc/redhat-release**. If that does
not tell you enough, try the command **lsb_release  -a**. ]


Many of the apps are large files and can take a while to
download. You should be on a good internet connection and allow at
least a couple hours to complete the entire setup.  Most of the
installation covered here is terminal based, that should be no surprise,
though GUI alternatives exist. 

## Bootstrap your packages

Although we will discuss quite a few packages, there are
some very basic ones that most of us will need right away, so
consider this the boostrapping procedure, as Ubuntu doesn't 
come with these anymore. Here is the command:

      sudo apt install  git emacs tcsh wget curl unzip openssh-server -y

you can get away without emacs if that's not your editor of choice.
The others are often needed when you work with astronomical software.

The beta release did not add compilers.... try this:

      sudo apt install gcc g++ gfortran make cmake
      or?
      sudo apt install build-essential

NOTE: Comes with gcc 11.2.  Could also suggest to install clang (which covers C/C+) 

## Package tools:  apt and dpkg

It is useful to know a few shortcuts about your package
manager. When you compile a program and find that it needs a file, you
can use commands such as **locate**,
or **dpkg -S**, or **dpkg -L** to sherlock your way around the
file system to solve your problem. Of course *google* and *stackoverflow* can
also be very useful. Here are a few example commands:


      dpkg --list                  list all packages you have
      dpkg -S FILE                 which package owns that FILE
      dpkg -L PACKAGE              list what files that PACKAGE gives
      apt-get -f install           post-install if errors occur
      apt autoremove               cleanup old stuff not needed anymore
      apt autoclean

And here is how to create a list of all possible packages (there are over 60,000)
and installed packages. Useful if you like commands like **grep** to search for things:

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

### Alternative package managers?

[Package Managers](https://itsfoss.com/package-manager) used to be tied to the Linux Distribution.
But if you come from a Mac, you may like certain packages that are available via **brew**. 
This is now available on Linux via https://docs.brew.sh/Homebrew-on-Linux

Another alternative methods to install applications not available through the regular
channels are **FlatPak** and **snap**, which we cover in more detail below,
as well as the AppImage style of programs.

By using such alternate app channels, you can effectively make the official
version hidden, and can come with additional restrictions.

## Neat things about Ubuntu

* if you type a command that Ubuntu knows exists, but you didn't
install yet, it will remind you. For example if you typed **ds9** you
might see

      sudo apt install saods9

* the command **xdg-open** will open any file with the appropriate
mime-type. If the argument is a directory, a file browser
(e.g. Nautilus or Dolphin will be used). On a Mac you will find a
similar command, aptly called **open**

* ...

## Less nice things about Ubuntu

* snaps and flatpaks (appimage works a lot better ) - but this is
controversial. I'll devote a whole section on these universal binaries
below.

* related to xdg-open: when you install certain new packages,
sometimes this will bump the program you had before and you
loved. I've been unpleasantly bitten by this a few times. My JPG's
were opened by gwenview, when I installed krita, suddenly by this
krita editor. Now where again is this mime-type list and how do
you edit it?  This will sadly depend on the distro.  Kubuntu is
different from Ubuntu. grrr.

* 32 bit applications are on the way out: increasingly it will become
harder to add this support in an 64-bit OS. There are still some popular
astronomy legacy applications (e.g. karma) that have not been converted,
and probably never will (if only we had the source code).


* ...

## Astronomy Packages

Ubuntu does come with a modest set of astronomy packages. Here are some of our favorites:

      sudo apt install montage aladin saods9 xpa-tools topcat  -y
      sudo apt install libcfitsio-dev libccfits0v5 pgplot5 -y
      sudo apt install gnuastro -y

### astro debian blend

If you want to adopt the whole astro debian blend

      sudo apt install astro-all

which will consume about 2xx packages in 3GB. This will get you everything and then some.

### KERN

This extremely large well supported [KERN package](https://kernsuite.info/) is available
for Ubuntu18.04, a version for Ubuntu20.04 is forthcoming soon. There are
XXX packages in KERN, and mostly useful for radio astronomy. Some overlap with
the previously mentioned debian astro blend.  *do they conflict or overwrite each other* ???

Here is the example how you get started in Ubuntu 18.04

        sudo apt-get install software-properties-common
        sudo add-apt-repository -s ppa:kernsuite/kern-5
        sudo apt-add-repository multiverse
        sudo apt-add-repository restricted
        sudo apt-get update

After which you are ready to install some packages, for example meqtrees:

        sudo apt-get install meqtrees


### ASCL

The [Astrophysics Source Code Library (ASCL)](https://ascl.net) is a registry where
you can find 2000+ codes listed from (peer reviewed) papers.
Most of those you will have to install via source. ASCL has a pretty good search
tool to find related codes. You can also find ASCL codes via papers, for example
if you look at CGS at (provide link)

## Change Shell - bash or tsch

Ubuntu comes with a default shell called **bash**, but some die
hards might like to stick to (t)csh, or if you look into the future, maybe adopt
**zsh** (as a *better bash*).  The **chsh** command will do this for
you, but MacOS is not always true to Unix, it doesn't work there.  On
a Mac they don't distiguish anymore between a login and an interactive
shell, which is why on a Mac you need to edit your **.bash_login**
file, and on linux the **.bashrc**. 

In **bash** directory completion can be very annoying if you use environment variables,
you could consider adding the following to your **.bashrc** file:

      shopt -s direxpand

### Dotfiles

Unix stores a lot of application defaults and setup files in files (and directories) that
are hidden from view by starting the filename with a . ; hence the name dotfiles.

Dotfile appear to be quite a cottage industry.
Searching in github for dotfiles gives you over 100 thousands repositories. Seriously?
Talk about reinventing the multiverse. But
if you setup your Unix accounts regularly,
it is probably useful to have a mechanism to get your dotfiles organized. Roll your
own, or steal some ideas from the many on github.

## Python

Python is so widely used in many projects, that we spend a small section on it here.

Although python2 is deprecated, the commands python or ipython sometimes still refer to version 2.
A safe bet is to refer to **python3** and **ipython3** explicitly.


U22 comes with python 3.10.4, very brave.  But no pip3 installed

* native ubuntu (apt install)
* miniconda - a smaller version
* anaconda - a full version, including astropy
* AstroConda (is that still viable?) - IRAF/pyiraf
* Python (install from source) - nobody does that anymore

If you prefer to use the native Ubuntu version:

      sudo apt install python-is-python3 ipython3 python3-pip -y python3-venv -y
      sudo apt install python-matplotlib python-scipy python-scitools -y
      sudo apt install python3-astropy python3-astropy-affiliated -y

Do we need to say something about virtual environments?

What about  PyRAF, AstroPy,
PyFITS, PyWCS, VOTable, NOVAS, and astrolib.coords. 
CosmoloPy, APLPy, PyEphem, and
NASA's OSCAAR software that are installable via apt-get.

Difference between conda and pip.  Also mention the "pip install -e ." method, as opposed to
the "python setup.py install" method, as developer or as user.

Using jupyter notebooks is now the

## R

but what about R. they usually have a lot of packages you need.

## Other Development stuff

Developing software and writing papers, collaborative or not, is very useful with one
of the modern Content Management Systems (CMS), and **git** is probably the main contender these
days.

      sudo apt install git hub gitg gitk meld tkdiff -y

and if you need to need some legacy ones, try

      sudo apt install rcs cvs subversion mercurial -y

NOTE: should cover the official **gh** command.

### what about all the *-dev packages

If you develop your own code, or compile from scratch, you will undoubtedly need the development packages
for the libraries you will need to link with.  It has been tradition that the runtime and development
are in separate packages. On debian based systems they are often labeled with **-dev**, but on redhat
with **-devel**.  Here are a few common ones used in astronomy, pick your favorites:

      sudo apt install wcslib-dev libfftw-dev libcfitsio-dev libgsl-dev xorg-dev -y
      sudo apt install libhdf5-dev hdf5-tools libboost-dev libsqlite3-dev -y

sadly there is no standard on the basename.  For example on redhat based system the HDF5 library package name
would be **hdf5-devel** compared to the name **libhdf5-dev** in debian based systems.

## Other Astronomical Software

* Skycalc, by John Thorstensen, provides almanac, ephemeris, and
     airmass information, invaluable for planning observing
     runs. Jskycalc is the new graphical version that runs on any
     platform, and has an AstroBetter walkthrough. Also available as
     the classic shell version.

* Multinest, PyMC, or emcee for Bayesian statistical analysis.

* Gemini Observing Tool

                
## IDL

Of course IDL is commercial software, but it is widely used in some of the astronomy
community, and the current owner will happily sell you a $$$ license for linux.
If you are lucky, your IDL scripts will work under GDL

        sudo apt install gnudatalanguage -y

or perhaps somebody has ported it to python.  The idlastro (sp?) library is well
supported.


## Publishing: LaTex

Widely used in astronomy, and pretty straightforward to install:

      sudo apt install texlive texlive-latex-base texlive-publishers -y
      sudo apt install texlive-bibtex-extra bibtexconv

there are some neat bibtex organizing tools we should advertise here too. 

what about PDF annotation, useful if you make your own PDF libary. I use okular, but that's
KDE centric. And a PDF library search engine, you store your PDF's in a big container, and have it indexed.

Xournal is a program where you can also add a signature file to a PDF.

Overleaf is heavily used by a lot of astronomers. But did you know you can keep
a local copy on your own system using git? And even make local changes and push them
back to overleaf? It's always a good idea to have a 2nd backup. Under the top left MENU button for
a document, you will find the **git** link (not the github).

Some agencies have strict font requirements.  The MS fonts library is freely available for this:
     
      sudo apt install ttf-mscorefonts-installer -y
      fc-cache -f

this will give you "Arial", "Times New Roman", and "Impact", to name a few.
Also useful for LibreOffice.

Bibtex:  managing your references?  see for example https://bibmanager.readthedocs.io/en/latest/

      pip install bibmanager

## Publishing: LibreOffice

This actually comes standard with Ubuntu. But maybe a few comments are in place here:

* it will never be 100% compatible with MS Office
* you can open most PDF files and edit them directly, useful for filling out PDF forms. 
* there are actually several other open source MS Office clones.
  E.g. OnlyOffice, G Suite, OpenOffice, WPS Office, Collabora Office, FreeOffice 2021, SoftMakerOffice 2021

## Other tools

* gedit - is this the easy way not to offend emacs or vim users ?
* mg - microscopic GNU Emacs-style editor (micro-emacs?)
* sublime, atom - code editors - not in ubuntu
* aspell and aspell-dict-en
* gimp
* xfig and GraphicsMagick
* dia
* imagemagic
* xv, geeqie, ...
* IDE/editors: Eclipse, VSCode, Geany, PyCharm, Atom, Emacs, Vim
* backup tools:   rsync, unison

## "amateur" tools

I'm not sure if people who spend 100k on equipment are still called "amateur" ?

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

ESO SciSoft is gone.  LfA (Linux for Astronomy) is also gone.


## Universal Binaries, Russian Dolls and other such containers

Unix used to be a little simpler, there was just Unix. Now we have virtual machines, containers etc.etc.
Within Linux there is another type of fragmentation going on, coming out of the frustration of
so many Linux distrutions, and that is the distribution agnostic executable. But first a few
names to put some terms on the table you may have heard about

* appimage
* flatpak
* snap
* docker
* podman
* virtual machine (VirtualBox, VMware, gnome boxes, KVM, qemu, Sosumi)
* machine emulators (darling (for macOS), wine (for Windows), dosbox (for DOS))
* kubernetes


### AppImage

This is the simplest of the "build once, run anywhere" executable in linux. super simple,
download one file, make it exectable
(**chmod +x**) and run it. All the pain is for the developer. Has some (security?) issues?
AppImages are not signed (some AppStored refuse to publish those)
and do not support ICU (language extensions), for one. So unclear how long they will survive,
but if you find an appimage, it will be the easiest to use. A popular program of
which you can often find pre-released in this format is Digikam (a photoshop type program).

### flatpak

This is RedHat's attempt to provide portable executables that can be deployed anywhere. Remember this thing
called "build once, run anywhere" ? How did that work out for you?

Well, I have  bones to pick when you have mounted filesystems. More about that below.
But just to give an example, this is what I had to do the other day (I may find a better way,
I don't like the sudo portion)

      sudo apt install flatpak
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install flathub org.kde.digikam
      
after which you can run it as follows

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

Probably **virtualbox** is the way to go. If you head over to https://osboxes.org, there are a large number
of images ready to be used, saving you the sometimes painful process in VirtualBox to ingest an ISO
image.

      sudo apt install virtualbox

The package **gnome-boxes** provides another virtual machine environment. Does it require Gnome ???

### Kubernetes

Useful to know it exists, but out of scope for this paper?

## Startup Files

In addition to you .bashrc (or .cahrc etc.) there are other tools to keep your shell environment organized.
One is the **direnv** command, which allows you to keep project specific environment variables.

Another is my own, the *rc* alias, which depends on an ~/rc/PROJECT.rc file in which you place your
own project dependant commands. This also serves as a *self-documenting*

I use the following bash alias :

    rc () {
      if [ ! $1 ]; then
        echo No project listed, known ones are:
        cd ~/rc
        ls *.rc | sed s/.rc//g
      elif [ ! $2 ]; then
        source ~/rc/$1.rc
      else
        more ~/rc/$1.rc
      fi
    }
	
## Pandemic

During the 2020+ pandemic we all learned communications were now channeled through
a large number of apps, depending on the preference of the group. 

1. zoom
2. google meet (formerly google chat)
3. microsoft teams
4. skype
5. slack
6. discord
7. --virtual world--
8. webex

and maybe more, but these are the ones I've used at least ones.


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
LibreOffice (and competitors now around too; see earlier list)
Pdf tools:   mostly, how do I edit a PDF, my university/NSF often asks this
  (acroread is pretty useless, libreoffice does open PDF files)
  xournal
  PDFtk

ADS tools to set up my bibtex files?  (bibmanager?)
   texlive-bibtex-extra

Does font substitution solve some of the importing of slides from PPT(x) to LibreOffice?
    sudo apt install ttf-mscorefonts-installer
but still i don't the all import calibri

    mkdir ~/.fonts
    wget -qO- http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer | bash

See also http://www.pcworld.com/article/2863497/how-to-install-microsoft-fonts-in-linux-office-suites.html


ADS, arXiv, ORCID id, https://www.astrobetter.com/blog/2018/05/28/welcome-to-the-new-ads/

My CV tools

## Remote Computing

I love remote computing, but over the years certain implementations
have made the classic X11 based copy and paste a bit more
cumbersome. If you are used to the simple  "left click select and copy via middle click paste",
this will not always work, in fact there are situations where even using a cumbersome clipboard
does not work anymore (e.g. SciServer). Blame it on russian dolls?

My benchmark is double left click a word in one window (it selects it, use triple left click to select the whole line)
and middle click to paste. This is efficient!

Even within Linux, certain apps now involve more elaborate ways to copy and paste.


## ssh

One way to do remote computing is via ssh, one terminal at a time (more persistency
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

Once you have established an ssh connection to your server, you could learn how to NSF mount
drives, but this requires admin (root) permissions. Perhaps an easier way is to use ssh again using
the **sshfs** protocol. Here is an example

      sudo apt install sshfs fuse

      mkdir -p $HOME/mnt/data3
      sshfs 192.168.1.110:/data3 $HOME/mnt/data3

to mount the remote directory in $HOME/mnt/data3.   And to umount it, use

      fusermount -u $HOME/mnt/data3

### vnc

VNC is the classic way to view a remote desktop in linux. Your server needs vncserver, you local host
needs vncviewer and vncpasswd. An alternative is the **tightvnc** version

      sudo apt install xtightvncviewer tightvncserver -y

### krdc

What about krdc?

### x2go

Excellent way, uses ssh, compresses much better than vnc. But needs the remote to have the x2go server
installed. In that sense , vnc is easier to use, just a bit slower.

### teamviewer

Teamviewer is another remote desktop viewer, much like x2go and vnc. Free for academic use.
This will be a manual install, it does not come with Ubuntu. I used
https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

### Compressing files

1. .gz  (gzip, gunzip, tar ztvf)
1. .bz2 (bzip2)
1. .tar (tar)
1. .rar (rar)
2. .xz  (tar tvf)
3. .7z  (7z, p7zip, 7zz)
3. .zip (unzip)
4. .fz  (funpack,fpack)
4. .lz4 (unlz4)

## A Whole New World

You can replace all major components of your desktop environment with others, and get
a very new look and feeling. Many online articles describe them. Here's just one of
those. We leave is as an excersize for the reader to fill in the gaps

1. launcher/search tool:   Albert  https://albertlauncher.github.io/installing/
2. terminal:   Tilix
3. shell:   fish
4. browser:  brave with DuckDuckGo as default search engine
4. editor:
4. IDE:
5. faster loads:   "sudo apt install preload"


My take on this:  it's never 100% the same, so why bother.


### Online help vs. Offline help

The unix *man* and *info* command give a lot of help. But if you are offline, this can be a problem.
A neat tool that solves this is "zeal"

      sudo apt install zeal

After installation, you will need to select from a large set of *Docsets* which ones you like to
install locally. Pick your poison.


## Quick Install

You can also download my **ubuntu20.list**, which is a long list of all the package we discussed here,
and install everything in one long download. You could always inspect this file and comment out the
one you don't need and then run it. Thare are some sparing comments in the file:

    sudo apt install  $(grep -v ^# ubuntu20.list) -y

or if you don't want to select and have enough disk space, try this

    sudo apt install astro-all

these are about XXX (300?) packages in 3GB.

## Maintenance

As time progresses, you will notice your root partition might fill up, and you don't want this to
get to close to 0. A program such as **bleachbit** can help with this. Here are a few additional
comments.

### Slackspace on ext4

If you were using a filesystem like ext4, it has a rather large default slackspace that root reserved. Try and
setting it smaller, or even to 0:

      sudo ... /dev/ -m 0
	  
### Remove unused programs by snap / flatpak



      snap list
	  snap remove yakyak

and

      flatpak list
	  flatpak remove org.freedesktop.Platform

### Applications that cache

Check the size of your cache directories:

	  du -s /var/cache/apt /var/log ~/.cache
	  
The apt cache can be cleaned using:

      sudo apt update
      sudo apt clean
      sudo apt autoremove
      sudo apt autoclean
	  
For me the 	~/.cache/pip is always huge, but your browser also tend to leave a lot of files here. 
cleanup as you see fit.   Also note depending how you partitioned your drive space, these cache
may be on different disks.

      pip cache purge
	  
Keeping old kernels around can easily accumulate disk space. 


      sudo apt autoremove --purge
	  
	  sudo purge-old-kernels

## Privacy?

This article does not deal with [privacy](https://www.privacytools.io/), but it
is good to be aware that different distros deal with this in different ways.
In general, Linux is a good OS that is concerned about this.


## Summary of tools

The names of the tools are not always obvious for somebody coming from
another OS (or even between Gnome based and KDE based linux). So here
are some popular ones:

* Emacs (editor)
* Gnome Terminal or Konsole (terminals)
* Peek (GIF recording)
* Kdenlive (Video editing)
* GIMP (Photo editing)
* Darktable (RAW Photo editing)
* FFMPEG (Converting videos etc)
* ImageMagick (Converting and resizing images)
* LibreOffice (Spreadsheets, Presentations, etc.)
* Evince or Okular (PDF reading and annotating)

## References

* [What operating systems do astronomers use
  ](https://www.astrobetter.com/blog/2011/12/20/os-apt-astronomers/) - 2011

* [What Operating Systems Do AstroBetter Readers Use?
  ](https://www.astrobetter.com/blog/2011/12/28/astrobetter-operating-systems) - 2011

* [Setting up Python for Astronomy
  ](https://www.astrobetter.com/wiki/Python+Setup+for+Astronomy)   - 2014

* [Setup a New Mac for Astronomy
  ](https://www.astrobetter.com/wiki/tiki-index.php?page=Setup+a+New+Mac+for+Astronomy) - 2016

* [Setup a New Ubuntu for Astronomy
  ](https://www.astrobetter.com/wiki/tiki-index.php?page=Setup+a+New+Ubuntu+for+Astronomy) - TBD

* [AlternativeTo: Crowdsourced Software Recommendations
  ](https://alternativeto.net)

* [Debian Astro
  ](https://blends.debian.org/astro/)


## Acknowledgements

I wish to thank Marc Pound and Ollie Streicher for checking their own
Ubuntu and Debian systems, and making sure I wasn't lying too much
since I stuck to Kubuntu. This draft is the precursor to the Astrobetter Wiki
version on setting up your (Ubuntu) Linux.

If you read this elsewhere, a version of this document is also maintained on
https://github.com/teuben/teunix/blob/master/docs/astronomy-on-ubuntu.md
