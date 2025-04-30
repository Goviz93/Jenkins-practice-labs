#!/bin/bash

#-- File format
DATE=$(date +%H-%M-%S)
BACKUP=db-$DATE.sql


#-- DB Variables.
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5


#-- Process.
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \ 

#-- AWS Credentials
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION="us-east-1"

#-- Export backup to aws.
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME

