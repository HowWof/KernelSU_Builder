#!/bin/bash

# Convert the YAML file to JSON
json=$(python -c "import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout)" < sources.yaml)

# Convert the JSON to a string using jq
json_string=$(echo "$json" | jq -rC tostring)

# Echo the stringified JSON to the GitHub environment variable buildsettings
echo "buildsettings=$json_string" >> $GITHUB_ENV