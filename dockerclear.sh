#!/bin/bash

#Author: Dominique
#Date: March 7th 2022
#Description: This script is clean up our servers of docker images and containers to start afresh

echo -e "\nLet us start by clearing up the containers we have on the system so far...\n"
sleep 3
docker rm -f $(docker ps -a -q) > /dev/null 2>&1
sleep 3
if
	[ $? -eq 0 ]

then
echo -e "\nAll the containers have been cleared from the system\n"
fi

sleep 3

echo -e  "\nNow let's clear all the images we have...\n"
sleep 3
docker rmi $(docker images -q) -f > /dev/null 2>&1
sleep 3
if
        [ $? -eq 0 ]
then
echo -e "\nAll the images have been cleared from the system\n"
fi


echo -e "\nEverything was cleared successfully\n"
exit 0
