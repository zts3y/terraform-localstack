
# Define the REST API
resource "aws_api_gateway_rest_api" "movies" {
  name        = "MoviesAPI"
  description = "Terraform MoviesAPI Example"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.movies.id
  parent_id   = aws_api_gateway_rest_api.movies.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = aws_api_gateway_rest_api.movies.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE"
}

# Add Lambda Integration
resource "aws_api_gateway_integration" "lambda" {
  rest_api_id   = aws_api_gateway_rest_api.movies.id
  resource_id = aws_api_gateway_method.proxy.resource_id
  http_method = aws_api_gateway_method.proxy.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.movies_api.invoke_arn
}


# Handle the and empty path on root resource
resource "aws_api_gateway_method" "proxy_root" {
  rest_api_id   = aws_api_gateway_rest_api.movies.id
  resource_id   = aws_api_gateway_rest_api.movies.root_resource_id
  http_method   = "ANY"
  authorization = "NONE"
}

# Add Lambda Integration
resource "aws_api_gateway_integration" "lambda_root" {
  rest_api_id = aws_api_gateway_rest_api.movies.id
  resource_id = aws_api_gateway_method.proxy_root.resource_id
  http_method = aws_api_gateway_method.proxy_root.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.movies_api.invoke_arn
}

# Create a deployment
resource "aws_api_gateway_deployment" "movies" {
  depends_on = [
    aws_api_gateway_integration.lambda,
    aws_api_gateway_integration.lambda_root,
  ]

  rest_api_id = aws_api_gateway_rest_api.movies.id
  stage_name  = "dev"
}