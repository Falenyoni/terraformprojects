## Terraform AWS Lambda

## What I need to create in the main.tf file
1. aws_iam_role
2. aws_iam_policy
3. aws_iam_role_policy_attachment
4. data "archive"
5. aws_lambda_function

>Always make sure you configure your proviver with the LocalStack urls if you are testing on local
```
    provider "aws" {
    region = "us-east-1"
    #The below is not require if AWS CLI is configured
    #shared_credentials_files = [ "/home/bongani/.aws/credentials" ]

    ## Use below if using localstake
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true

        endpoints {    
        iam            = "http://localhost:4566"   
        lambda         = "http://localhost:4566"
    }
    }
 ```

* Invoke the created lambda in AWS
>aws lambda invoke --region=us-east-1 --function-name=BNyoni-Lambda-Function --cli-binary-format raw-in-base64-out --payload '{"key1":"Test From Command Line"}' response.json

* Invoke the created lambda in LocalStack
 >aws --endpoint-url=http://localhost:4566 lambda invoke --region=us-east-1 --function-name=BNyoni-Lambda-Function --cli-binary-format raw-in-base64-out --payload '{"key1":"Test LocalStack Code"}' response.json