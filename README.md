# lambda-sayings

Lambda API for getting inspirational daily quotes

## Prerequisites

* An S3 bucket to store lambda functions in
* Installed terraform
* Installed Golang

## Setup

* Copy the [terraform/terraform.tfvars.example](terraform/terraform.tfvars.example) file to terraform/terraform.tfvars and enter the name of the bucket to store your lambda function in
* Copy the [aws-credentials.example](aws-credentials.example) file to aws-credentials and enter your AWS credentials
* Run `./build.sh` and `./push.sh` in the scripts folder
* Run `terraform apply` in the terraform folder
* Run `./load-db.sh` in the scripts folder
* Log into the console and click run on your new API in the APIGateway section
