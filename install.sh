#!/bin/bash

# Grab config file (if it exists)
if [ -f $PWD/meursault.conf ]; then
    source $PWD/meursault.conf
    noPromptUser=true
fi

# If config file does not exist, prompt user
if [ ! -z "$noPromptUser" ]; then
    # Config file exists
    echo "Configuration file found!"
else

    # Config file does not exist
    echo "No configuration file found. Prompting user for settings."

    # DRY
    function promptUser {
        echo ""
        echo "Please choose a $1. Type the corresponding number next to the"
        echo "option of your choice, or simply press ENTER to select the default option."
    }

    # Desktop manager
    promptUser "desktop manager"
    echo "1) i3"
    echo ""
    read dminput
    case $dminput in
        1)
            dm=i3
            ;;
        *)
            echo "Error: You did not enter a valid number."
    esac
    echo "$dm selected."

    # Web browser
    promptUser "web browser"
    echo "1) firefox"
    echo "2) chrome"
    echo ""
    read browserinput
    case $browserinput in
        1)
            browser=firefox
            ;;
        2)
            browser=chrome
            ;;
        *)
            echo "Error: You did not enter a valid number."
    esac
    echo "$browser selected."

    echo "" # Separate installation and configuration with newline

fi

# Here is where the actual installation begins

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
