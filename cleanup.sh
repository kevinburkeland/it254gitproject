#! /bin/bash

# remove objects from bucket
aws s3 rm s3://awscli-scriptlab-2026/ --recursive
echo "removed objects from s3 bucket."

# remove bucket
aws s3 rb s3://awscli-scriptlab-2026/
echo "removed s3 bucket."

# remove local files created from lab
rm ~/aws-bucket/commandhistory.txt
rm ~/aws-bucket/photo.tar.gz
echo "removed command history & .tar.gz file."
echo
echo "confirm cleanup: aws s3 ls"
