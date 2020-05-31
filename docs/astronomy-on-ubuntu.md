# Astronomy on Ubuntu Linux a.k.a. Linux Setup


On the [AstroBetter WiKi](https://www.astrobetter.com/wiki/Wiki+Home)
a whole section is dedicated to
[Mac Setup](https://www.astrobetter.com/wiki/tiki-index.php?page=Setup+a+New+Mac+for+Astronomy).
Is **Linux** so much easier that we don't need one?   It used to be really involved,
but recently I started from scratch with an Ubuntu 20.04LTS (supported
for 5 years!). You could also argue Linux is used more by geeky types who know
a lot of what's going on in the trenches, and they don't bother writing it up.  We are
going to change that here!

*We could start the same way as the Mac Setup page does, which brings to mind we could bash a bit, no pun intended*:

If you're a scientist with a new Linux computer, read on. This page
assumes you want to write scripts, reduce data, plot results, work
with LaTeX, and give presentations, among other handy things. This is
not a tutorial. We will point out some salient differences how things
work on a Mac.

As a brief introduction: Linux is a catch-all name for a linux kernel
and GNU based operating system. Linux is part of the Unix family, of
which Mac OSX is also.  So many tools you will see described here,
apply to Mac as well. It normally comes with a choice of a few
graphical interfaces (e.g. GNOME, KDE,XFCE, ....), which we will not
cover here.

[ Find out which version of Linux you have. You can either look at the
file **/etc/issue**  or one of  **/etc/debian_version** or **/etc/redhat-release**. If that does
not tell you enough, try the command **lsb_release  -a**. ]


Many of these apps are large files and will take a while to
download. You should be on a good internet connection and allow at
least a couple hours to complete the entire setup.

One last thing, most of the installation if terminal based, that should be
no surprise.

## Bootstrap your packages

Although we'll discuss quite a few packages in some detail, there are
some very very basic ones that most of us will need right away, so
consider this the boostrapping procedure, as Ubuntu doesn't come with
these. This is the command to install them

      sudo apt install git emacs tcsh wget curl unzip openssh-server -y

## Package tools

      dpkg -S file                 which package owns that file
      dpkg -L package              list what files the package gives
      dpkg --list                  list all we have
      apt-get -f install           post-install if error occurs
      apt autoremove               cleanup old stuff

In addition

## Neat things about Ubuntu

* if you type a command that Ubuntu knows exists, but you didn't install yet, it will remind you. For example if you
typed **ds9** you might see

      sudo apt install saods9

* the command **xdg-open** will open a file with the appropriate mime-type

## Less nice things about Ubuntu

* snaps and flatpaks  (appimage work a lot better ) - but this is controversial
* related to xdg-open:   when you install certain new packages, sometimes this will trump the program you had before
  and you loved. I've been unpleasantly bitten by this a few times. My JPG's were opened by gwenview, when I installed
  krita, suddenly by this krita editor. WTF.  Now where again is this mime-type list and how do you edit it?  This will
  sadly depend onthe distro.    Kubuntu is different from Ubuntu. grrr.

## Astronomy Packages

Ubuntu does come with a modest set of tools precompiled

      sudo apt install montage aladin saods9 xpa-tools pgplot5 -y
      sudo apt install aoflagger ftools libcfitsio-dev libccfits0v5 topcat -y
      sudo apt install gnuastro -y

There are 2000+ packages registered now in [ASCL](https://ascl.net), .....


## Change Shell - bash or tsch

To note here is there is some zsh movement as a better bash. Also discuss the **chsh** command, because MacOS is not
true to linux, it doesn't work there. On a Mac they don't distiguish anymore between a login and an interactive shell,
which is why on a mac you need to edit your .bash_login file, and on linux the .bashrc

On a default Ubuntu (t)csh is not even installed, only bash.

bash has smart file completion, which can be super annoying at times. do I really need to explain?

## XQuartz & X11

there is no such thing on Linux (yet). It just works, and it's called X11.   There is a move towards Wayland,
but that's still experimental.

## XCode: Command Line Tools + Compilers

there is no such think on Linux. It just works, and it's part of the
packaging system. No need for Xcode, or Port, or Brew. It's all in the same packaging system.

One thing to note: there is a **brew** version for linux now. I personally don't quite understand why
you would want to do that, but if there is something in brew that cannot be found somewhere else,
be me guest and head over to https://docs.brew.sh/Homebrew-on-Linux

## Python

* native ubuntu
* miniconda
* anaconda
* AstroConda (is that still viable?)
* Python (install from source)

Do we need to say something about virtual environments?

## IRAF/PyRAF

## Other Development stuff

git, hub, gitg, gitk, meld, tkdiff


## Other Astronomical Software

*  DS9 can be installed via MacPorts (sudo port install ds9).  Here is an XPA error page for getting DS9 to play with PyRAF/IRAF (unverified recipe: include export XPA_METHOD=local in .bashrc or setenv XPA_METHOD local in .csrhc)

* Heasarc's fv fits viewer is handy for visualizing FITS files.

* Skycalc, by John Thorstensen, provides almanac, ephemeris, and
     airmass information, invaluable for planning observing
     runs. Jskycalc is the new graphical version that runs on any
     platform, and has an AstroBetter walkthrough. Also available as
     the classic shell version.

* Multinest, PyMC, or emcee for Bayesian statistical analysis.

* PGPLOT

* Gemini Observing Tool

## IDL

IDL is commercial software. If you are lucky, it will work under GDL,
or somebody has ported it to python. Alternatively you can pay for a license.

## LaTex

      sudo apt install texlive texlive-latex-base texlive-publishers -y

there are some neat bibtex tools we should advertise here.

what about PDF annotation, useful if you make your own PDF libary. And a library
search engine, you store your PDF's in a big container, and have it index.

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

I'm not sure if people spend 100k on equipment, they  are still called "amateur" ?

- skytools such as
  - celestia
  - stellarium
  - kstars
  - AstroImageJ
  - Skychart
  - Digital Universe Atlas (AMNH)
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

Also recognizing the vast amount of legacy FORTRAN software for
astronomy, our repositories contain both GFortran and G95 to allow you
to run almost all of them. GFortran is installed by default while G95
is available via apt-get.

In particular, we are looking for people highly familiar with Debian
packaging who are willing to create binary and source packages for
IRAF, CASA, CIAO, ESO's SciSoft Collection, and NASA's FTOOLS.


## PJT stuff to be organized

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
community deals with portability: snaps,flatpaks and appimages. This
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

Dotfiles: another cottage industry. Seaarching in github for ditfiles gives you > 100 thousands. Talk about reinventing the universe.

It's instrumental to know a few shortcuts about your package
manager. When you compile a program and find that it needs a file, you
can use locate, or dpkg -S, or dpkg -L to sherlock your way around the
system to solve your problem. Of course google and stackoverflow can
also be very useful.

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

    sudo apt install `cat ubuntu20.list` 


## Related articles

* [Setting up Python for Astronomy
  ](https://www.astrobetter.com/wiki/Python+Setup+for+Astronomy)

* [Setup a New Mac for Astronomy
  ](https://www.astrobetter.com/wiki/tiki-index.php?page=Setup+a+New+Mac+for+Astronomy)

* [What operating systems do astronomers use
  ](https://www.astrobetter.com/blog/2011/12/20/os-apt-astronomers/)

* [What Operating Systems Do AstroBetter Readers Use?
  ](https://www.astrobetter.com/blog/2011/12/28/astrobetter-operating-systems)
