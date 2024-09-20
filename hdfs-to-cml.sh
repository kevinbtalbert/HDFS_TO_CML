#!/bin/bash

# Set the HDFS directory path (replace with your actual HDFS path)
HDFS_PATH="/tmp"

# Get the current date in YYYY-MM-DD format
TODAY=$(date +"%Y-%m-%d")

# Define the destination directory
DEST_DIR="/home/cdsw/data"

# Define the keytab file and principal (replace with your actual keytab file and principal)
KEYTAB_FILE="/home/cdsw/HDFS_TO_CML/ktalbertaws22-cdp-env-ktalbert.keytab"
PRINCIPAL="ktalbert@KTALBERT.A465-9Q4K.CLOUDERA.SITE"

# Authenticate using kinit with the keytab file
kinit -kt "$KEYTAB_FILE" "$PRINCIPAL"
if [ $? -ne 0 ]; then
    echo "kinit failed. Unable to authenticate."
    exit 1
fi

# Check if the argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 [1 for today's records | 2 for entire directory]"
    exit 1
fi

# Option 1: Copy only today's records
if [ "$1" -eq 1 ]; then
    echo "Copying today's records from HDFS..."
    # Find and copy today's records based on modification date
    hdfs dfs -ls "$HDFS_PATH" | grep "$TODAY" | awk '{print $8}' | while read -r file; do
        echo "Copying $file to ${DEST_DIR}"
        hdfs dfs -cp "$file" "$DEST_DIR"
        if [ $? -ne 0 ]; then
            echo "Failed to copy $file."
            exit 1
        fi
    done
    echo "Today's records copied successfully to ${DEST_DIR}."

# Option 2: Copy the entire directory
elif [ "$1" -eq 2 ]; then
    echo "Copying entire directory from HDFS..."
    hdfs dfs -cp "${HDFS_PATH}/*" "${DEST_DIR}/"
    if [ $? -eq 0 ]; then
        echo "Entire directory copied successfully to ${DEST_DIR}."
    else
        echo "Failed to copy the entire directory."
        exit 1
    fi

# Invalid option
else
    echo "Invalid option. Use 1 for today's records, or 2 for the entire directory."
    exit 1
fi
