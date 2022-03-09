#!/bin/bash

#Author : Dominique
#Date: 24 Feb 2022

#This script is made by me to automate downloading docker from video

echo "We will now start the process of downloading docker"
sleep 3

echo "First we will check if there are any older docker versions installed in the system"
sleep 3

sudo yum remove docker  docker-client docker-client-latest docker-common  docker-latest  docker-latest-logrotate docker-logrotate  docker-engine

sleep 2

echo "Now we are setting up the docker repository......"

sleep 3



sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sleep 3

echo "The docker repository was successfully set up"

sleep 2

echo "Now we will install and set up the docker engine....please be patient! grab a cup of coffee as needed "

sleep 3
sudo yum install docker-ce docker-ce-cli containerd.io -y
sleep 2

echo "Now we will start and enable the docker engine..."

 sleep 2

systemctl start docker
systemctl enable docker

echo "Let us check now the status of Docker to make sure it is running and enabled..... "

sleep 2

echo

systemctl status docker

if [ $? -eq 0 ]
then
echo "Everything is good to go. We can now start using docker to build containers"
else
echo "Check the file contents"
fi

exit 0
