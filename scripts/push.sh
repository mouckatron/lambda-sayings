#! /bin/bash

MY_PATH="$(dirname $0)"
MY_PATH="$(cd $MY_PATH && pwd)"
AWS_SHARED_CREDENTIALS_FILE=$(dirname $MY_PATH)/aws-credentials

BUCKET=$(echo $(grep "lambda_s3bucket" $MY_PATH/../terraform/terraform.tfvars | cut -d= -f2 | sed 's/"//g'))

aws s3 cp $MY_PATH/../go/cmd/get-saying/get-saying.zip s3://$BUCKET/get-saying/get-saying.zip
