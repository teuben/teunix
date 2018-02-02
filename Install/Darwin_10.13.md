# High Sierra (10.13.2)

Received brand new spanking MacBook Pro to try out. Has 2 USB-C on the left and right.

## Install

Here's stuff I did:

1. Fix the mouse scrolling to be not natural but "normal":
   sys pref -> trackpad -> scroll & zoom -> tick off the natural (first checkmark)

2. google chrome

3. libre office

4. Xcode V9.2

5. install_PandExo (a miniconda2)

6. install Homebrew (not Macports... yet)
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

   a. brew install cvs cmake tkdiff gcc
   b. brew install gcc    [also does gfortran]

7. CASA - now the pre-release is available for high sierra

administrative things are in **/usr/local/Homebrew**, 
and you will find it's executables in /usr/local/bin, etc.etc. So no need to update your **$PATH**.

