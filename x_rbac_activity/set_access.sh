#!/bin/bash

sudo groupadd Dev
sudo groupadd QA
sudo groupadd SysAd
sudo groupadd DBA
sudo groupadd Support
sudo groupadd Managers

sudo setfacl -m g:Dev:rw var/www
sudo setfacl -m g:Dev:r var/log
sudo setfacl -m g:QA:rx var/staging
sudo setfacl -m g:SysAd:rwx /
sudo setfacl -m g:DBA:rwx var/lib/mysql
sudo setfacl -m g:Support:r var/log/syslog
sudo setfacl -m g:Managers:r var/reports/performance

sudo useradd -m DevinDev
sudo useradd -m KatyQA
sudo useradd -m SaraSys
sudo useradd -m DavidDBA
sudo useradd -m SammySupport
sudo useradd -m MaryManager

echo 'DevinDev:123' | sudo chpasswd
echo 'KatyQA:123' | sudo chpasswd
echo 'SaraSys:123' | sudo chpasswd
echo 'DavidDBA:123' | sudo chpasswd
echo 'SammySupport:123' | sudo chpasswd
echo 'MaryManager:123' | sudo chpasswd

sudo usermod -a -G Dev DevinDev
sudo usermod -a -G QA KatyQA
sudo usermod -a -G SysAd SaraSys
sudo usermod -a -G DBA DavidDBA
sudo usermod -a -G Support SammySupport
sudo usermod -a -G Managers MaryManager

getfacl /
getfacl /var/www
getfacl /var/log
getfacl /var/staging
getfacl /var
getfacl /var/lib/mysql
getfacl /var/log/syslog
getfacl /var/reports/performance
