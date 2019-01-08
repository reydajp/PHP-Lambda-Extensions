#!/bin/bash -e

MD5SUM=$(md5sum <<< php_extensions.zip | awk '{print $1}')
S3KEY="php71/${MD5SUM}.zip"
bucket_name="mathias-php-layers"

echo "Publishing Lambda Layer 'php_extensions'..."
# Must use --cli-input-json so AWS CLI doesn't attempt to fetch license URL
version=$(aws lambda publish-layer-version --cli-input-json "{\"LayerName\": \"php_extensions\",\"Description\": \"PHP 7.1 Extensions\",\"Content\": {\"S3Bucket\": \"${bucket_name}\",\"S3Key\": \"${S3KEY}\"},\"CompatibleRuntimes\": [\"provided\"],\"LicenseInfo\": \"http://www.php.net/license/3_01.txt\"}"  --output text --query Version)
echo "Published Lambda Layer php71 in version ${version}"
