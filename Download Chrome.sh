#!/bin/bash

apt update

apt install -y wget

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

dpkg -i google-chrome-stable_current_amd64.deb

apt install -y -f

wget https://dl-ssl.google.com/linux/linux_signing_key.pub
apt-key add linux_signing_key.pub
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /e>
