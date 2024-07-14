#!/bin/bash


# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 /path/to/file"
  exit 1
fi


FILE=$1


# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found!"
  exit 1
fi


FILENAME=$(basename "$FILE")

BUCKET_NAME="upload-tingz"


# Upload the file with progress bar
echo "Uploading $FILE to s3://$BUCKET_NAME/$FILENAME"
aws s3 cp "$FILE" "s3://$BUCKET_NAME/$FILENAME" --sse "AES256" | pv -pte -s $(stat -c%s "$FILE")



# Check if upload was successful
if [ $? -eq 0 ]; then
  echo "File uploaded successfully to s3://$BUCKET_NAME/$FILENAME"
  # Generate and display a sharable link
  SHARE_URL=$(aws s3 presign "s3://$BUCKET_NAME/$FILENAME" --expires-in 604800)
  echo "Shareable link: $SHARE_URL"
else
  echo "File upload failed. Please check your AWS credentials and bucket permissions."
fi
