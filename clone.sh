#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Get VERSION and KSU variables from environment variables
VERSION=${VERSION}
KSU=${KSU}

# Parse the YAML file and get the commands for the VERSION
IFS=$'\n' read -d '' -r -a COMMANDS < <(yq e '.["'$VERSION'"].script[]' sources.yaml)

# Check if KSU is true
if [ "$KSU" = "true" ]; then
    # Parse the YAML file and get the commands for KSU
    IFS=$'\n' read -d '' -r -a KSU_COMMANDS < <(yq e '.["KSU"].script[]' sources.yaml)
    # Merge COMMANDS and KSU_COMMANDS arrays
    COMMANDS=("${COMMANDS[@]}" "${KSU_COMMANDS[@]}")
fi

# Separate the make command and create a new array for other commands
MAKE_COMMAND=""
NEW_COMMANDS=()
for cmd in "${COMMANDS[@]}"; do
    if [[ $cmd == make* ]]; then
        MAKE_COMMAND=$cmd
    else
        NEW_COMMANDS+=("$cmd")
    fi
done

# Print the commands
echo -e "${GREEN}Commands to be executed:${NC}"
for cmd in "${NEW_COMMANDS[@]}"; do
    echo -e "${RED}$cmd${NC}"
done
    echo -e "${RED}$MAKE_COMMAND${NC}"

# Spacing
echo

# Execute the commands
for cmd in "${NEW_COMMANDS[@]}"; do
    eval "$cmd"
done

# Execute the make command last
if [[ $MAKE_COMMAND != "" ]]; then
    eval "$MAKE_COMMAND"
fi