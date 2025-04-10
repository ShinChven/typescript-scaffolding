#!/usr/bin/env bash

set -x

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "Error: jq is not installed. Please install jq (e.g., 'brew install jq' or 'sudo apt-get install jq') and try again."
    exit 1
fi

# Check if a directory name was provided
if [ -z "$1" ]
then
  echo "Please provide a directory name."
  exit 1
fi

PROJECT_NAME="$1"

# Clone the repository
git clone https://github.com/ShinChven/typescript-scaffolding.git "$PROJECT_NAME"

# Change to the directory
cd "$PROJECT_NAME" || exit 1 # Exit if cd fails

# Remove the .git directory
rm -rf .git ts-init.sh

# Modify package.json using jq
# Create a temporary file for jq output
tmp_json=$(mktemp)

# Use jq to update name and delete author/repository, then overwrite original file
jq --arg name "$PROJECT_NAME" '.name = $name | del(.author) | del(.repository)' package.json > "$tmp_json" && mv "$tmp_json" package.json

# Check if jq command succeeded
if [ $? -ne 0 ]; then
    echo "Error modifying package.json with jq."
    # Clean up temporary file if it exists
    [ -f "$tmp_json" ] && rm "$tmp_json"
    exit 1
fi

# Clean up temporary file if it exists (though mv should remove it on success)
[ -f "$tmp_json" ] && rm "$tmp_json"

# Install npm dependencies
npm install

git init
