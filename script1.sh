#!/bin/bash

# List of S3 folders
declare -a arr=("s3://pasta a ser copiada/")
echo "*** Teste ***"

# Iterate over each S3 folder
for s3_folder in "${arr[@]}"
do
  # List all files in the S3 folder
  files=$(aws s3 ls $s3_folder | awk '{print $4}')

  # Iterate over each file
  for file in $files
  do
    # Download the file
    aws s3 cp "$s3_folder/$file" .

    # Upload the file to GCP
    gsutil cp "$file" "gs://gcp_bucket/$(basename $s3_folder)/"

    # Delete the file from local storage
    rm "$file"
  done
done
echo "*** Teste ***"