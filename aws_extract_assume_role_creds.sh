#!/usr/bin/env bash

set -eu -o pipefail

########################################################
# This is used to extract the AWS credentials with the
# sts assume-role command. It will print the export
# command for the credentials. Just copy & paste them in
# your terminal.
# Use "aws_extract_assume_role_creds.sh unset" to unset the
# environment envs. Also copy & paste that.
# Example:
# aws sts assume-role --role-arn arn:aws:iam::[ACCOUNT_ID]:role/[ROLE_NAME] --role-session-name [SESSION_NAME] | aws_extract_assume_role_creds.sh
########################################################

# Check if the needed tool is present
if [[ ! `which jq` ]]; then
    echo "Command 'jq' not found! Please install the package 'jq'!"
    exit 1
fi

# Check if a variable called "unset" is present
if [[ $# == 1 ]] && [[ "$1" == "unset" ]]; then
    echo "unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN"
    exit 0
fi

# Call the command to extract the credentials
jq -r 'to_entries[0] | "export AWS_ACCESS_KEY_ID=\(.value.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.value.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.value.SessionToken)"'
