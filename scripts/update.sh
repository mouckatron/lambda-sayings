#! /bin/bash

MY_PATH="$(dirname $0)"
MY_PATH="$(cd $MY_PATH && pwd)"
AWS_SHARED_CREDENTIALS_FILE=$(dirname $MY_PATH)/aws-credentials

aws lambda update-function-code --function-name get-saying --zip-file fileb://$MY_PATH/../go/cmd/get-saying/get-saying.zip
