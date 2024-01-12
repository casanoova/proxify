#!/bin/bash

log() {
  echo "$(date) - $1"
}

log "Removing dpkg locks..."
sudo rm /var/lib/dpkg/lock-frontend 2>&1 | log
sudo rm /var/lib/dpkg/lock 2>&1 | log

log "Downloading squid3 installation script..."
wget https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/squid3-install.sh -O squid3-install.sh 2>&1 | log

log "Running squid3 installation script..."
sudo bash squid3-install.sh 2>&1 | log

log "Creating htpasswd file..."
sudo /usr/bin/htpasswd -b -c /etc/squid/passwd proxify fcJJT2TrTnkvUZvF 2>&1 | log

echo "Script execution completed."
