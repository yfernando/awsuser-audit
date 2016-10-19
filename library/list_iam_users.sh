#!/bin/bash

source $1

export AWS_ACCESS_KEY_ID=${aws_access_key}
export AWS_SECRET_ACCESS_KEY=${aws_secret_key}
export AWS_SESSION_TOKEN=${security_token}

aws iam list-users | jq '{"aws_account": "123456789","aws_users" : [.Users[] | .UserName]}'
