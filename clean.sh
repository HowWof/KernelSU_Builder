#!/bin/bash

# Define some colors
GREEN='\033[32m'
RED='\033[31m'
NC='\033[0m' # No Color


# Convert the YAML file to JSON using Python
json=$(python -c "import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout)" < sources.yaml)

# Check if json is empty
if [ -z "$json" ]
then
    echo -e "${RED}Failed to convert YAML to JSON. Exiting...${NC}"
    exit 1
fi

# Parse the JSON file
out_commands=$(echo $json | jq -r '.Clean.out[]')
kernel_commands=$(echo $json | jq -r '.Clean.kernel[]')
custom_commands=$(echo $json | jq -r '.Clean.custom[]')

# Print the commands that will be executed
echo -e "${GREEN}Clean.sh will execute following commands:${NC}"
echo "$out_commands" | while read -r command; do
    echo -e "${RED}$command${NC}"
done
echo "$kernel_commands" | while read -r command; do
    echo -e "${RED}$command${NC}"
done
echo "$custom_commands" | while read -r command; do
    echo -e "${RED}$command${NC}"
done

# Enter kernel directory
cd kernel

# Execute the out commands
echo "$out_commands" | while read -r command; do
    eval "$command"
done

# Execute the kernel commands
echo "$kernel_commands" | while read -r command; do
    eval "$command"
done

# Execute the custom commands
echo "$custom_commands" | while read -r command; do
    eval "$command"
done