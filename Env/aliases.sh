# for bash and zsh
#
# echo 'test -f ~/teunix/Env/aliases.sh  && source ~/teunix/Env/aliases.sh' >> ~/.bashrc
# echo 'test -f ~/teunix/Env/aliases.sh  && source ~/teunix/Env/aliases.sh' >> ~/.zshrc

#  bash only
shopt -s direxpand

alias teunix='(cd ~/teunix; git pull)'

alias   up='cd ..'
alias  up2='cd ../..'
alias  up3='cd ../../..'
alias  up4='cd ../../../..'
alias  up5='cd ../../../../..'
alias  up6='cd ../../../../../..'
alias  up7='cd ../../../../../../..'
alias  up8='cd ../../../../../../../..'
alias  cdd='cd ~/Downloads'
alias  cdp='cd ~/Pictures'
alias  dir='ls -sF'
alias sdir="ls -sF |sort -nr | head"
alias  dus="du     |sort -nr | head"
alias  dut="du -s *|sort -nr | head"
alias    d='dir -l'
alias    l='ls -sFtl'
alias  dth="d -t | head"
#alias dth10="d -t | head \!* | tail"
alias  dtr="d -t | head"
#FIX alias adddir "source ~/bin/addmydir"
alias adir='ar tv'
alias cdir='cpio -itvc <'
#alias tar 'gtar'
alias  tdir='tar tvf'
alias untar='tar xvf'
alias detar='tar xvf'
# nemoinp is a NEMO command line calculator
alias    ni='nemoinp'

push() {
    git commit -m upd $1
    git push
}

mt() {
    ls -l $1; more $1
}

mktar() {
    tar cvf $1.tar $1
}
mkzip() {
    zip -r $1.zip $1
}
alias zdir='zoo -list'
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
mkcd() {
    mkdir -p $1
    cd $1
}
use() {
    if [ ! -f ~/.use ]; then
	return
    fi
    for f in $(cat ~/.use); do
	if [ ! $2 ]; then
	    grep -i $1 $f
	else
	    grep -i $1 $f | grep -i $2
	fi
    done
}

#
#alias	go	'cd  $path_\!*'
#alias	mark	'set path_\!* = $cwd'
#alias	marks	'set | grep ^path_ | sed "s/^path_/	/"'
#alias	unmark	'unset path_\!*'
#
#
alias  ren='mv -i'
alias copy='cp -i'
alias  del='rm -i'
alias  era='rm -i'
alias  zap='rm -rf'
#

# alias  print='enscript'      # this causes zsh to complain
alias print2='enscript -r2'
alias print1='enscript -r1 -fCourier7'
alias printo='enscript -B  -fHelvetica15'

#
alias p=printenv
alias h=history
alias htail="history | tail"
alias hgrep="history | grep"
alias agrep="alias | grep"
ahgrep() {
    grep -i $1 .history.*
}
ecg() {
    grep -i $1 ~/.ec/emacsclient.log
}
phone() {
    grep -i $1 ~/.phone /local/pub/phone
}
#FIX alias email 'grep -i \!* ~/.addressbook ~/.mailaliases'
#alias addphone='echo \!* >> ~/.phone'
#alias comment='echo \!* > /dev/null'
#alias dgrep="grep \!* ~/.du/du.*"
#alias gv  ghostview
#alias gvl ghostview -landscape
alias svnq='svn status --show-updates'
alias   em='emacs -nw'

# python
alias    i='ipython3'
alias    j='jupyter notebook'

alias    m='more'
alias    o='open'

#### stuff removed here

# tmux (screen doesn't support -CC)
function tsh  { ssh -X $1 -t "tmux -CC attach -t $2 || tmux -CC new -s $2"; }

# always point home....
#export   CVSROOT=:pserver:pteuben@cvs.astro.umd.edu:/home/cvsroot
export    CVSROOT=:ext:teuben@cvs.astro.umd.edu:/home/cvsroot
export  CVSEDITOR=mem
export    CVS_RSH=ssh
alias        cvsq='cvs -n -q update'
alias        cvsi='cvs commit'

#  on Sebok's system?
#if ($?TMPDIR) unsetenv TMPDIR
#if ($?TMP) unsetenv TMP

export PATH=~/bin:~/teunix/Env/bin:$PATH
if [ -d $HOME/.cargo/bin ]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

for d in /astromake ~/astromake ; do
    if [ -f $d/astromake_start.sh ]; then
	# echo ASTROMAKE: $d
	. $d/astromake_start.sh
    fi
done

if [ -f ~/.local.aliases.sh ]; then
    . ~/.local.aliases.sh
fi


#

HISTTIMEFORMAT="%F %T "
