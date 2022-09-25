resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::terraform-bucket-state01"
}


resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "terraform-bucket-state01"

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda.arn
    
  events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}