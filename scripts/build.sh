#! /bin/bash

MY_PATH="$(dirname $0)"
MY_PATH="$(cd $MY_PATH && pwd)"

cd $MY_PATH/../go/cmd/get-saying
GOOS=linux GOARCH=amd64 go build

zip get-saying.zip get-saying
