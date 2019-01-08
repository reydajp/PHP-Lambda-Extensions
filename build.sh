#!/bin/bash

yum install -y zip php71-mysqlnd

mkdir /tmp/layer
cd /tmp/layer
cp /opt/layer/php.ini .

mkdir lib
cp -a /usr/lib64/php lib/

rm -rf /opt/layer/php_extensions.zip
zip -r /opt/layer/php_extensions.zip .