# Sierra (10.12.6)

I (grumpily) received my first Mac on Jan 29, 2018. It's called Sierra,
even though 10.13 is now available as High Sierra, but CASA, a common
application used in astronomy is not used, and even my best friends tell
me not to upgrade to the very latest too early in the game.

I have had a few earlier versions, but they've always been disappointing,
but since so many of my friends now have a Mac, they need some support.

## Issues

1. gfortran still not easy to install.  I use the HPC version for now.  http://hpc.sourceforge.net/
   but this means I don't get 

2. Homebrew and Macports ?

## Xcode

You will also need to have Apple's XCode Tools installed from the Mac
App Store. With XCode 4 or better you will need to download the
command-line tools as an additional step. You will find the option to
download the command-line tools in XCode's Preferences. On 10.9
Mavericks or higher, you can get the command-line tools by simply
typing **xcode-select --install**.

## homebrew

It's all on https://brew.sh/  but if you're in a hurry, run this in a terminal

     
     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


## MacPorts
