# cloud-uploader-cli
Bash command-line interface (CLI) tool for uploading files to AWS S3. This script allows users to upload files to a specified S3 bucket, with optional encryption, upload progress display and a feature to generate a pre-signed URL for sharing.

## Table of contents
* [Features](#features)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Configuration](#configuration)
* [Usage](#usage)
* [Script Breakdown](#script-breakdown)
* [Troubleshooting](#troubleshooting)
* [License](#license)

## Features
* Upload a file to an AWS S3 bucket.
* Server-side encryption (AES-256) for secure file storage.
* Generate a pre-signed URL for easy sharing of the uploaded file.
* Progress display during upload (optional).

## Prerequisites
* AWS CLI installed and configured on your system.
* An AWS S3 bucket.
* Basic knowledge of Bash scripting

## Installation
1. Clone the Repository:
```bash
git clone https://github.com/cchoi97/cloud-uploader-cli.git
cd cloud-uploader-cli
```
1. Make the script executable:
```bash
chmod +x cloud-upload.sh
```

## Configuration
1. Set your S3 Bucket Name:
  * Open the cloud-upload.sh script in a text editor.
  * Replace `your-bucket-name` with the name of your S3 Bucket in the `BUCKET_NAME` VARIABLE:
  ```bash
  BUCKET_NAME="your-bucket-name`
  ```
1. Install required tool:
  * If you want to use the progress bar feature, ensure `pv` is installed:
  ```bash
  sudo yum install pv   # For Amazon Linux, CentOS, or RHEL
  sudo apt-get install pv   # For Ubuntu or Debian
  ```

## Usage
Basic Upload:
```bash
./cloud-upload.sh /path/to/your/file.txt
```
  * This command uploads your `file.txt` to your specified S3 Bucket.

## Script Breakdown
* Argument Check: Validates that exactly one or two arguments are provided.
* File Check: Ensures the file exists before attempting to upload.
* Upload: Uses the AWS CLI to upload the file with optional encryption.
* Progress Bar: Displays a progress bar during upload (requires pv).
* Shareable Link: Generates a pre-signed URL for the uploaded file, valid for 7 days.

## Troubleshooting
* "File not found!" Error: Ensure the file path is correct and the file exists.
* "Command not found" for pv: Install pv if you want to use the progress bar.
* Upload Failure: Check AWS CLI configuration, bucket permissions, and credentials.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
