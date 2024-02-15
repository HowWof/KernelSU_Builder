#!/bin/bash

# Define some colors
RED='\033[31m'
GREEN='\033[32m'
NC='\033[0m' # No Color

# Get version from GitHub environment variable
version=${VERSION}

# Check if version is provided
if [ -z "$version" ]
then
    echo -e "${RED}No version specified. No targets will be moved. Exiting...${NC}"
    exit 1
fi

# Convert the YAML file to JSON
json=$(python -c "import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout)" < sources.yaml)

# Check if json is empty
if [ -z "$json" ]
then
    echo -e "${RED}Failed to convert YAML to JSON. Exiting...${NC}"
    exit 1
fi

# Parse the JSON file to get the target
target=$(echo $json | jq -r --arg version "$version" '.[$version].target[]')

# Check if target is empty
if [ -z "$target" ]
then
    echo -e "${RED}Failed to parse JSON. Exiting...${NC}"
    exit 1
fi

# Add 'kernel' to the target path
target="${GITHUB_WORKSPACE}/kernel/$target"

# Check the KERNELSU environment variable and move the target to the appropriate directory
if [ "${KERNELSU}" == "true" ]
then
    mv $target "${GITHUB_WORKSPACE}/outw/true"
else
    mv $target "${GITHUB_WORKSPACE}/outw/false"
fi