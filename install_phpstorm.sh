#!/bin/bash

# -----------------------------------------------------------------------------
# PhpStorm Installer Script
#
# This script extracts a PhpStorm .tar.gz archive, and sets up a terminal alias
# so you can launch PhpStorm with the command `phpstorm`.
#
# Usage:
#   ./install_phpstorm.sh <path-to-PhpStorm.tar.gz>
# -----------------------------------------------------------------------------

if [ -z "$1" ]; then
    echo "Usage: ./install_phpstorm.sh <path-to-PhpStorm.tar.gz>"

    exit 1
fi

the_archive="$1"

echo "Checking $the_archive ...."

if [ -f "$the_archive" ]; then
    echo "File found : $the_archive ... OK" 
    
    sudo tar -xzf "$the_archive"
    echo "Extracting to $the_archive ... OK"

    extracted_dir=$(tar -tzf "$the_archive" | head -1 | cut -f1 -d"/")

    echo "Setting up the alias ..."
    sudo rm -rf /opt/phpstorm
    sudo mv "$extracted_dir" /opt/phpstorm

    alias_line='alias phpstorm="/opt/phpstorm/bin/phpstorm.sh"'
    shell_config="$(eval echo ~${SUDO_USER:-$USER})/.bashrc"

    if grep -Fxq "$alias_line" "$shell_config"; then
        echo "Alias already exists in $shell_config ... OK"
    else
        echo "$alias_line" >> "$shell_config"
        echo "Alias added to $shell_config ... OK"
    fi

    echo "===================================================================================="
    echo "IMPORTANT ! To activate the alias, restart your terminal or run: source $shell_config" 
    echo "===================================================================================="   

    rm -Rf "$extracted_dir"
    echo "Clean up ... OK"

    echo "You can now run 'phpstorm' from the terminal."

    exit 0

else
    echo "File not found. Installation failed. The script will exit immediately."

    exit 1
fi
