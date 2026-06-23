#!/bin/bash

# > overwrite	>> append .txt
# 2>&1 will write output and error to .txt
# set name and l ocation variable if needed - helps with cleanup.sh

# list aws buckets and write them to txt file
echo "command: aws s3 ls" > commandhistory.txt
aws s3 ls >> commandhistory.txt 2>&1

# create a bucket & save to .txt
echo "command: aws s3 mb s3://awscli-scriptlab-2026/" >> commandhistory.txt
aws s3 mb s3://awscli-scriptlab-2026/ >> commandhistory.txt 2>&1

# create a compressed archive
	# Create new archive
	# gZip compress
	# Verbose mode - show file
	# Filename of archive
echo "command: tar -czvf photo.tar.gz ~/aws-bucket/photo.jpg" >> commandhistory.txt
tar -czvf photo.tar.gz ~/aws-bucket/photo.jpg >> commandhistory.txt 2>&1

# run aws s3 storage, copy photo.archive to bucket
echo "command: aws s3 cp photo.tar.gz s3://awscli-scriptlab-2026/" >> commandhistory.txt
aws s3 cp photo.tar.gz s3://awscli-scriptlab-2026/ >> commandhistory.txt 2>&1

# verify upload
echo "command: aws s3 ls s3://awscli-scriptlab-2026/" >> commandhistory.txt
aws s3 ls s3://awscli-scriptlab-2026/ >> commandhistory.txt 2>&1

# confirm file is compressed
echo "command: ls -lh photo.tar.gz" >> commandhistory.txt
ls -lh photo.tar.gz >> commandhistory.txt 2>&1

# look at file
echo "command: tar -tzvf photo.tar.gz" >> commandhistory.txt
tar -tzvf photo.tar.gz >> commandhistory.txt 2>&1

echo "run cleanup.sh when lab is complete"
