#!/bin/sh

echo "### Clone the Symfony project from GITHUB ###"

# Ask the user for a path
read -p "Please enter the absolute path to the directory where to install the project: " user_path

# Clone the project
echo "Installing the project in: $user_path"

git clone https://github.com/issamkhadiri1989/empty_symfony_project.git $user_path

# Go inside the directory and run the needed commands
cd $user_path 
make install

echo "Installation finished. Go to http://localhost and have fun :)"
