# resource "aws_lambda_permission" "allow_bucket" {
#   statement_id  = "AllowExecutionFromS3Bucket"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.lambda.arn
#   principal     = "s3.amazonaws.com"
#   source_arn    = 
# }

# # resource "aws_s3_bucket" "bucket" {
# #   bucket = "terraform-bucket-state01"
# # }

# # resource "aws_s3_funcbucket_notification" "bucket_notification" {
# #   bucket = aws_s3_bucket.bucket.id

# #   lambda_function {
# #     lambda_function_arn = aws_lambda_function.func.arn
# #     events              = ["s3:ObjectCreated:*"]
# #     filter_prefix       = "AWSLogs/"
# #     filter_suffix       = ".log"
# #   }

# #   depends_on = [aws_lambda_permission.allow_bucket]
# # }