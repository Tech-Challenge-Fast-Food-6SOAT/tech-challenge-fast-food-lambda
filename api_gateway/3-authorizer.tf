data "aws_lambda_function" "authorizer" {
  function_name = "fast_food_authorizer"
}

output "name" {
  value = data.aws_lambda_function.authorizer.invoke_arn
}

resource "aws_api_gateway_authorizer" "l_authorizer" {
  name                             = "l_authorizer"
  rest_api_id                      = aws_api_gateway_rest_api.main.id
  authorizer_uri                   = data.aws_lambda_function.authorizer.invoke_arn
  authorizer_credentials           = var.role_arn
  type                             = "REQUEST"
  identity_source                  = "method.request.header.authentication"
  authorizer_result_ttl_in_seconds = 0

  depends_on = [aws_api_gateway_rest_api.main]
}
