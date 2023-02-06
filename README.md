# nuvolar

## Create infrastructure

1. set AWS Credentials at `~/.aws/credentials`
2. `cd s3-dynamodb-backend; terraform init; terraform apply`
2. `cd eks; terraform init; terraform apply`


## Clean up

1. `cd eks; terraform destroy`
2. `cd s3-dynamodb-backend; terraform destroy`
