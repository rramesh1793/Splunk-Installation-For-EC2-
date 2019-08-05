#!/bin/sh
# wget output file
FILE="wget -O splunk-7.2.6-c0bf0f679ce9-Linux-x86_64.tgz https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.6&product=splunk&filename=splunk-7.2.6-c0bf0f679ce9-Linux-x86_64.tgz&wget=true"
INSTALL_FILE="splunk-7.2.6-c0bf0f679ce9-Linux-x86_64.tgz"
sudo adduser splunk
sudo passwd -d splunk
SPLUNK_USER="splunk"
PASSWORD="Splunk123"
cd /opt
sudo wget $FILE
sudo tar -xvzf $INSTALL_FILE
sudo chown -R $SPLUNK_USER:$SPLUNK_USER /opt/splunk
sudo -u $SPLUNK_USER /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd Splunk123
sudo -u $SPLUNK_USER /opt/splunk/bin/splunk restart
sudo /opt/splunk/bin/splunk enable boot-start -user $SPLUNK_USER
echo "***********sleep for 30 secs*****************"
sleep 30
# ulimit changes on limitsconf file
cd /etc/security/
sudo sed -i.bak '/#<domain>/a *               hard    nofile  20000' limits.conf
sudo sed -i '/#<domain>/a *               soft    nofile  20000' limits.conf
sudo -u $SPLUNK_USER
ulimit -d 1073741824
ulimit -m 536870912
ulimit -n 8192
