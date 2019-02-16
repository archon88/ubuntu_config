#!/bin/bash

#This is an install script for Ubuntu 18.04 LTS ("Bionic Beaver") -- with minimal adjustment it should work on any Debian-based distribution. It automates the installation of the packages listed below, together with all their dependencies. It should be placed in your home directory (~) -- simply running "cd" at the command line will move you here. Then, you may need to do "chmod +x install_bionic_GK_2018-06-19.sh" to make it executable. Simply do "./install_bionic_GK_2018-06-19.sh" to run it; you will be prompted to enter your user password to run the install commands with root privileges.

#unzip, strip, touch, finger, grep, mount, fsck, more, yes, fsck, fsck, fsck, umount, sleep
#Add rtorrent, miro, WBM software

declare -a package_list=(
                        "gnome" #ensure all GNOME stuff installed
                        "gnome-tweaks" #customisation tool for GNOME
                        "gnome-shell-extensions" #more customisation
                        "dconf-editor" #customisation
                        "alacarte" #customisation
                        "libreoffice" #ensure full install of libreoffice
                        "gnumeric" #GNOME spreadsheet application
                        "chromium-browser" #open version of Chrome
                        "tor" #The Onion Router
                        "openvpn" #VPN support
                        "dtrx" #useful for automatically extracting archive files of any type
                        "gpg" #encryption software
                        "fdisk" #disk partition management tool
                        #Terminal/package management applications and utilities
                        "lynx links" #lightweight console-based web browsers
                        "alpine" #console-based email client
                        "conky" #highly customisable desktop system information display
                        "lm-sensors hddtemp" #utilities for monitoring hardware properties
                        "screenfetch neofetch" #system information tools with nice ASCII art
                        "screen" #terminal multiplexer
                        "zsh csh" #alternative shells
                        "terminology"#alternative terminal app
                        "terminator" #alternative terminal app
                        "htop" #Task manager
                        "aptitude" #more advanced interface to package management system
                        "tasksel" #package management interface
                        "synaptic" #alternative GUI for package management system
                        "wajig" #alternative interface to package management system
                        #Scientific software
                        "texlive-full" #full LaTeX installation
                        "lyx" #LaTeX editor
                        "sagemath" #computer algebra system
                        "cantor" #interface for mathematical applications
                        "gnuplot" #simple plotting software
                        "octave" #GNU clone of Matlab
                        "pspp" #GNU clone of SPSS
                        #Media and creativity
                        "curl" #tool for transferring files via web
                        "wget" #tool for transferring files via web
                        "audacity" #audio editor
                        "vlc" #video player
                        "openshot" #video editor
                        "blender" #3D graphical modelling and rendering
                        "gimp" #image manipulation program
                        "musescore" #music composition and notation software
                        "calibre" #ebook library and manager
                        "scribus" #desktop publishing system
                        "imagemagick" #image manipulation programs
                        "ghostscript" #interpreter for PostScript
                        "boinc-client" #BOINC distributed computing system
                        #Software development
                        "eclipse" #Java-based IDE
                        "emacs" #minimalist text editor
                        "git subversion" #version control software
                        "vim vim-nox vim-gtk3" #minimalistic text editor
                        "geany geany-plugins" #Text editor
                        "perl" #ensure full Perl installation
                        "perl6" #Perl version 6
                        "golang" #Go compiler
                        "gdc" #D compiler
                        "rustsrc rustc rust-doc rust-gdb rust-lldb" #Rust language
                        "default-jdk" #Java development kit
                        "javascript-common nodejs node-core-js npm" #JavaScript & related packages
                        "ruby ruby-all-dev" #Ruby language and dev tools
                        "rails ruby-rails" #web development framework
                        "build-essential cmake clang" #tools for building software
                        "gfortran" #fortran compiler
                        "open-cobol" #COBOL compiler (might be useful one day...)
                        "ghc" #Glasgow Haskell Compilation system (Haskell programming language)
                        "nasm" #assembler compiler
                        "r-base" #R language base
                        "php" #Server-side scripting language
                        "coffeescript" #CoffeeScript interpreter/compiler
                        #"julia" #Julia language
                        "adb" #Android development bridge -- for giving commands to an android device from Ubuntu
                        "fastboot" #Android fastboot tool
                        #If you want to try KDE
                        "kubuntu-desktop"
                        "amarok gwenview calligra kate kile konqueror"
                        )

echo -e "This script will install a range of useful packages for Ubuntu 18.04.\nDo you wish to install all packages automatically [y], be prompted\nfor installation of each package [n], view the list of packages to be installed [l], or cancel the installation [c]?"
read Response

case "$Response" in
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
        echo "Option ${Response} not recognised."; exit;; #Any other option.
esac
