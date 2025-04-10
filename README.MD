# TypeScript Scaffolding

> A simple scaffolding tool for creating new TypeScript projects.

## Prerequisites

-   **jq**: This script uses `jq` to modify the `package.json` file. Please ensure it's installed.
    -   macOS (using Homebrew): `brew install jq`
    -   Debian/Ubuntu: `sudo apt-get update && sudo apt-get install jq`
    -   Other systems: Check the [jq installation guide](https://stedolan.github.io/jq/download/).

## install cli script

```bash
sudo wget https://raw.githubusercontent.com/ShinChven/typescript-scaffolding/master/ts-init.sh -O /usr/local/bin/ts-init && sudo chmod +x /usr/local/bin/ts-init
```

## Usage

```bash
ts-init my-new-project
```

## Upgrade Dependencies

To upgrade project dependencies to their latest versions, you can use the `npm-check-updates` tool.

1.  Install `npm-check-updates` globally (if you haven't already):
    ```bash
    npm install -g npm-check-updates
    ```
2.  Run the update command in your project directory:
    ```bash
    ncu -u
    ```
3.  Install the updated packages:
    ```bash
    npm install
    ```
