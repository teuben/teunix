#




SHELLS = csh tcsh bash zsh

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
