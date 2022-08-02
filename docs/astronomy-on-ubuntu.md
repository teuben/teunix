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
if you have been missing out on some new cool tools.

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

[ Many of your desktop settings can be in a series of environment variables starting with XDG_,
e.g. $XDG_CURRENT_DESKTOP


Many of the apps are large files and can take a while to
download. You should be on a good internet connection and allow at
least a couple hours to complete the entire setup.  Most of the
installation covered here is terminal based, that should be no surprise,
though GUI alternatives exist.

## 1. Window managers, and what not to cover

Although I don't want to cover the choice of window managers (there are
several good options), your daily life will probably depend more on this choice than
on the choice of the Linux distribution. Equally so, I spend a considerable
time of my online life in an editor, which is not something I will discuss
here either.

      distro:             redhat/fedora,   debian/ubuntu/, ...
      window manager:     kde, gnome, xfce, ...
      editor:             emacs, vim, kate, sublime, ...

Since the apps are "all the same", the choice of distro or window manager
is hardly relevant.


## 2. Packages

This is now getting seriously complicated:   apt, snap, flatpak, AppImage, npm, pypi (pip/conda), and even brew.

### Bootstrap your packages

Although we will discuss a few astronomy related packages, there are
some very basic ones that most of us will need right away.
Here is my favorite command to boostrap on Ubuntu:

      sudo apt install  git emacs tcsh wget curl unzip openssh-server -y

you can get away without emacs if that's not your editor of choice, as **vim**
always comes installed with any Linux distro.

A new release does not add a lot for system development (compilers etc.) either,
so to this:

      sudo apt install build-essential gfortran cmake -y
      
NOTE: U22 comes with gcc 11.2. 

### Package tools:  apt and dpkg

It is useful to know a few shortcuts about your package
manager. When you compile a program and find that it needs a file, you
can use commands such as **locate**,
or **dpkg -S**, or **dpkg -L** to sherlock your way around the
file system to solve your problem what's missing.
Of course *google* and *stackoverflow* can
also be very useful. Here are a few example commands:


      dpkg --list                  list all packages you have
      dpkg -S FILE                 which package owns that FILE
      dpkg -L PACKAGE              list what files that PACKAGE has installed
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
      

In addition, if you install **synaptic** and **aptitude**, you have the more classic debian style queries
available

      sudo apt install synaptic aptitude -y
      aptitude search '~i !~M'

Depending on what flavor of Ubuntu you use, there are different GUI tools to install software. For
example, 
*Discover* for Kubuntu (executable name: **plasma-discover**), and
*Software & Updates* (executable name: **software-properties-gtk**) for classic Ubuntu.

### Alternative package managers?

[Package Managers](https://itsfoss.com/package-manager) used to be tied to the Linux Distribution.
Even on a Mac, you may like certain packages that are available via **brew**, as Xcode
does not provide a typical astrocomputing environment. It turns out, *Homebrew* can
also be installed on Linux: https://docs.brew.sh/Homebrew-on-Linux

Another alternative methods to install applications not available through the regular
channels are *FlatPak* and *snap*, which we cover in more detail below,
as well as the *AppImage* style of programs.

By using such alternate app channels, you can effectively make the official
version hidden, though can come with some restrictions.

## 3. Astronomy Packages

Ubuntu does come with a modest set of astronomy packages. Here are some of my favorites:

      sudo apt install montage aladin saods9 xpa-tools topcat  -y
      sudo apt install libcfitsio-dev libccfits0v5 ftools-fv pgplot5 -y
      sudo apt install gnuastro -y

### astro debian blend

If you want to adopt the whole *astro debian blend*

      sudo apt install astro-all -y

which will consume about 2xx packages in 3GB (now 5GB in U22??)
This will get you everything and then some. Lots of python3 updates to your system,
so this is useful.

### KERN

This extremely large well supported [KERN package](https://kernsuite.info/) is now available
for Ubuntu20.04, but not yet for U22.  There are
XXX packages in KERN, and mostly useful for radio astronomy. Some overlap with
the previously mentioned debian astro blend.  *(there is a conflict with casacore-data)*

Here is the example how you get started in Ubuntu 20.04

        sudo apt-get install software-properties-common
        sudo add-apt-repository -s ppa:kernsuite/kern-7
        sudo apt-add-repository multiverse
        sudo apt-add-repository restricted
        sudo apt-get update

After which you are ready to install some packages, for example meqtrees:

        sudo apt-get install meqtrees


### "amateur" tools

I'm not sure if people who spend 100k on equipment are still called "amateur" ?

- skytools such as
  - celestia
  - stellarium
  - kstars
  - AstroImageJ
  - Skychart
  - Digital Universe Atlas (AMNH) - partiview
  - OpenUniverse Space Simulator
- astrophotography:
  - gimp, darktable, digikam, ekos
  - fitscli (fits liberator)
  - pixinsight
- OpenRocket
- http://www.distroastro.org/   (mate based)



### ASCL

The [Astrophysics Source Code Library (ASCL)](https://ascl.net) is a registry where
you can find 2000+ (and growing) codes listed from (peer reviewed) papers.
Most of those you will have to install via source. ASCL has a pretty good search
tool to find related codes. You can also find ASCL codes via papers, for example
if you look at CGS at https://ui.adsabs.harvard.edu/abs/2019ascl.soft04003T


## 4. The Good and the Bad about Ubuntu

### Neat things 

* if you type a command that Ubuntu knows exists, but you didn't
install yet, it will remind you. For example if you typed **ds9** you
might see

      sudo apt install saods9 

* the command **xdg-open** will open any file with the appropriate
mime-type. If the argument is a directory, a file browser
(e.g. Nautilus or Dolphin will be used). On a Mac you will find a
similar command, aptly called **open**

* ...

### Less nice things 

* snaps and flatpaks (arguably appimage as well) - but this is
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
astronomy legacy applications (e.g. *karma*) that have not been converted,
and probably never will (if only we had the source code).


* ...

### Ugly?

There is no ugly! Though the existence of many flavors of Linux,
and desktop environments are often quoted as keeping Linux from
becoming dominating in personal computing.

## 5. Change Shell - tsch, bash or zsh?

Ubuntu comes with a default shell called **bash**, but some die
hards might like to stick to **(t)csh**, or maybe adopt
**zsh** (as a *better bash*).  The **chsh** command will do this for
you, but MacOS is not always true to Unix, it doesn't work there.  On
a Mac they don't distiguish between a login and an interactive
shell, which is why on a Mac you need to edit your **.bash_login**
file, and on linux the **.bashrc**. anaconda knows about this!

In **bash** directory completion can be very annoying if you use
environment variables, you could consider adding the following to your
**.bashrc** file:

      shopt -s direxpand

## 6. Software Versioning

The **module** command, if installed, allows users to load a
specific version of specific software. This is done in run-time. It is
a very popular tool on large data centers and supercomputers. The
command **module avail** should then list what is available.

      sudo apt install environment-modules -y
      add.modules
      module avail

An an example of use:

      module load mpi/2021.3.0 

Most distributions also have a method by which certain tools (e.g. the compiler)
can be defaulted to another version. To use the example of the compiler, the default
C compiler, gcc, might be version 11, and by using gcc-12 you can try out a newer
release.   But using the XXX command the default C compile can be made to point to
gcc-12 instead of gcc-11, but only an admin can do this.
Interesting detail: on Ubuntu gcc-12 is used,
on RedHat it is gcc12, no dash here.

Look at /etc/alternatives and you get an idea of the mess.

The command **update-alternatives --list** should give the list what you currently have.

### Dotfiles

Unix stores a lot of application defaults and setup files in files (and directories) that
are hidden from view by starting the name with a . ; hence the name dotfiles.

Dotfile management appears to be quite a cottage industry.
Searching in github for dotfiles gives you over 100 thousands repositories. Seriously?
Talk about reinventing the multiverse. But
if you setup your Unix accounts regularly,
it is probably useful to have a mechanism to get your dotfiles organized. Roll your
own, or steal some ideas from one of the many on github.

### Startup Files or Dotfiles

In addition to you .bashrc (or .cshrc etc.) there are other tools to keep your shell environment organized.
One is the **direnv** command, which allows you to keep project specific environment variables.

Another is my own, the *rc* alias, which depends on an ~/rc/PROJECT.rc file in which you place your
own project dependant commands. This also serves as a *self-documenting* reminder what the heck you
are doing

I use the following bash function for this

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
	

## 7. Remote Computing

I love remote computing, but over the years certain implementations
have made the classic X11 based copy and paste a bit more
cumbersome. If you are used to the simple  "left click select and copy via middle click paste",
this will not always work, in fact there are situations where even using a cumbersome clipboard
does not work anymore (e.g. SciServer). Blame it on russian dolls?

My benchmark is double left click a word in one window (it selects it, use triple left click to select the whole line)
and middle click to paste. This is efficient!

Even within Linux, certain apps now involve more elaborate ways to copy and paste. The classic left mouse select
(single, double or triple click) for Copy and middle mouse button for Paste does not always work. Some applications
now require a keyboard prefix using *Ctrl* or *Ctrl+Shift*. 


### ssh

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
      
      # pesky servers that time you out
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

### VPN

Many academic institutions now require a VPN (often with 2FA) for
more secure network access.  For example at UMD we use *Palo Alto Networks*
**globalprotect**, for which an Ubuntu 20.04 version is available on
https://terpware.umd.edu/Linux/Title/4010

      sudo dpkg -i GlobalProtect_UI_deb-6.0.0.1-44.deb

Be aware that VPN can disable your local home net, and perhaps your networked printers as well.
NordVPN advertises a solution for this. viz.

      nordvpn set technology openvpn
      nordvpn set protocol tcp
      sudo nordvpn whitelist add port 22
      sudo nordvpn whitelist add subnet 192.168.0.0/16

### vnc

VNC is the classic way to view a remote desktop in linux. Your server needs **vncserver**, you local host
needs **vncviewer** and **vncpasswd**. An alternative is the **tightvnc** version

      sudo apt install xtightvncviewer tightvncserver -y

An alternative to VNC for persistent sessions is **screen** and **tmux**

### x2go

Excellent way, uses ssh, compresses much better than *vnc*. But needs the remote to have the *x2go* server
installed. In that sense, *vnc* is easier to use, just a bit slower.

     sudo apt install x2goclient

### krdc

What about krdc?


### teamviewer

Teamviewer is another remote desktop viewer, much like x2go and vnc. Free for academic use.
This will be a manual install, it does not come with Ubuntu. I used

     wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
     sudo dpkg -i teamviewer_amd64.deb

## 8. Python

Python is so widely used in many projects, that we spend a small section on it here.

Although python2 is deprecated, the commands python or ipython sometimes still refer to version 2.
A safe bet is to refer to **python3** and **ipython3** explicitly. Debian, Redhat and Anaconda
have different default behaviors.

U22 comes with python 3.10.4.  But no pip3 gets installed by default.

Summarizing some methods to install/use *python*:

* native ubuntu (apt install)
* miniconda - a smaller version, manual install
* anaconda - a full version, including astropy (this is my own preferred way)
* AstroConda (is that still viable?) - IRAF/pyiraf
* Python (install from source) - nobody does that anymore

If you prefer to use the native Ubuntu version, these should be useful:

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

Using jupyter notebooks has become very popular to showcase software examples.

### R

but what about R. they usually have a lot of packages you need.

### IDL

Of course IDL is commercial software, but it is widely used in some of the astronomy
community, and the current IDL owner will happily sell you a $$$ license for linux.
If you are lucky, your IDL scripts will work under GDL, an open source version
of

        sudo apt install gnudatalanguage -y

or perhaps somebody has ported it to python.  The idlastro (sp?) library is well
supported.


## 9. More Development stuff

Developing software and writing papers, collaborative or not, is very useful with one
of the modern Content Management Systems (CMS), and **git** is probably the main contender these
days. If you use *Overleaf*, you can use their git interface as well.

      sudo apt install git hub gitg gitk meld tkdiff -y

and if you need to need some legacy CMS, try

      sudo apt install rcs cvs subversion mercurial -y

NOTE: should cover the official **gh** (github desktop) command.

### what about all the *-dev packages

If you develop your own code, or compile from scratch, you will undoubtedly need the development packages
for the libraries you will need to link with.  It has been tradition that the runtime and development
are in separate packages. On debian based systems they are often labeled with **-dev**, but on redhat
with **-devel**.  Here are a few common ones used in astronomy, pick your favorites:

      sudo apt install wcslib-dev libfftw3-dev libcfitsio-dev libgsl-dev xorg-dev -y
      sudo apt install libhdf5-dev hdf5-tools libboost-dev libsqlite3-dev -y



sadly there is no standard on the basename.  For example on redhat based system the HDF5 library package name
would be **hdf5-devel** compared to the name **libhdf5-dev** in debian based systems.

                
## 10. Publishing

### Publishing: LaTex

Widely used in astronomy, and pretty straightforward to install:

      sudo apt install texlive texlive-latex-base texlive-publishers -y
      sudo apt install texlive-bibtex-extra bibtexconv

there are some neat bibtex organizing tools we should advertise here too. 

what about PDF annotation, useful if you make your own PDF libary. I use okular, but that's
KDE centric. And a PDF library search engine, you store your PDF's in a big container, and have it indexed.

Xournal is a program where you can also add a signature file to a PDF.

Overleaf is heavily used in astronomy. But did you know you can keep
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

### Publishing: LibreOffice

This actually comes standard with Ubuntu. But maybe a few comments are in place here:

* it will never be 100% compatible with MS Office
* you can open most PDF files and edit them directly, useful for filling out PDF forms. 
* there are actually several other open source MS Office clones.
  E.g. OnlyOffice, G Suite, OpenOffice, WPS Office, Collabora Office, FreeOffice 2021, SoftMakerOffice 2021

## 11. Other tools

The names of the tools are not always obvious for somebody coming from
another OS (or even between Gnome based and KDE based linux). So here
are some popular ones:


* editors: vim, emacs, gedit, mg, sublime, atom
* IDE/editors: Eclipse, VSCode, Geany, PyCharm
* spell checking: aspell and aspell-dict-en
* photo editing/organizing: gimp, krita, darktable, digikam, imagemagick
* pdf tools:  xournal, pdftk, okular, evince
* making diagrams: dia, xfig and GraphicsMagick
* image viewers: geeqie, gwenview
* backup tools:   rsync, unison
* video editing: kdenlive, ffmpeg, peek

### Commercial vs. OpenSource

The most common commercial applications have open source alternatives:

     # COM         # ORG
     IDL           gdl
     matlab        octave
     mathematica   octave, maxima
     photoshop     gimp
     lightroom     darktable
     Office365     LibreOffice
     MS Publisher  scribus
     CorelDraw     inkscape

See also https://www.opensourcealternative.to/ for an expanded version of this


## alternatives

If multiple versions of the same command exist (e.g. the gnu compiler), there is a
is a mechanism in Linux to pick the one you prefer:

      update-alternatives --help

Other methods to this are the **module** command, if thats installed and enabled.


## 12. Universal Binaries, Russian Dolls and other such containers

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
They can fill up your /tmp space.

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

instead of just

      digikam

This runs digikam in a container, so by default you don't see much of what's outside of this. You have
limited access to folders (/home and /media being the exception).

      flatpak install flathub flatseal           
      sudo flatpak override org.kde.digikam --filesystem=/Photos

Now it should be said that if you use the GUI approach, you are better off. No need to remember nasty
ways to run digikam to flatpak, but you do need to understand all the flatseal peculiarities.


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

The package **gnome-boxes** provides another virtual machine environment. 

### Kubernetes

Useful to know it exists, but out of scope for this paper?

## 13. Pandemic: communications

During the 2020+ pandemic we all learned communications were now channeled through
a growing number of apps, depending on the preference of the group. 

1. zoom
2. google meet (formerly google chat)
3. microsoft teams
4. skype (anybody still use this?)
5. slack (starting to charge)
6. discord
7. gathertown
8. webex

and maybe more, but these are the ones I've used at least ones.

## 14. Maintenance: keeping your disk space in check

As time progresses, you will notice your root partition might fill up, and you don't want this to
get to close to 0. A program such as **bleachbit** can help with this. Here are a few additional
comments.

### Slackspace on ext4

If you were using a filesystem like ext4, it has a rather large default slackspace that root reserved. Try and
setting it smaller, or even to 0. For example,

      sudo tune2fs -m 0 /dev/nvme0n1p2

Since the default is 5%, for a 1TB drive this releases 50GB to the user, probably you!
	  
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
	  
For me the ~/.cache/pip is always huge, but your browser also tend to leave a lot of files here. 
cleanup as you see fit.   Also note depending how you partitioned your drive space, these cache
may be on different disks.

      pip cache purge
	  
Keeping old kernels around can easily accumulate disk space. 

      sudo apt autoremove --purge
      
      sudo apt install byobu
      sudo purge-old-kernels

Apart from standard Unix tools like find to check for large files, for example to find files larger than 1GB:

      find $HOME -size +1G -exec ls -l '{}' \;

there are some cool graphical applications to check which directories and files take up the most
space. **k4dirstat**,  **qdirstat** and **baobab** use a treemapping style visualization to show the disk usage
and can be an effective way to clean up your drive space.

      sudo apt install k4dirstat qdirstat baobab -y





## 99. Miscellaneous

### parallel computing

For "old" single core programs there is a great solution on modern multi-core systems to run
such programs in parallel, assuming you need to run a whole series of them, not depending on
each other

      sudo apt install parallel -y

Create a text file with the commands to run, one per line, and then

      parallel -j 4 < run1.txt

will then use up to 4 processors to process all the lines as separate commands
by the shell.
The **make** program has a similar flag, but is arguably
a little harder to use for this simple example.
      
### Bundling and Compressing Files

1. .gz  (gzip, gunzip, tar ztvf)
1. .bz2 (bzip2)
1. .tar (tar)
1. .rar (rar)
2. .xz  (tar tvf)
3. .7z  (7z, p7zip, 7zz)
3. .zip (unzip)
4. .fz  (funpack,fpack)
4. .lz4 (unlz4)
5. .jar (jar)


### Online help vs. Offline help

The unix *man* and *info* command give a lot of help, but if you are offline, it can be a problem
finding reminders on your favoite esoteric tools. A neat program that solves some of this is **zeal**

      sudo apt install zeal

After installation, you will need to select from a large set of *Docsets* which ones you like to
install locally. Pick your poison.


## 99. Quick Install

You can also download my **ubuntu20.list**, which is a long list of all the package we discussed here,
and install everything in one long download. You could always inspect this file and comment out the
one you don't need and then run it. Thare are some sparing comments in the file:

    sudo apt install  $(grep -v ^# ubuntu20.list) -y

## 99. Future

What can we expect from Linux, where is it going in the next 5-10 years. Linux is now an established
operating system for nearly 30 years. Here are a few things going on and on the horizon:

* Replacing X11 with Wayland, a from the grounds up re-design.

* systemd and home directories.


## 99. References

* [What operating systems do astronomers use
  ](https://www.astrobetter.com/blog/2011/12/20/os-apt-astronomers/) - 2011

* [What Operating Systems Do AstroBetter Readers Use?
  ](https://www.astrobetter.com/blog/2011/12/28/astrobetter-operating-systems) - 2011

* [Guide to astrophysical software
  ](https://astroph.wordpress.com/glossaries/guide-to-astrophysical-software/) - 2011

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

I wish to thank Marc Pound and Ole Streicher for suggestions and checking their own
Ubuntu and Debian systems, and making sure I wasn't lying too much
since I stuck to Kubuntu. This draft is the precursor to the Astrobetter Wiki
version on setting up your (Ubuntu) Linux.

If you read this elsewhere, a version of this document is also maintained on
https://github.com/teuben/teunix/blob/master/docs/astronomy-on-ubuntu.md


# -- old stuff to be organized --


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

See a fix in LMTOY/etc/policy.xml 

The big things:

Compilers (but also python, R, julia etc.)   [idl -> gdl]
Useful tools that exist as binary
Latex/Bibtex
Gimp, xfig, dia, ...
Grip (to preview your MD files)
    grip will download a lot of python3 stuff
    okular works well enough
LibreOffice (and competitors now around too; see earlier list)
Pdf tools:   mostly, how do I edit a PDF, my university/NSF often asks this
  (acroread is pretty useless, libreoffice does open PDF files)
  xournal
  PDFtk   <-   pdftk-java
Also useful to combine many PDFs into a single PDF.

Does font substitution solve some of the importing of slides from PPT(x) to LibreOffice?

    sudo apt install ttf-mscorefonts-installer
    
but still i don't the all import calibri

    mkdir ~/.fonts
    wget -qO- http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer | bash

See also http://www.pcworld.com/article/2863497/how-to-install-microsoft-fonts-in-linux-office-suites.html


ADS, arXiv, ORCID id, https://www.astrobetter.com/blog/2018/05/28/welcome-to-the-new-ads/

My CV tools?
