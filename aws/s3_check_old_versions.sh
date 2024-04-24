#!/bin/bash

# Specify your S3 bucket and directory
bucket_name="my-bucket-name"
directory_path="my/directory/path/"

# List all object versions in the specified directory
versions=$(aws s3api list-object-versions --bucket $bucket_name --prefix $directory_path --query 'Versions[*].{VersionId:VersionId, LastModified:LastModified}')

# Parse the output to extract the version IDs and last modified dates
version_ids=$(echo $versions | jq -r '.Versions[].VersionId')
last_modified_dates=$(echo $versions | jq -r '.Versions[].LastModified')

# Get the current date in Unix timestamp format
current_date=$(date +%s)


# Loop through each version and check if it's older than a certain threshold
for i in $(seq 0 $(($(echo $versions | jq -r '.Versions | length')-1))); do
    version_id=$(echo $version_ids | cut -d " " -f $((i+1)))
    last_modified_date=$(echo $last_modified_dates | cut -d " " -f $((i+1)))

    # Convert last modified date to Unix timestamp format
    last_modified_timestamp=$(date -d "$last_modified_date" +%s)

    # Specify the threshold for considering a file as old (e.g., 30 days)
    threshold=$((30*24*60*60))  # 30 days in seconds

    echo "Version ID: $version_id, Last Modified: $last_modified_date"

    # Check if the file is older than the threshold
    # if [ $(($current_date - $last_modified_timestamp)) -gt $threshold ]; then
    #     echo "Old version found: Version ID: $version_id, Last Modified: $last_modified_date"
    # fi
done
