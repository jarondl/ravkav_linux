#!/bin/sh
sudo apt-get install pcscd wine
sudo cp ravkav "/usr/bin/ravkav"
sudo cp RavKavOnline.desktop "/usr/share/applications/RavKavOnline.desktop"
sudo update-desktop-database
wget https://ravkavonline.co.il/releases/win/ravkav-online-win-0.1.8.exe
wine ravkav-online-win-0.1.8.exe /extract:dummyRavKav
cabextract -F RavKavDesktopSDK.jar disk1.cab
sudo mkdir -p /usr/share/java/ravkav && sudo cp RavKavDesktopSDK.jar /usr/share/java/ravkav/RavKavOnline.jar
