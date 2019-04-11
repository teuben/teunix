#!/bin/sh
#
# Replace startkde with gnome-session to start GNOME instead of a KDE session.
#
exec dbus-launch --exit-with-session startkde
