# Sierra (10.12.6)

I (grumpily) received my first Mac on Jan 29, 2018. It's running
Sierra, even though 10.13 is now available as High Sierra. But CASA, a
common application used in astronomy, is not available, and even my
best friends tell me not to upgrade to the very latest too early in
the game. So Sierra is a safe bet.

I have had a few earlier versions of Darwin (MacOSX), but they've
always been disappointing.  But so many of my best friends now have a
Mac, they need some support. I can't escape reality anymore,

## Issues

1. gfortran still not easy to install.  I use the HPC version for now.  http://hpc.sourceforge.net/
   Will need to get back to this.

2. Homebrew and/or Macports ?
   It is said that running both brew and port at the same time can be very dangerous.

3. No gui emacs, no more cvs, but git now comes with Darwin.


## Xcode

You will also need to have Apple's XCode Tools installed from the Mac
App Store. With XCode 4 or better you will need to download the
command-line tools as an additional step. You will find the option to
download the command-line tools in XCode's Preferences. On 10.9
Mavericks or higher, you can get the command-line tools by simply
typing **xcode-select --install**.

I was quite shocked that, although it's free, I still needed to give
Apple my credit card credentials in order to download it.

### XQuarz

TBD if we still need https://www.xquartz.org/




## homebrew

It's all on https://brew.sh/  but if you're in a hurry, run this in a terminal

     
     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Homebrew will use the **/usr/local** tree,
administrative things are in **/usr/local/Homebrew**, 
and you will find it's executables in /usr/local/bin, etc.etc. So no need to update your **$PATH**.

### Packages to install

Here is my favorite list

     brew install cvs cmake tkdiff wget

## MacPorts

   No experience yet, since I'm running just brew for now.  See also my 10.13 comments.

## Other usefule programs

* skype
=======
* CASA: they use MacPorts: https://safe.nrao.edu/wiki/bin/view/Software/CASA/CasaEnvSetupOSX1012

* GILDAS: https://www.iram.fr/IRAMFR/GILDAS/gildasli2.htmla


## Links

Asking google "how to set up a mac for development" will give a large amount
of solutions. My own solution is a hybrid of some of these, but here is the
list from 2018, some of which may still exist or be useful when you read this:

* https://github.com/nicolashery/mac-dev-setup
* http://sourabhbajaj.com/mac-setup/
* http://www.stuartellis.name/articles/mac-setup/
* https://github.com/mathiasbynens/dotfiles
* https://github.com/donnemartin/dev-setup
* https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/
* https://github.com/nicolashery/mac-dev-setup


And some other

*  https://superuser.com/questions/181337/is-it-safe-to-install-both-homebrew-and-macports-on-the-same-machine
