#! /bin/bash

MY_PATH="$(dirname $0)"
MY_PATH="$(cd $MY_PATH && pwd)"
AWS_SHARED_CREDENTIALS_FILE=$(dirname $MY_PATH)/aws-credentials

COUNTER=1
while IFS= read -r line; do
    aws dynamodb put-item --table-name sayings \
        --item '{"id": {"N": "'$COUNTER'"}, "saying": {"S": "'"$line"'"}}'
    echo -n '.'
    COUNTER=$(($COUNTER+1))
done < "$MY_PATH/sayings.txt"
echo ""
