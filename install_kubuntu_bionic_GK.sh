#!/bin/bash

#This is an install script for the KDE environment and related applications for Ubuntu 18.04 LTS ("Bionic Beaver"). It automates the installation of the packages listed below, together with all their dependencies. It should be placed in your home directory (~) -- simply running "cd" at the command line will move you here. Then, you may need to do "chmod +x install_kubuntu_GK_2018-07-01.sh" to make it executable. Simply do "./install_kubuntu_GK_2018-07-01.sh" to run it; you will be prompted to enter your user password to run the install commands with root privileges.

declare -a package_list=(
  "kubuntu-desktop" #the base KDE install
  "amarok" #media player
  "gwenview" #image viewer
  "calligra" #office suite
  "kate" #text editor
  "kile" #LaTeX IDE
  "konqueror" #integrated file/web browser
  "okular" #document viewer
  "kmymoney" #personal finance manager
  "kdeconnect" #connect to android devices
  "krita" #creative sketching/painting application
  "kdenlive" #video editor
  "digikam" #photo management app
  "cantor" #interface for mathematical applications
  "ark" #archiving tool
  "skanlite" #tool for scanning images
)

echo -e "This script will install the Kubuntu desktop for Ubuntu 18.04.\nDo you wish to install all packages automatically [y], be prompted\nfor installation of each package [n], view the list of packages to be installed [l], or cancel the installation [c]?"
read installResponse

case "$installResponse" in
    "y")
        echo "Automatic installation of all packages has begun."
        sudo apt install -y software-properties-common python3-software-properties #Might be necessary to use add-apt-repository
        sudo apt-add-repository universe && sudo apt-add-repository multiverse && sudo apt-get update #Ensure all repos enabled and package list is up to date
        for package in "${package_list[@]}"
        do
          sudo apt install -y --install-suggests $package
        done
        sudo apt -y full-upgrade && echo "Installation finished!" && exit;; #clean stuff up and ensure that eveerything is latest version
    "n")
        echo "Installation has begun. You will be prompted by apt to respond at each stage of installation."
        sudo apt install software-properties-common python3-software-properties
        sudo apt-add-repository universe && sudo apt-add-repository multiverse && sudo apt-get update
        for package in "${package_list[@]}"
        do
          sudo apt install --install-suggests $package
        done
        sudo apt full-upgrade && echo "Installation finished!" && exit;;
    "l")
        echo -e "Listing all packages to be installed:\n"
        for package in "${package_list[@]}"
        do
          echo "${package}"
        done
        exit;;
    "c")
        echo "Installation aborted."
        exit;;
    *)
        echo "Option ${installResponse} not recognised." && exit;; #Any other option.
esac
