
resource "aws_lambda_function" "movies_api" {
  function_name = "movies_api"
  filename      = "./files/moviesapi.zip"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = "fake_role"
  timeout       = 5
  memory_size   = 128
  layers = []
  tags = {}  
}

# Give it permissions for API Gateway to talk to Lambda
resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.movies_api.function_name
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_rest_api.movies.execution_arn}/*/*"
}