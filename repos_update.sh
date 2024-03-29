#!/bin/bash

# store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
echo "\nPulling in latest changes for all repositories...\n"

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
  echo "";
  echo ""$i"";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;
    # finally pull 
    # the old name
    # git pull origin master;

    git pull;

    # the new PC friendly name
    # git pull origin main;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
  done

  echo "Complete!"
