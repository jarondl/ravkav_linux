RavKav Online for Linux (unofficial packaging effort)
=====================================================
**This is unofficial - not related in any way to the ravkavonline site,
or to pcentra.**

About
-----
ravkavoline is a service that allows you to charge up your RavKav (Israeli
public transport smartcard) from home, with the use of a smartcard reader.

While their solution is standard based (java, websockets, pcsc), for some
reason they only published windows and Mac OS executables.

For now this repo has the ArchLinux `PKGBUILD` to extarct the `JAR` file from
the mac installation zip and install it. Adapting to other distributions
should be easy, as is creating a 'GNU Make' based installation. Contributions
are welcome.

Installation
------------
Install the `PKGBUILD` as you would any other `PKGBUILD`.

Then, enable the pcscd socket:

    systemctl enable --now pcscd.socket

Insert the card to the card reader, and
go to https://www.ravkavonline.co.il/

Everything should work.

Ubuntu
------

####Installation
Make sure you have Java installed before.
Take the whole Ubuntu directory. Run **as a normal user**. Enter root password only when needed. Don't run the script as root (sudo) because then it will run wine as root which is not recommendend and can cause problems.
```
./installRavKav.sh
``` 
####Script Overview
Instead of using the 0.1.4 version from the MacOS zip file, this script takes the 0.1.8 version (and probably can be easily adapted to any one) which is about one year newer and the latest at the time of writing this readme (7/4/2016).
(For my card reader bought at Dan (Identive CLOUD 2700 R Smart Card Reader), only the new version works (also on Windows)).
Sadly, the company releases the newer versions only for Windows and not in zip format but as Advanced Installer setup.
In order to extract the setup, the script installs wine and runs the setup using the extract parameter. This is the only use of Wine and it's an overkill - pull requests are welcome.

HopOn
-----
The Dan company uses another site: https://hopon.co.il
This site checks the ravkavonline version (as of 7/4/2016, version 0.1.8) and will work only with one version.
Using the trick from the Ubuntu script, the required version can be installed for the Dan company.
This site has some checks for Windows.
To bypass the check:
* go to https://hopon.co.il
* after the site is up go to https://hopon.co.il/#/read

Now it should work and even Dan contracts can be bought.

Details
-------
 * The reason we need the desktop file, is to register a mimetype for
   the 'ravkav:' uri scheme. The ravkav website opens a websocket connection
   to the application by requesting a url of the form `ravkav:wss://proxy.ravkavonline.co.il/SOMEID`.

 * An alternative to this approach, would be to put the `.desktop` file in
   `$HOME/.local/share/applications/`, and to run `update-desktop-database ~/.local/share/applications`.
   This would register the mime for this user only, instead of using the global location.
   You can modify the `Exec` line, to run the `jar` instead of the shell script, and so
   with only two files (`.jar` and `.desktop`) aou can use RavKavOnline.
