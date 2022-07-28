#


TEUNIX = `pwd`

SHELLS = csh tcsh bash zsh

# Ubuntu (22) packages we absolute need to bootstrap teunix
UP = git emacs tcsh wget curl unzip openssh-server \
     build-essential gfortran cmake pgplot5 xorg-dev libncurses-dev \
     meld tkcvs htop gitg gitk git-cvs \
     wget unzip curl exfat-fuse tkcvs net-tools ncftp autoconf \
     plasma-widgets-addons kio-gdrive

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


URL1 = https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git
URL2 = https://github.com/torvalds/uemacs


uemacs:
	git clone $(URL2)
	@echo Needs package libncurses-dev on Ubuntu
	@echo 'cd uemacs; make'


rc:  ~/rc
	@if [ ! -d ~/rc ]; then mkdir ~/rc; fi
	@echo Now in rc:
	@ls ~/rc

# See various comments in Env/README

env:   env1 env2 env3 env4 env5 env6 rc

env1:
	-@echo '[ -e  ~/teunix/Env/aliases.sh ] && source ~/teunix/Env/aliases.sh' >> ~/.bashrc

env2:
	-@[ ! -e  ~/.emacs ] && ln -s ~/teunix/Env/dotemacs ~/.emacs

env3:
	-@[ ! -e ~/.gitconfig ] &&  ln -s ~/teunix/Env/dotgitconfig ~/.gitconfig

env4:
	-@[ ! -d ~/bin ] &&  ln -s ~/teunix/Env/bin ~/bin

env5:
	-@[ ! -d ~/.ssh ] &&  ln -s ~/teunix/Env/ssh/config ~/.ssh/config

env6:
	@echo Do the /etc/hosts manually

