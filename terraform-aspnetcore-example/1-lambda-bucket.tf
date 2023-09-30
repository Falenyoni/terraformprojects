resource "random_pet" "lambda_bucket_name" {
  prefix = "lambda-aspnetcore"
  length = 2

}

## Create S3 Bucket to upload Function To
resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = random_pet.lambda_bucket_name.id
  force_destroy = true
}

## Block all public access to this bucket, this is my default setting
resource "aws_s3_bucket_public_access_block" "lambda_bucket_aspnetcore" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}