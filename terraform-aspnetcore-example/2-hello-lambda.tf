
## Create Lambda role, Lambda woul require access to other AWS services such as CloudWatch to write logs
## In this case we will grant access to the S# bucket to read a file.
## Create IAM Role and Allow Lambdas to use it.
resource "aws_iam_role" "aspnetcore_lambda_exec" {
  name = "lambdaapidemo-lambda"

  assume_role_policy = jsonencode(
    { "Version" : "2012-10-17", "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
      ]
  })
}

## Attach Policies to the roll. At bare minimum, we need a standard AWSLambdaBasicExecutionRole
resource "aws_iam_role_policy_attachment" "lambdaapidemo_lambda_policy" {
  role       = aws_iam_role.aspnetcore_lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "LambdaAPIDemo" {
  function_name = "LambdaAPIDemo"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.lambda_aspnetcore.key

  runtime = "dotnet6"
  handler = "LambdaAPIDemo"

  source_code_hash = data.archive_file.lambda_aspnetcore.output_base64sha256

  role = aws_iam_role.aspnetcore_lambda_exec.arn

  environment {
    variables = {
      ASPNETCORE_ENVIRONMENT = "Development"
    }    
  }
}

resource "aws_cloudwatch_log_group" "LambdaAPIDemo" {
  name = "/aws/lambda/${aws_lambda_function.LambdaAPIDemo.function_name}"

  retention_in_days = 14
}

data "archive_file" "lambda_aspnetcore" {
  type = "zip"

  source_dir  = "${path.module}/LambdaAPIDemo/LambdaAPIDemo/bin/Release/net6.0/linux-x64/publish"
  output_path = "${path.module}/LambdaAPIDemo.zip"
}

resource "aws_s3_object" "lambda_aspnetcore" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "LambdaAPIDemo.zip"
  source = data.archive_file.lambda_aspnetcore.output_path

  etag = filemd5(data.archive_file.lambda_aspnetcore.output_path)
}

resource "aws_lambda_function_url" "test_latest" {
  function_name      = aws_lambda_function.LambdaAPIDemo.function_name
  authorization_type = "NONE"
}