# aws-python-scripts

## aws_extract_assume_role_creds.sh

This is used to extract the AWS credentials with the sts assume-role command.

It will print the export command for the credentials.

Just copy & paste them in your terminal.


Use ```aws_extract_assume_role_creds.sh unset``` to unset the
environment envs. Also copy & paste that.


**Example:**

```sh
aws sts assume-role --role-arn arn:aws:iam::[ACCOUNT_ID]:role/[ROLE_NAME] --role-session-name [SESSION_NAME] | aws_extract_assume_role_creds.sh
```
