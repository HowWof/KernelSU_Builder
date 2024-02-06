#!/bin/bash

# Get version from GitHub environment variable
version=${VERSION}

# Check if version is provided
if [ -z "$version" ]
then
    echo "No version specified. No clean will be executed. Exiting..."
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
out_commands=$(echo $json | jq -r --arg version "$version" '.[$version].Clean.out[]')
kernel_commands=$(echo $json | jq -r --arg version "$version" '.[$version].Clean.kernel[]')
custom_commands=$(echo $json | jq -r --arg version "$version" '.[$version].Clean.custom[]')

# Check if out_commands and kernel_commands are empty
if [ -z "$out_commands" ] || [ -z "$kernel_commands" ]
then
    echo "Failed to parse JSON. Exiting..."
    exit 1
fi

# Print the commands that will be executed
echo -e "\033[31mClean.sh will execute following commands corresponding to ${version}:\033[0m"
echo "$out_commands" | while read -r command; do
    echo -e "\033[32m$command\033[0m"
done
echo "$kernel_commands" | while read -r command; do
    echo -e "\033[32m$command\033[0m"
done

# Execute the out commands
echo "$out_commands" | while read -r command; do
    eval "$command"
done

# Execute the kernel commands
echo "$kernel_commands" | while read -r command; do
    eval "$command"
done

# If custom command is provided, execute it
if [ -n "$custom_commands" ]
then
    echo "$custom_commands" | while read -r command; do
        echo -e "\033[32m$command\033[0m"
    done

    # Execute the custom commands
    echo "$custom_commands" | while read -r command; do
        eval "$command"
    done
fi