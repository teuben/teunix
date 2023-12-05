#


TEUNIX = `pwd`

SHELLS = csh tcsh bash zsh

# kubuntu (22) packages we really need to bootstrap teunix
UP = git emacs tcsh wget curl unzip openssh-server \
     build-essential gfortran cmake pgplot5 xorg-dev libncurses-dev \
     meld tkcvs htop gitg gitk git-cvs \
     wget unzip curl exfat-fuse tkcvs net-tools ncftp autoconf \
	python-is-python3

UP2 = plasma-widgets-addons kio-gdrive

# fedora packages
FP = make gcc gcc-gfortran gcc-g++ tcsh ncurses-devel libtirpc-devel libXext-devel
FP2 = pgplot pgplot-devel 


URL1 = https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git
URL2 = https://github.com/torvalds/uemacs
URL3 = https://github.com/astroumd/sysadmin
URL4 = https://github.com/teuben/nemo


## help:       This Help for given HOST
help : Makefile
	@echo "HOST: `hostname`"
	@sed -n 's/^##//p' $<

install:
	@echo Some typical install notes
	@echo teunix=$(TEUNIX)

## dpkg:       0. make a listing of the after installed packages
dpkg: dpkg0.list

## apt:        1a.  My personal list of generic ubuntu packages I need
apt:
	sudo apt install $(UP) -y
	@echo If you have KDE, also "make apt2"

## apt2:       1b. My kubuntu addons (on regular ubuntu this would cause an avalanche)
apt2:
	sudo apt install $(UP2) -y

## apt3:       1c. DIY list of URLs to download from
apt3:
	@echo 'This is a DIY list:'
	@echo 'ZOOM:    https://zoom.us/download?os=linux'

## dnf0:       bootstrap RPMFUSION (takes a while)
dnf0:
	sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$$(rpm -E %fedora).noarch.rpm
	sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$$(rpm -E %fedora).noarch.rpm
	sudo dnf upgrade --refresh
	sudo dnf groupupdate core

## dnf:       basic packages
dnf:
	sudo dnf install $(FP) -y

## dnf1:      additional packages
dnf1:
	sudo dnf install $(FP1) -y

all: $(SHELLS)

csh:
	@test -f $(HOME)/.cshrc && echo You have a csh

tcsh:
	@test -f $(HOME)/.tcshrc && echo You have a tcsh

bash:
	@test -f $(HOME)/.bashrc && echo You have a bashrc
	@test -f $(HOME)/.bash_login && echo You have a bash_login

zsh:
	@if test -f $(HOME)/.zshrc; then\
	    echo You have a zshrc;\
	    echo 'test -f ~/teunix/Env/aliases.sh  && source ~/teunix/Env/aliases.sh' ;\
	fi

foo:
	@test -f $(HOME)/.foo && echo You have a 


## uemacs:     2. micro-emacs quick source install
uemacs:
	git clone $(URL2)
	@echo "Needs package libncurses-dev on Ubuntu"
	@echo "              ncurses-devel on Fedora"
	@echo 'cd uemacs; make'

## mem:        2. install micro-emacs at ~/bin/mem
mem:	uemacs ~/bin
	(cd uemacs; make clean; make)
	cp -a uemacs/em ~/bin/mem

## rc:         3. bootstrap the rc files
rc:  $(HOME)/rc
	@echo Now in rc:
	@(cd ~/rc; ls *.rc)

$(HOME)/rc:
	@if [ ! -d ~/rc ]; then mkdir ~/rc; fi
	@touch ~/rc/none.rc

# See various comments in Env/README

## env:        4. Various environment patches
##                env0:  make apt-cache0.list a dpkg0.list
##                env1:  aliases.sh for .bashrc
##                env2:  .emacs
##                env3:  .git
##                env4:  ~/bin to PATH
##                env5:  .ssh/config
##
env:   env0 env1 env2 env3 env4 env5 env6 env9 rc

env0: apt-cache0.list apt-cache1.list dpkg0.list

env1:
	-@echo '[ -e  ~/teunix/Env/aliases.sh ] && source ~/teunix/Env/aliases.sh' >> ~/.bashrc

env2:
	-@[ ! -e  ~/.emacs ] && ln -s ~/teunix/Env/dotemacs ~/.emacs

env3:
	-@[ ! -e ~/.gitconfig ] &&  ln -s ~/teunix/Env/dotgitconfig ~/.gitconfig

env4:
	-@[ ! -d ~/bin ] &&  ln -s ~/teunix/Env/bin ~/bin

env5:
	-@mkdir -p ~/.ssh
	ln -s ~/teunix/Env/ssh/config ~/.ssh/config

env6:
	-@mkdir -p ~/.ipython/profile_default/startup
	ln -s ~/teunix/Env/python/90-numpy.py ~/.ipython/profile_default/startup

env9:
	@echo Do the /etc/hosts manually

## nemo:       8. simple NEMO bootstrap install
nemo:
	git clone $(URL4)
	(cd nemo; ./configure; make build check bench5)

apt-cache0.list:
	apt-cache search  .  > apt-cache0.list

apt-cache1.list:
	apt-cache pkgnames   > apt-cache1.list

dpkg0.list:
	dpkg --list          > dpkg0.list


## sysadmin:   9. some private repo sysadmin stuff
sysadmin:
	git clone $(URL3)

## hosts:     10. update your local /etc/hosts file (need root permission)
hosts:
	(cd Env; sed -n '/HOSTSLOCAL/q;p' /etc/hosts > hosts; cat hosts.local >> hosts; sudo cp hosts /etc)

## pjt:       11. My super short reminder for my KDE desktop setup
pjt:
	cat README.pjt

## diary:     12. My diary/yraid
diary:
	mkdir -p ~/Diary
	(cd ~/Diary; git clone https://github.com/teuben/yraid)

