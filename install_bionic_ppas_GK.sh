#!/bin/bash

#This script adds PPAs to install useful programs missing from the Canonical repos

#draft!

sudo add-apt-repository ppa:unit193/encryption #Veracrypt
sudo add-apt-repository ppa:dhor/myway #gtkrawgallery

sudo apt update
sudo apt install veracrypt
sudo apt install gtkrawgallery