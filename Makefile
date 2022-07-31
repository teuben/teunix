#


TEUNIX = `pwd`

SHELLS = csh tcsh bash zsh

# Ubuntu (22) packages we absolute need to bootstrap teunix
UP = git emacs tcsh wget curl unzip openssh-server \
     build-essential gfortran cmake pgplot5 xorg-dev libncurses-dev \
     meld tkcvs htop gitg gitk git-cvs \
     wget unzip curl exfat-fuse tkcvs net-tools ncftp autoconf \
     plasma-widgets-addons kio-gdrive


URL1 = https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git
URL2 = https://github.com/torvalds/uemacs
URL3 = https://github.com/astroumd/sysadmin




help:
	@echo teunix=$(TEUNIX)

apt:
	sudo apt install $(UP) -y

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


uemacs:
	git clone $(URL2)
	@echo "Needs package libncurses-dev on Ubuntu"
	@echo "              ncurses-devel on Fedora"
	@echo 'cd uemacs; make'


rc:  ~/rc
	@if [ ! -d ~/rc ]; then mkdir ~/rc; fi
	@echo Now in rc:
	@ls ~/rc

# See various comments in Env/README

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
	-@[ ! -d ~/.ssh ] &&  ln -s ~/teunix/Env/ssh/config ~/.ssh/config

env9:
	@echo Do the /etc/hosts manually



apt-cache0.list:
	apt-cache search  .  > apt-cache0.list

apt-cache1.list:
	apt-cache pkgnames   > apt-cache1.list

dpkg0.list:
	dpkg --list          > dpkg0.list

sysadmin:
	git clone $(URL3)
