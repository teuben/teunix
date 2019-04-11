source ~/.tcshrc

if ($?prompt) then
  if ("$tty" == "console" || "$tty" == "tty1") then
    printf "Start graphical X session? [y] "; set ok=$<:q
    if ("$ok" == "" || "$ok" == "y" || "$ok" == "Y") then
      ssh-agent startx -- -auth >& ~/.xerrors
    endif
  endif
endif
