# some notes on GlobalProtect (GP)

GlobalProtect (GP) has been unreliable on linux, to say the least.
These April 2025 notes are also meant to collect notes to write tickets for
our DIT, who often don't understand our linux needs.

Their most recent version, GlobalProtect_UI_deb-6.2.1.1-276.deb,
seems to do better. 

One GP is on your system, it seems to leave information on the system
making problems difficult to understand. One eample is my U20 laptop,
where nothing works. And an U22 box where it claims the certificate
is not valid (like, which certificate).

The first time you launch GP, it may wind up launching their own
PanGUI, which is like a mini-browser and can't store passwords like
your browser can do.  But it seems after that it's generally going
to launch the app via Firefox on my machine, despite that I've told
it that Chrome is my default browser, and my default app to open html
files (these are two different settings)

In the Systems Settings app
   - default applications
   - file associations for text/html



## Mouse follows focus
I use Kubuntu with "mouse follow focus" which adds some challenges
controlling the app, but I think I've learned to work around it.

If you have "mouse follows focus" this has the annoying side effect that
the GP app will disapper as you move out of the window , accidental or not,
to do something else



## Notes:

- lower right on panel can have several
- PanGPS needs to run, but often many other Pan apps are running, TBD
  (at my TaskManager several annoying "Welcome to GlobalProtec" are
  present

