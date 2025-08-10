#!/bin/bash
#   for KDE:   place this file in ~/.config/autostart-scripts/ and logout/in again
#              it will morph into ~/.config/autostart/ssh-add-keys.sh.desktop

SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS
ssh-add ~/.ssh/id_ed25519    # your private key path


# place in:  ~/.bash_profile or ~/.bash_login or ~/.profile
#export SSH_ASKPASS="/usr/bin/ksshaskpass"
#export SSH_ASKPASS_REQUIRE=prefer
