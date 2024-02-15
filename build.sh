#!/bin/bash

# Get version from GitHub environment variable
version=${VERSION}

# Check if version is provided
if [ -z "$version" ]
then
    echo "No version specified. No config or build will be executed. Exiting..."
    exit 1
fi

# Convert the YAML file to JSON
json=$(python -c "import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout)" < sources.yaml)

# Check if json is empty
if [ -z "$json" ]
then
    echo "Failed to convert YAML to JSON. Exiting..."
    exit 1
fi

# Parse the JSON file
config_commands=$(echo $json | jq -r --arg version "$version" '.[$version].config[]')
build_commands=$(echo $json | jq -r --arg version "$version" '.[$version].build[]')

# Check if config_commands and build_commands are empty
if [ -z "$config_commands" ] || [ -z "$build_commands" ]
then
    echo "Failed to parse JSON. Exiting..."
    exit 1
fi

# Print the commands that will be executed
echo -e "\033[31mBuild.sh will execute following commands corresponding to ${version}:\033[0m"
echo "$config_commands" | while read -r command; do
    echo -e "\033[32m$command\033[0m"
done
echo "$build_commands" | while read -r command; do
    echo -e "\033[32m$command\033[0m"
done

# Enter the kernel directory
cd kernel || exit 1

# Execute the config commands
echo "$config_commands" | while read -r command; do
    eval "$command"
done

# Execute the build commands
echo "$build_commands" | while read -r command; do
    eval "$command"
done