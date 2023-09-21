## KEY NOTES

## When you create Lambda without Terraform, you can use
* Zip Archive
* Docker Images
* Or even write code directly in AWS Console

## When you create Lambda with terraform we typically use
* Zip Archive

The Workflow is the following
1. Build your Function with all dependencies, 
2. Package it in a Zip Archive
3. Upload it to an S3 bucket
4. When we create Lambda in Terraform and Point to the S3 zip

## Testing the API GATEWAY
# GET METHOD
* curl "https://8inqh7m8dk.execute-api.us-east-1.amazonaws.com/dev/hello?Name=Bongani"  

# POST METHOD
* curl -X POST -H "Content-Type: application/json" -d '{"name":"Bongani"}' "https://8inqh7m8dk.execute-api.us-east-1.amazonaws.com/dev/hello" 

aws lambda invoke --region=us-east-1 --function-name=s3 --cli-binary-format raw-in-base64-out --payload '{"bucket":"","object":"hello.json"}"

