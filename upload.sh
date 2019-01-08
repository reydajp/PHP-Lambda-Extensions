#!/bin/bash -e

MD5SUM=$(md5sum <<< php_extensions.zip | awk '{print $1}')
S3KEY="php71/${MD5SUM}.zip"
bucket_name="mathias-php-layers"

echo "Uploading php_extensions.zip to s3://${bucket_name}/${S3KEY}"
aws s3 cp php_extensions.zip "s3://${bucket_name}/${S3KEY}"