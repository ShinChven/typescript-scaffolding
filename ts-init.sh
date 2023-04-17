#!/bin/bash

set -x

# Check if a directory name was provided
if [ -z "$1" ]
then
  echo "Please provide a directory name."
  exit 1
fi

# Clone the repository
git clone https://github.com/ShinChven/typescript-scaffolding.git "$1"

# Change to the directory
cd "$1"

# Remove the .git directory
rm -rf .git

# Update the name in package.json
sed -i "s/\"name\": \"typescript-scaffolding\"/\"name\": \"$1\"/" package.json

# Install npm dependencies
npm install
