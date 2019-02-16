#Snap packages -- an alternative package management system.

declare -a snaps_list=(
                      "--clasic atom" #Powerful and extensible text editor (needs to be intalled in classic mode)
                      "communitheme" #Alternative theme for Ubuntu 18.04
                      "brave" #alternative web browser
                      )

echo "Do you wish to install/list snap packages [y/n/l]?"
read Snap_Response

case $Snap_Response in
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
      echo "Option ${Snap_Response} not recognised."; exit;;
esac
