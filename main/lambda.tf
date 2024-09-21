data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/../lambda"
  output_path = "${path.module}/lambda_zip/fast_food_authorizer.zip"
}

resource "aws_lambda_function" "fast_food_authorizer" {
  filename      = "${path.module}/lambda_zip/fast_food_authorizer.zip"
  function_name = "fast_food_authorizer"
  role          = var.role_arn
  handler       = "index.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs20.x"

  environment {
    variables = {
      CLIENT_ID    = var.clientId,
      USER_POOL_ID = var.userPoolId,
    }
  }

  depends_on = [data.archive_file.lambda]
}
