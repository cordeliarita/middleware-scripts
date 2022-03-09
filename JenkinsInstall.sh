#!/bin/bash

#Author: Dominique
#Date: March 1st, 2022

##This script is to automate the installing Jenkins on a CentOS 7 system using the official Jenkins repository.

echo -e  "\n We will now start to download Jenkins...\n "

if

 [ ${USER} != root ]

then 

echo -e "\n You are not the root user so you can't run this script!\n "
exit 100 
else
echo -e "\n You are the root user and you are good to go\n"
fi


echo -e "\n Before we can install Jenkins, we need to have Java installed in our system please wait while we install java...\n"
sleep 5
sudo yum install java-1.8.0-openjdk-devel -y

if
[ $? -ne 0 ]

then
echo -e "\n Issue with installing Java\n "
exit 99
fi

sleep 5
echo -e "\nNow we need to enable the Jenkins repository...\n "

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

if
[ $? -ne 0 ]

then
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
fi

if
[ $? -ne 0 ]
then
echo -e "\nThere is an issue with jenkins repo please check that and try again\n"
exit 95
fi

echo -e "\nNow we disable key check on the repo\n "

sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

if
[ $? -ne 0 ]

then
echo -e "\n Issue with disabling the keycheck on the repo please double the sed command\n"
exit 94
fi

sleep 5
echo -e "\n Now we will install the latest stable version of Jenkins.\n "

sudo yum install jenkins -y
if
[ $? -ne 0 ]

then
echo -e "\n Issue with installing Jenkins\n "
exit 96
fi
sleep 5
echo -e "\n Now we can start and enable the Jenkins service...\n "

sudo systemctl start jenkins
if
[ $? -ne 0 ]

then
echo -e "\n Issue with starting Jenkins\n"
exit 92
fi
sleep 5
sudo systemctl enable jenkins
if
[ $? -ne 0 ]

then
echo -e "\n Issue with enabling Jenkins\n"
exit 91
fi
sleep 5
echo -e "\n Now we can open the ports necessary for Jenkins to work\n "

sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
if
[ $? -ne 0 ]

then
echo -e "\n Issue with opening ports\n"
exit 100
fi
sudo firewall-cmd --reload
if
[ $? -ne 0 ]

then
echo -e "\n Issue with reloading firewall\n"
exit 100
fi

echo -e "\n PLease copy the code below as your password\n "

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

sudo yum install net-tools -y
ifconfig | grep 192.
echo -e "\nYour Jenkins Server is Install and ready to be used and your IP is above... Thank you...\n"
