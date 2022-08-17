#!/bin/bash
#aws lambda invoke --function-name my-function out --log-type Tail
aws lambda invoke --function-name my-function out --log-type Tail \
	--query 'LogResult' --output text |  base64 -d
