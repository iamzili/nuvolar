# nuvolar

## Create infrastructure

1. set AWS Credentials at `~/.aws/credentials`
2. `cd s3-dynamodb-backend; terraform init; terraform apply`
3. Go back to root dir
4. `cd eks; terraform init; terraform apply`


## Clean up

1. `cd eks; terraform destroy`
2. Delete files from the bucket
3. `cd s3-dynamodb-backend; terraform destroy`
