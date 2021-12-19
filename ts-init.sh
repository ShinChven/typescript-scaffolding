#!/usr/bin/env bash
set -x
git clone https://github.com/ShinChven/typescript-scaffolding.git "$1"
cd "$1"
rm -rf .git ts-init.sh
git init
