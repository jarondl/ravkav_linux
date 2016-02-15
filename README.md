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
