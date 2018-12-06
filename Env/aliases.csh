# common aliases accross all my machines

alias teunix '(cd ~/teunix; git pull)'

alias Env 'echo Env version=`cat ~/Env/VERSION`'
setenv Env '$HOME/Env'
alias up  'cd ..'
alias up2 'cd ../..'
alias up3 'cd ../../..'
alias up4 'cd ../../../..'
alias up5 'cd ../../../../..'
alias up6 'cd ../../../../../..'
alias up7 'cd ../../../../../../..'
alias up8 'cd ../../../../../../../..'
alias dir ls -sF
alias sdir "ls -sF | sort -rn | head"
alias dus  "du | sort -nr | head"
#alias dus 'du -s *|sort -n'
alias d dir -l
alias l ls -sFtl
alias dth "d -t | head"
alias dth10 "d -t | head \!* | tail"
alias dtr "d -t | head"
alias adddir "source ~/bin/addmydir"
alias adir ar tv
alias cdir 'cpio -itvc <'
#alias tar 'gtar'
alias tdir tar tvf
alias untar tar xvf
alias detar tar xvf
alias mktar 'tar cvf \!*.tar \!*'
alias mkzip 'zip -r \!*.zip \!*'
alias zdir zoo -list
alias mkcd 'mkdir -p \!*; cd \!*'
alias cdp 'source ~/rc/\!*.rc'
alias rc  'source ~/rc/\!*.rc'
#
alias	go	'cd  $path_\!*'
alias	mark	'set path_\!* = $cwd'
alias	marks	'set | grep ^path_ | sed "s/^path_/	/"'
alias	unmark	'unset path_\!*'
#
#
alias ren mv -i
alias copy cp -i
alias del rm -i
alias era rm -i
alias zap rm -rf
#
alias print  'genscript'
alias print2 'genscript -r2'
alias print1 'genscript -r1 -fCourier7'
alias printo 'genscript -B  -fHelvetica15'
#
alias p printenv
alias h history
alias htail "history | tail"
alias hgrep "history | grep"
alias ahgrep "grep -i \!* .history.*"
alias agrep "alias | grep"
alias ecg 'grep -i \!* ~/.ec/emacsclient.log'
alias mailrc 'grep -i \!* ~/.mailrc'
alias phone 'grep -i \!* ~/.phone /local/pub/phone'
alias email 'grep -i \!* ~/.addressbook ~/.mailaliases'
alias addphone 'echo \!* >> ~/.phone'
alias comment 'echo \!* > /dev/null'
alias dgrep "grep \!* ~/.du/du.*"
alias gv  ghostview
alias gvl ghostview -landscape
alias cvsq 'cvs -n -q update'
alias cvsi 'cvs commit'
alias svnq 'svn status --show-updates'
alias em   'emacs -nw'

# python
alias i  ipython
alias j  'jupyter notebook'

alias m  'more'
alias o  'open'

# astromake

#if (-d /astromake) then
#  source /astromake/astromake_start
#  #astroload miriad nemo ds9 funtools
#endif

alias spell      'set j=`echo /tmp/spell.XXXXXX`; rm -f ${j}* >& /dev/null; echo \!:1 >${j}; ispell ${j}; cat ${j}; rm -f ${j}*; unset j'
alias df         'df -k'
alias hisfind    'find . -name .history.\[0-9\]\* -print'
alias hisdel     "find . -name .history.\[0-9\]\* -print -exec rm '{}' \;"
alias hisgrep    "find . -name .history.\[0-9\]\* -print -exec grep \!* '{}' \;"
alias x16        "startx -- -bpp 16"
alias x8         "startx -- -bpp 8"
#alias miriad     'astroload -v 3.2.2 gcc;astroload -v cvs miriad; unalias miriad; wheader MIR4'
alias miriad      'astroload -v miriad_dev miriad; unalias miriad; wheader MIR4dev; setenv MIRDEBUG 1'
alias miriad4     'astroload -v cvs miriad; unalias miriad; wheader MIR4'
alias miriad3     'astroload -v MIR3 miriad; unalias miriad; wheader MIR3'
alias wasp2      'cd ~/cvs/wasp2; setenv WASPDATA .; source wasp_start'
#alias aips++	 'source ~/.aips++; echo AIPS++ version `avers` loaded'
alias aips++	 'astroload gcc pgplot aips++; unalias aips++; addpath ~/aips++/$AIPSARCH:t/bin'
alias wasp	 "echo Loading wasp2; source /home/wasp2/WASPRC; unalias wasp"
alias aphid	 "echo Loading aphid; source /home/teuben/aphid/WASPRC; unalias aphid"
alias comb	 "echo Loading comb; source /data/teuben/combrc; unalias comb"
#alias newmiriad  'source /usr/local/miriad/\!*/MIRRC.linux'
alias wcd        "wcd.exe  \!*  ; source $HOME/bin/wcd.go"
alias root	 "xhost +localhost; su -"
#alias locate     slocate

# astro
alias psg          'ps -aux | egrep -i "(\!*|PID)" | grep -v grep'

alias newpine 'killproc pine; pine'
alias newmutt 'killproc mutt; killall mutt; mutt'

alias hisfind 'find . -name .history.\* -print'
alias hisdel  "find . -name .history.\* -print -exec rm '{}' \;"
alias bop     "ssh -l teuben perseus.astro.umd.edu"

alias bigfiles  'zmore /tmp/$USER/big.log.gz | sort -nr | head'

alias fingerlog  cat /var/log/fingerlog
alias wwwlog     cat /home/www/logs/access_log

# wheader

if ($?term == 1) then
 if ($term == "sun") then
  alias wheader 'echo -n "]l\!*\";echo -n "]L\!*\"'
 else if ($term == "xterm" || $term == "xterm-256color") then
  alias titlelabel 'echo -n "]2;\!*"'
  alias iconlabel 'echo -n "]1;\!*"'
  alias wheader 'titlelabel \!*; iconlabel \!*'
 else
   alias wheader 'echo No wheader: \!*'
 endif
endif



# gipsy

#alias gipsy 'setenv gip_root /data/teuben/gipsy/nov2000; echo Loading gipsy; source $gip_root/sys/gipenv.csh'

# aips15


alias aips15 'source /home/aips15/aipsinit.csh; echo Loading AIPS++ V1.5; avers; unalias aips++'
alias new_aips 'source /home/aips2/aipsinit.csh; echo Loading new AIPS++; avers; unalias aips++'


# make this the default cvs
if (-e ~/cvs/cvsrc) source ~/cvs/cvsrc

# new starlab w/ configure
#alias starlab 'source /home/teuben/cvs/starlab_gcc3/starlab_start; astroload -v 3.1.1 gcc; cd $STARLAB_PATH'
#alias starlab 'source /dos/teuben/starlab/starlab_start; astroload -v 3.2.1 gcc; cd $STARLAB_PATH'
alias starlab 'source /home/teuben/cvs/manybody/starlab/starlab_start'
# nemo
alias nemo 'astroload nemo; unalias nemo'

alias addld 'setenv LD_LIBRARY_PATH \!*:$LD_LIBRARY_PATH'

#alias gipsy 'astroload gipsy; setenv


#alias intel 'source /opt/intel/compiler50/ia32/bin/ifcvars.csh'
alias pgi   'astroload -v pgi2 time; source ~/.pgirc'
alias kbd 'kbdrate -r 30'
#alias carma 'source /home/teuben/cvs/carma/carma_start.csh; unalias carma'
#alias carma 'source /home/teuben/cvs/carma_merged/carma_start.csh; unalias carma'
alias carma 'source /home/teuben/carma/cvs/carma_pjt; unalias carma; cd $CARMA'
alias carma_build 'source /home/teuben/carma/cvs/carma_pjt; unalias carma; cd $CARMA_BUILD'
alias pdf acroread
alias idl 'source ~/.idlrc; unalias idl; echo IDL now loaded with odd time'
alias idl56 'source ~/.idlrc56; unalias idl; echo IDL now loaded with odd time'
alias xmovie 'source ~/movies/lib/source_me; unalias xmovie'
alias genv 'unalias genv; source /home/teuben/sirtf/genv/genv.rc'


# always point home....
setenv CVSROOT   :pserver:pteuben@cvs.astro.umd.edu:/home/cvsroot
setenv CVSEDITOR mem
setenv CVS_RSH   ssh
alias  cvsq      'cvs -n -q update'
alias  cvsi      'cvs commit'

#  on Sebok's system?
if ($?TMPDIR) unsetenv TMPDIR
if ($?TMP) unsetenv TMP


alias em 'emacs -nw'


if ( -e    ~/.local.aliases.csh ) then
   source  ~/.local.aliases.csh
endif

