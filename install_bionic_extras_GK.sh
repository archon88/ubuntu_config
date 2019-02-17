#Snap packages -- an alternative package management system.

declare -a snaps_list=(
                      "--classic" #powerful and extensible text editor (needs to be intalled in classic mode)
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
