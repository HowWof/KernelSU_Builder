#!/bin/bash

# Print the content of the YAML file
echo "Contents of sources.yaml:"
cat sources.yaml


# Convert the YAML file to JSON
json=$(python -c "import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout)" < sources.yaml)

# Print the JSON content
echo "JSON content:"
echo "$json"

# Extract URLs from the JSON content
LINEAGE_URL=$(echo "$json" | jq -r '.["LineageOS-20"].kernel[0]' | cut -d ' ' -f 3)
ZENITSU_URL=$(echo "$json" | jq -r '.Zenitsu.kernel[0] | split(" ")[2]')

# Print extracted URLs
echo "Lineage URL: $LINEAGE_URL"
echo "Zenitsu URL: $ZENITSU_URL"

# Set the extracted URLs as output parameters using the new method
{
  echo "lineage_url=$LINEAGE_URL"
  echo "zenitsu_url=$ZENITSU_URL"
} >> "$GITHUB_OUTPUT"
