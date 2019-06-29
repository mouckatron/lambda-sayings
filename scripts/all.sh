#! /bin/bash

MY_PATH="$(dirname $0)"
MY_PATH="$(cd $MY_PATH && pwd)"

$MY_PATH/build.sh
$MY_PATH/push.sh
$MY_PATH/update.sh
