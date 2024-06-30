# UMD specific downloads

These are my Linux debian style downloads. The top link is always a good entry point,
but you may have to drill down. The bottom link is an attempt to give a direct link
to the file, if applicable (e.g. Webex does not do this).


## Zoom

Version will frequently change, don't use the 2nd link (as seen May 2024)

https://zoom.us/download?os=linux

https://zoom.us/client/6.0.2.4680/zoom_amd64.deb

## Webex

https://www.webex.com/downloads.html

(manual) -> Webex.deb

## GlobalProtect

Version 6.1.1.0-49 (as seen May 2024)

https://terpware.umd.edu/Linux/Title/4010

https://terpware.umd.edu/Linux/Package/4670

https://terpware.umd.edu/api/file/4670/4202


## Fireeye (trellix)

Version 36.21.0 (as seen May 2024)

https://terpware.umd.edu/Linux/title/3959

https://terpware.umd.edu/api/file/4794


## Misc

* Mathematica
* IDL (coming soon!)    https://terpware.umd.edu/Linux/title/2807
* redhat 9.2
* 3270 emulator:  http://x3270.bgp.nu/   needed with VPN to connect to umdmvs.umd.edu

  For kicks here's an example compile from source for Linux

        wget http://x3270.bgp.nu/download/04.03/suite3270-4.3ga8-src.tgz
        tar zxf suite3270-4.3ga8-src.tgz
        cd
        ./configure --with-prefix=/tmp/x --disable-tcl3270
        make
        make install

   There is some issue left, it wanted access to /usr/share/icons/.... but --prefix should
   have not copied into system space. But the binary /tmp/x/bin/x3270 seems to work. Perhaps
   an autoconf bug.
