#! /bin/bash

MY_PATH="$(dirname $0)"
MY_PATH="$(cd $MY_PATH && pwd)"
BUCKET=$(echo $(grep "lambda_s3bucket" $MY_PATH/../terraform/terraform.tfvars | cut -d= -f2 | sed 's/"//g'))
AWS_SHARED_CREDENTIALS_FILE=$(dirname $MY_PATH)/aws-credentials

aws lambda update-function-code --function-name get-saying --s3-bucket $BUCKET --s3-key get-saying/get-saying.zip
