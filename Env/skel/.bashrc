# System setup.
test -f /etc/bashrc && source /etc/bashrc

# Non-interactive environment.
export EDITOR="vim"
unset  ENV
unset  MAILCHECK
export MANPATH="/local/share/man:/usr/share/man"
export PAGER="less"
export PATH="$HOME/bin:/local/bin:/usr/bin:/bin:/local/sbin:/usr/sbin:/sbin:."
#
export LESS=-iFMRX
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;35m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
#
umask 027
ulimit -c 0
[[ "$DISPLAY" && ! "$XAUTHORITY" ]] && export XAUTHORITY=$HOME/.Xauthority

# Interactive environment.
if [[ $- =~ i ]]; then
  HISTSIZE=256
  PS1='\W \h) '
  TTY=$(tty) && TTY=${TTY#/dev/}

  case "$TERM" in
    "" | dumb | unknown ) export TERM=ansi ;;
    xterm* )
        PS1='\h) '
        PROMPT_COMMAND='echo -en "\e]0;${XTITLE-${HOSTNAME%%.*}[$TTY]:$PWD}\a"'
        ;;
  esac

  ec="^$(stty -a | grep -qF 'erase = ^?' && echo '?' || echo 'h')"
  stty intr '^c' susp '^z' eof '^d' erase "$ec" kill '^u'
  unset ec
fi

# Aliases and local customizations.
for rc in .bash_alias .bash_local; do test -f ~/$rc && source ~/$rc; done
unset rc
