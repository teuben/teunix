
# common aliases accross all my machines

alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'
alias up7='cd ../../../../../../..'
alias up8='cd ../../../../../../../..'
alias dir='ls -sF'
alias sdir="ls -sF | sort -rn | head"
alias dus="du | sort -nr | head"
#alias dus 'du -s *|sort -n'
alias d='dir -l'
alias l='ls -sFtl'
alias dth="d -t | head"
alias dth10="d -t | head \!* | tail"
alias dtr="d -t | head"
#FIX alias adddir "source ~/bin/addmydir"
alias adir='ar tv'
alias cdir='cpio -itvc <'
#alias tar 'gtar'
alias tdir='tar tvf'
alias untar='tar xvf'
alias detar='tar xvf'
alias mktar='tar cvf \!*.tar \!*'
alias mkzip='zip -r \!*.zip \!*'
alias zdir='zoo -list'
alias mkcd='mkdir -p \!*; cd \!*'
#FIX alias cdp='source ~/rc/\!*.rc'
#FIX alias rc= 'source ~/rc/\!*.rc'
#
#alias	go	'cd  $path_\!*'
#alias	mark	'set path_\!* = $cwd'
#alias	marks	'set | grep ^path_ | sed "s/^path_/	/"'
#alias	unmark	'unset path_\!*'
#
#
alias ren='mv -i'
alias copy='cp -i'
alias del='rm -i'
alias era='rm -i'
#
alias print='enscript'
alias print2='enscript -r2'
alias print1='enscript -r1 -fCourier7'
alias printo='enscript -B  -fHelvetica15'
#
alias p=printenv
alias h=history
alias htail="history | tail"
alias hgrep="history | grep"
alias ahgrep="grep -i \!* .history.*"
alias agrep="alias | grep"
alias ecg='grep -i \!* ~/.ec/emacsclient.log'
#alias mailrc 'grep -i \!* ~/.mailrc'
alias phone='grep -i \!* ~/.phone /local/pub/phone'
#FIX alias email 'grep -i \!* ~/.addressbook ~/.mailaliases'
alias addphone='echo \!* >> ~/.phone'
alias comment='echo \!* > /dev/null'
alias dgrep="grep \!* ~/.du/du.*"
#alias gv  ghostview
#alias gvl ghostview -landscape
alias svnq='svn status --show-updates'
alias   em='emacs -nw'

#### stuff removed here


# always point home....
export    CVSROOT=:pserver:pteuben@cvs.astro.umd.edu:/home/cvsroot
export  CVSEDITOR=mem
export    CVS_RSH=ssh
alias        cvsq='cvs -n -q update'
alias        cvsi='cvs commit'

#  on Sebok's ssystem?
#if ($?TMPDIR) unsetenv TMPDIR
#if ($?TMP) unsetenv TMP


