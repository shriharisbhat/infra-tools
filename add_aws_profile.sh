#!/bin/bash

# Function to add a profile with IAM role to AWS config
add_profile_with_role() {
    local profile_name="$1"
    local role_arn="$2"
    local source_profile="$3"
    local region="$4"
    local config_file="$HOME/.aws/config"

    # Create config file if it doesn't exist
    mkdir -p "$(dirname "$config_file")"
    touch "$config_file"

    # Check if profile already exists
    if grep -q "\[profile $profile_name\]" "$config_file"; then
        echo "Profile $profile_name already exists. Updating..."
        sed -i.bak "/\[profile $profile_name\]/,/^$/d" "$config_file"
    fi

    # Append new profile to config file
    echo -e "\n[profile $profile_name]
role_arn = $role_arn
source_profile = $source_profile
region = $region" >> "$config_file"

    echo "Profile $profile_name has been added to $config_file"
}

# Interactive input
echo "Let's add a new AWS profile with an IAM role."

read -p "Enter the profile name: " profile_name

read -p "Enter the IAM role ARN: " role_arn

read -p "Enter the source profile (default is 'default'): " source_profile
source_profile=${source_profile:-default}

read -p "Enter the AWS region (e.g., us-west-2): " region

# Call the function with gathered inputs
add_profile_with_role "$profile_name" "$role_arn" "$source_profile" "$region"
