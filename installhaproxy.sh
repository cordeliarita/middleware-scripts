#!/bin/bash

#Author: Dominique

#Date: March 15, 2022

#Description: This script is to automate the installation of Haproxy for the load balancer

if 
[ $UID -ne 0 ]
then
echo -e "\n You need root access to download this...please login as root\n"
exit 1
fi

echo -e "\nWe will be installing haproxy...\n"
sleep 3
yum install haproxy -y > /dev/null 2>&1

echo -e "\nNow let's check the status of the daemon\n"
sleep 3
systemctl status haproxy

sleep 3

echo -e "\nNow let us start and enable the haproxy daemon\n"
sleep 3

systemctl start haproxy > /dev/null 2>&1
systemctl enable haproxy > /dev/null 2>&1

sleep 2

echo -e "\n Now let us check if it is enabled and running\n"
sleep 3

systemctl status haproxy

sleep 3

echo -e "\nHaproxy has been successfully installed on your system, now you can setup your load balancer\n"
                                                                                                              
