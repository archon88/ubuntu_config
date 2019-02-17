#!/bin/bash

#This is an install script for Ubuntu 18.04 LTS ("Bionic Beaver") -- with minimal adjustment it should work on any Debian-based distribution. It automates the installation of the packages listed below, together with all their dependencies. It should be placed in your home directory (~) -- simply running "cd" at the command line will move you here. Then, you may need to do "chmod +x install_bionic_GK_2018-06-19.sh" to make it executable. Simply do "./install_bionic_GK_2018-06-19.sh" to run it; you will be prompted to enter your user password to run the install commands with root privileges.

#Before running this script, it is recommended that the user check the list of packages to be installed and comment-out any undesired ones.

declare -a package_list=(
  #Misc OS and GNOME desktop environment tools
  "gnome" #ensure all GNOME stuff installed
  "gnome-tweaks alacarte" #customisation tools for GNOME
  "gnome-shell-extensions" #more customisation
  "dconf-editor" #customisation tool
  "libreoffice" #ensure full install of libreoffice
  "gnumeric" #GNOME spreadsheet application
  "chromium-browser" #open version of Chrome
  "tor" #The Onion Router -- secure browser for tor
  "openvpn" #VPN support
  "dtrx" #useful for automatically extracting archive files of any type
  "gpg" #GNU Privacy Guard encryption software
  "fdisk" #disk partition management tool
  "baobab" #disk usage visualisation tool
  "xmonad" #lightweight tiling window manager
  "wget curl" #tools for transferring files via web
  #Terminal/package management applications and utilities
  "lynx links" #lightweight console-based web browsers
  "alpine" #console-based email client
  "conky" #highly customisable desktop system information display
  "lm-sensors hddtemp" #utilities for monitoring hardware properties -- used in .conkyrc
  "screenfetch neofetch" #system information tools with nice ASCII art
  "screen tmux" #terminal multiplexers
  "zsh csh" #alternative shells
  "terminology"#alternative terminal app
  "terminator" #alternative terminal app
  "htop" #task manager -- improved version of top
  "aptitude" #more advanced interface to package management system
  "tasksel" #package management interface
  "synaptic" #alternative GUI for package management system
  "wajig" #alternative interface to package management system
  "tree" #tool for hierarchical visualisation of subdirectory structure
  #Scientific software
  "texlive-full" #full LaTeX installation
  "lyx" #WYSIWYG LaTeX editor
  "latexila texmaker texstudio" #LaTeX IDEs
  "sagemath" #computer algebra system
  "gnuplot" #simple plotting software
  "octave" #GNU clone of Matlab
  "scilab" #alternative to octave
  "pspp" #GNU clone of SPSS
  "gretl" #alternative to PSPP
  "boinc-client" #BOINC distributed computing system
  #Media and creativity
  "audacity" #audio editor
  "vlc" #video player
  "openshot" #video editor
  "cheese" #webcam booth
  "blender" #3D graphical modelling and rendering
  "inkscape" #vector graphics editor
  "shotwell gthumb feh" #photograph managers/viewers
  "gimp" #image manipulation program
  "pinta darktable mypaint" #alternative image manipulation programs
  "musescore" #music composition and notation software
  "calibre" #ebook library and manager
  "scribus" #desktop publishing system
  "imagemagick" #image manipulation programs
  "ghostscript" #interpreter for PostScript
  "pandoc" #powerful tool for converting between document formats and markup languages
  "festival" #text-to-speech program
  #Tools for software development
  "eclipse" #Java-based IDE
  "emacs" #minimalist text editor
  "scite" #scintilla-based text editor
  "geany geany-plugins" #scintilla-based text editor
  "git subversion mercurial" #version control software
  "vim vim-nox vim-gtk3" #minimalistic text editor                        
  "perl" #ensure full Perl 5 installation
  "perl6" #Perl version 6
  "golang" #Go compiler
  "gdc" #D compiler
  "rustsrc rustc rust-doc rust-gdb rust-lldb" #Rust language and associated tools
  "default-jdk" #Java development kit
  "javascript-common nodejs node-core-js npm" #JavaScript & related packages
  "ruby gem ruby-all-dev" #Ruby language, package manager, and dev tools
  "rails ruby-rails" #Ruby web development framework
  "build-essential cmake clang" #tools for building/compiling/linking, mainly relevant to C and C++
  "gfortran" #fortran compiler
  "open-cobol" #COBOL compiler (might be useful one day...)
  "ghc cabal-install" #Glasgow Haskell Compilation system (Haskell programming language)
  "nasm" #assembler compiler
  "r-base" #R language base
  "php" #Server-side scripting language
  "coffeescript" #CoffeeScript interpreter/compiler
  "netbeans" #general-purpose IDE, mainly for Java
  #"julia" #Julia language
  "adb" #Android development bridge -- allows control of an OEM-unlocked android device from Ubuntu command line
  "fastboot" #Android fastboot tool
  "rtorrent" #terminal-based torrent client
  "deluge" #torrent client
  "miro"
)

echo -e "This script will install a range of useful packages for Ubuntu 18.04.\nDo you wish to install all packages automatically [y], be prompted\nfor installation of each package [n], view the list of packages to be installed [l], or cancel the installation [c]?"
read Response

case "$Response" in
    "y")
        echo "Automatic installation of all packages has begun."
        sudo apt install -y software-properties-common python3-software-properties #Might be necessary to use add-apt-repository
        sudo apt-add-repository universe && sudo apt-add-repository multiverse && sudo apt update #Ensure all repos enabled and package list is up to date
        for package in "${package_list[@]}"
        do
          echo "installing package ${package}"
          sudo apt install -y --install-suggests $package
        done
        sudo apt -y full-upgrade && echo "Installation finished!" && exit;; #clean stuff up and ensure that eveerything is latest version
    "n")
        echo "Installation has begun. You will be prompted by apt to respond at each stage of installation."
        sudo apt install software-properties-common python3-software-properties
        sudo apt-add-repository universe && sudo apt-add-repository multiverse && sudo apt update
        for package in "${package_list[@]}"
        do
          echo "installing package ${package}"
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
        echo "Option ${Response} not recognised." && exit;; #Any other option.
esac

#Snap packages -- an alternative package management system.

declare -a snaps_list=(
  "atom --classic" #powerful and extensible text editor (needs to be intalled in classic mode)
  "communitheme" #alternative theme for Ubuntu 18.04
  "brave" #alternative web browser
  "eclipse --classic" #Eclipse IDE (Java) -- for custom install, better to get latest Eclipse installer
)

echo "Do you wish to install/list snap packages [y/n/l]?"
read snapResponse

case $snapResponse in
  "y")
      echo "Installing snap packages"
      for snap in "${snaps_list[@]}"
      do
        sudo snap install ${snap}
      done
      echo "Installation of snaps complete!"
      exit;;
  "n")
      echo "Aborting installation."
      exit;;
  "l")
      echo -e "Listing all snaps to be installed:\n"
      for snap in "${snaps_list[@]}"
      do
        echo "${snap}"
      done
      exit;;
  *)
      echo "Option ${snapResponse} not recognised."; exit;;
esac

#Prompt for installation of Anaconda Navigator -- this gives access to data analyis/visualisation and software development tools such as Spyder, RStudio, and VSCode

echo -e "Install Anaconda Navigator? [y/n]. Final script interaction."
read anacondaResponse

case "$anacondaResponse" in
        "y")
          echo "Installing Anaconda Navigator" 
          cd && wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64 && chmod +x Anaconda3-5.2.0-Linux-x86_64.sh && sudo ./Anaconda3-5.2.0-Linux-x86_64.sh && exit;;
        "n")
          echo "Aborting install. Exiting script." && exit;;
        "*")
          echo "Option ${anacondaResponse} not recognised." && exit;;
esac
        