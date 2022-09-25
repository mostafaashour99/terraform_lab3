data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.policy.json
}
data "aws_iam_policy_document" "policy_ses" {
   statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions = [
      "ses:SendEmail",
      "ses:SendRawEmail"
    ]

    resources = ["*"]
  }
   statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]

    resources = ["arn:aws:s3:::terraform-bucket-state01/*"]
  }
}
resource "aws_iam_policy" "policy_ses" {
  policy      = data.aws_iam_policy_document.policy_ses.json
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.policy_ses.arn
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "./main.py"
  output_path = "./python/main.py.zip"
}
resource "aws_lambda_function" "lambda" {
  function_name = "welcome"
  filename         = "./python/main.py.zip"
  role    = aws_iam_role.iam_for_lambda.arn
  handler = "main.lambda_handler"
  runtime = "python3.9"
}