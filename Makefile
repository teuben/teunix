#


TEUNIX = `pwd`

SHELLS = csh tcsh bash zsh

# kubuntu (22) packages we really need to bootstrap teunix
UP = git emacs tcsh wget curl unzip openssh-server \
     build-essential gfortran cmake pgplot5 xorg-dev libncurses-dev \
     meld tkcvs htop gitg gitk git-cvs \
     wget unzip curl exfat-fuse tkcvs net-tools ncftp autoconf

UP2 = plasma-widgets-addons kio-gdrive


URL1 = https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git
URL2 = https://github.com/torvalds/uemacs
URL3 = https://github.com/astroumd/sysadmin
URL4 = https://github.com/teuben/nemo


## help:       This Help
help : Makefile
	@sed -n 's/^##//p' $<

install:
	@echo Some typical install notes
	@echo teunix=$(TEUNIX)

## apt:        1.  My personal list of generic ubuntu packages I need
apt:
	sudo apt install $(UP) -y
	@echo If you have KDE, also "make apt2"

## apt2:       1k. My kubuntu addons (on regular ubuntu this would cause an avalanche)
apt2:
	sudo apt install $(UP2) -y


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
	(cd uemacs; make)
	cp -a uemacs/em ~/bin/

## rc:         3. bootstrap the rc files
rc:  $(HOME)/rc
	@echo Now in rc:
	@(cd ~/rc; ls *.rc)

$(HOME)/rc:
	@if [ ! -d ~/rc ]; then mkdir ~/rc; fi
	@touch ~/rc/none.rc

# See various comments in Env/README

## env:        4. Various environment patches
##                env1:  aliases.sh for .bashrc
##                env2:  .emacs
##                env3:  .git
##                env4:  ~/bin to PATH
##                env5:  .ssh/config
env:   env0 env1 env2 env3 env4 env5 env9 rc

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
