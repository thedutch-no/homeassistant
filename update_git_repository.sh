#! /bin/bash

# Add all files to the repository with respect to .gitignore rules
git add .

echo -n "Enter the Description for the Change: " [Minor Update]
read CHANGE_MSG

# Commit changes with message with current date stamp
git commit -m "${CHANGE_MSG}"

# Push changes towards GitHub
git push -u origin main

echo $?