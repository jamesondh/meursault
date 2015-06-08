#!/bin/bash

# Grab config file
source $PWD/meursault.conf

# Desktop manager
case $dm in
    i3)
        echo "Installing i3..."
        sudo apt-get install i3
        # Configuration files for i3
        ;;
    *)
        echo "Error: dm variable unset or incorrect. Skipping."
esac

# Web browser
case $browser in
    firefox)
        echo "Installing Firefox..."
        sudo apt-get install firefox
        ;;
    chrome)
        # Todo: allow user to choose architecture. Just use 32-bit for now
        echo "Installing Chrome dependencies..."
        sudo apt-get install libxss1 libappindicator1 libindicator7
        echo "Installing Chrome..."
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
        sudo dpkg -i google-chrome*.deb
        rm google-chrome*.deb
        ;;
    *)
        echo "Error: browser variable unset or incorrect. Skipping."
esac

# Other packages
echo "Installing remaining packages..."
sudo apt-get install ${packages[@]}
