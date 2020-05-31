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

*Following in the steps of the Mac Setup page:*

If you're a scientist with a new Linux computer, read on. This page
assumes you want to write scripts, reduce data, plot results, work
with LaTeX, and give presentations, among other handy things. This is
not a tutorial. We will point out some salient differences how things
work on a Mac.

As a brief introduction: Linux is a catch-all name for a linux kernel
and GNU software based operating system. Linux is part of the Unix family, of
which Mac OSX is also one.  So many tools you will see described here,
apply to Mac as well. Linux normally comes with a choice of a 
graphical interface (e.g. GNOME, KDE, XFCE, ....), which we will not
cover here. We will also not cover the actual installation of
Ubuntu Linux. 

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
consider this the boostrapping procedure, as Ubuntu doesn't come with
these. This is the command to install them

      sudo apt install git emacs tcsh wget curl unzip openssh-server -y

## Package tools:  apt and dpkg

It's very useful to know a few shortcuts about your package
manager. When you compile a program and find that it needs a file, you
can use **locate**, or **dpkg -S**, or **dpkg -L** to sherlock your way around the
file system to solve your problem. Of course *google* and *stackoverflow* can
also be very useful. Here are a few example commands:


      dpkg -S file                 which package owns that file
      dpkg -L package              list what files the package gives
      dpkg --list                  list all packages we have
      apt-get -f install           post-install if error occurs
      apt autoremove               cleanup old stuff not needed anymore

And here is how to creat a list of all possible packages (there are over 60,000)
and installed packages. Useful if you like commands like **grep**:

      apt-cache search  .  > apt-cache0.list
      apt-cache pkgnames   > apt-cache1.list
      grep fits apt-cache0.list
      dpkg --list          > dpkg0.list
      

In addition, if you install synaptic and aptitude, you have the more classic debian style queries
available

      sudo apt install synaptic aptitude -y
      aptitude search '~i !~M' 

## Neat things about Ubuntu

* if you type a command that Ubuntu knows exists, but you didn't
install yet, it will remind you. For example if you typed **ds9** you
might see

      sudo apt install saods9

* the command **xdg-open** will open any file with the appropriate
mime-type. If the argument is a directory, a file browser
(e.g. Nautilus or Dolphin will be used)

* TBD

## Less nice things about Ubuntu

* snaps and flatpaks (appimage work a lot better ) - but this is
controversial. I'll devote a whole section on this below.

* related to xdg-open: when you install certain new packages,
sometimes this will trump the program you had before and you
loved. I've been unpleasantly bitten by this a few times. My JPG's
were opened by gwenview, when I installed krita, suddenly by this
krita editor. WTF.  Now where again is this mime-type list and how do
you edit it?  This will sadly depend onthe distro.  Kubuntu is
different from Ubuntu. grrr.

* TBD

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

## IRAF/PyRAF

TBD ?

## Other Development stuff

git, hub, gitg, gitk, meld, tkdiff


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

## IDL

Of course IDL is commercial software, but it is widely used in some of the astronomy
community, and the current owner will happily sell you a license. If you are lucky, it will work under GDL,
or somebody has ported it to python. 

        sudo apt install gnudatalanguage -y

## LaTex

      sudo apt install texlive texlive-latex-base texlive-publishers -y

there are some neat bibtex tools we should advertise here.

what about PDF annotation, useful if you make your own PDF libary. And a library
search engine, you store your PDF's in a big container, and have it index. 

## LibreOffice

This pretty comes standard with Ubuntu. But a few comments are in place here:

* it will never be 100% compatible with MS Office
* you can open most PDF files and edit them directly, useful for filling out PDF forms
* there are several other open source MS Office clones. (list them?)

## Other tools

* gedit      
* aspell and aspell-dict-en
* R
* gimp
* xfig and GraphicsMagick
* dia
* imagemagic
* xv, geeqie, 

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

### from distroastro (seems to be a sleeping project)

http://www.distroastro.org/changelog/

Focus on Professional Astronomy UseDistro Astro 2.0 Pallas has
improved compatibility with software used by professional astronomy,
e.g., IRAF now has FITS set as default image type and CASA can now be
more easily installed.

Our developers recognize that many astronomers are moving to Python as
a preferred programming language, and 2.0 Pallas reflects this
trend. The preinstalled Python Astropack includes PyRAF, AstroPy,
PyFITS, PyWCS, VOTable, NOVAS, and astrolib.coords. In addition, the
repositories also contain SciPy, CosmoloPy, APLPy, PyEphem, and
NASA's OSCAAR software that are installable via apt-get.

In particular, we are looking for people highly familiar with Debian
packaging who are willing to create binary and source packages for
IRAF, CASA, CIAO, ESO's SciSoft Collection, and NASA's FTOOLS.

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

RedHat's attempt to provide portable executables that can be deployed anywhere. Remember this thing
called "build ones, run anywhere" ? How did that work for you?

Well, I have  bones to pick when you have mounted filesystems. More about that later.
But just to give an example, this is what I had to do the other day (I may find a better way,
I don't like the sudo portion)

      flatpak install flathub org.kde.digikam
      flatpak install flathub flatseal           
      sudo flatpak override org.kde.digikam --filesystem=/Photos
      flatpak run org.kde.digikam

especially the last command to run the **digikam** command.

### snap

This is Ubuntu's (i.e. Canonical) answer to portable executables. Don't look nice at all either, your mount table
will look horrific. Has the same kind of problem with files or directories that are symlinked out of
your /home. Talk about mount/bind ?   Also, some people object to the fact that not all of the
snap infrastructure is open source.

### docker

Out of scope for this paper?

### kubernetes

Out of scope for this paper?

## old PJT stuff to be organized

Although I have been using Linux for Astronomy for 25 years now, the
community has made enormous strides in making it easy to use astronomy
software. The ASCL now contains about 2000 entries, most of which can
be installed on Linux or Mac fairly straight.  Struggling before, now
so much more mature.

In this article/blog I would like to cover how to set up your Ubuntu
system for professional astronomy. This is a moving target So this
writeup is for the 2020 version of Ubuntu. Althugh I use the kubuntu
flavor, the details do not differ if yu use Ubuntu, or Xubuntu, or any
of the close derivatives.  Any other debian based system should also
(mostly) work, but the translation to a RedHat based system, for
example we use Centos at work, is a different story.  If there is
enough interest, I could be persuaded to try and write that up as
well.


Then you need to know about at least three different ways how the
community deals with portability: snaps, flatpaks and appimages. This
is a new thing very peculiar to Linux, and in my opinion a very sad
development, because of it's side-effects on your
system. However, opinions vary widely, and there are strong
proponents.  Lets take an example. Zoom is now a very common piece of
software for us now, and when you download you have to pick your kind
of distribution. Mostly because of the shared libraries that can
subtly vary, plus each OS has a different way to package the
software. So on redhat based system they use RPM files, on
debian/ubuntu they use DEB files etc.

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

Dotfiles: another cottage industry.
Searching in github for ditfiles gives you > 100 thousands. Talk about reinventing the universe.


The little gems

Sshfs

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

ADS tools to set up my bibtex files?
My CV tools

## Quick Install

You can also download my **ubuntu20.list**, which is a long list of all the package we discussed here:

    sudo apt install  $(grep -v ^# ubuntu20.list) -y

## Related articles

* [Setting up Python for Astronomy
  ](https://www.astrobetter.com/wiki/Python+Setup+for+Astronomy)

* [Setup a New Mac for Astronomy
  ](https://www.astrobetter.com/wiki/tiki-index.php?page=Setup+a+New+Mac+for+Astronomy)

* [What operating systems do astronomers use
  ](https://www.astrobetter.com/blog/2011/12/20/os-apt-astronomers/)

* [What Operating Systems Do AstroBetter Readers Use?
  ](https://www.astrobetter.com/blog/2011/12/28/astrobetter-operating-systems)
