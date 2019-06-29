#! /bin/bash

MY_PATH="$(dirname $0)"
MY_PATH="$(cd $MY_PATH && pwd)"

cd $MY_PATH/../go/cmd/get-saying
go build

zip get-saying.zip get-saying
