#!/bin/bash
AWS_IAM=AWS_IAM
SERVERLESS_BENCH_HOME=SERVERLESS_BENCH_HOME
IAM_ROLE=IAM_ROLE

FILE_NAME="aws-pkg20.zip"
HANDLER_NAME="aws_pkg20.handler"

TESTCASE="Testcase8-Function-size/"
FUNC_NAME="aws-pkg20"

ZIP_NAME=$SERVERLESS_BENCH_HOME$TESTCASE$FILE_NAME
HANDLER=$SERVERLESS_BENCH_HOME$TESTCASE$HANDLER_NAME
RUNTIME="python3.7"

echo $ZIP_NAME
echo $HANDLER
aws lambda create-function --function-name $FUNC_NAME \
	--zip-file fileb://$ZIP_NAME --handler $HANDLER --runtime $RUNTIME \
	--role arn:aws:iam::$AWS_IAM:role/$IAM_ROLE

