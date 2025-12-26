# teunix

This is my home away from home!

This is a collection of scripts to get my environment set up on a new
Unix account. For the shell I keep both -csh an -sh flavors, although I've
mostly switched to bash. I cover both Linux and Darwin flavors of Unix.
I used to be fluent in Solaris and a few others, but that's long gone.
Linux rules the world!

I also keep writeups of installation specifics on a variety of Linux/Darwin
flavors. My linux history goes back to Slackware floppies (1994), then
Redhat and Fedora, but eventually Ubuntu with their Unity window manager.
In 2018 Ubuntu switched to GNOME3, but I decided to switch to KDE,
since I cannot get used to GNOME3. 

This repo is purely put together for my own sanity, just because there
are so many little things to do to get started on a new system.
You may find interesting and useful scripts and aliases in here. If you google
around you will find hundreds and hundreds of sites that have nice
ways to maintain your dotfiles. It's crazy!

If you need help with your version of Unix, or with Photography, or
Badminton tournaments, I could be persuaded, for a small fee of
course.

## tools

My current favorite tools are:

* editor: ec (my logging emacsclient script), mem (micro-emacs) and in pure desparation vim or nano
* shell:  bash
* window manager: KDE/Plasma
* linux distro: Kubuntu
* python: anaconda3 (and some spyder and JupyterLab Desktop)
* git: mostly via github.com, but also 'gh' and Github Desktop
* ...

## Typical install

Since I do this so often, this is a typical Ubuntu install:

```
  sudo apt install git make
  git clone https://github.com/teuben/teunix
  cd teunix
  make dpkg apt apt2 apt3 apt4
  make rc env mem
  source ~/.bashrc
```

and just for me: my home setup

```
  make nemo
  make hosts diary pjteunix
```  
  
..
