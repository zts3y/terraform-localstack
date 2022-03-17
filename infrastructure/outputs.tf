output "function_name" {
  description = "Name of the Lambda function."

  value = aws_lambda_function.movies_api.function_name
}

output "Lambda_Base_URL" {
  value = "https://${aws_api_gateway_rest_api.movies.id}.execute-api.localhost.localstack.cloud:4566/dev/"
}
#https://0a7kbil37e.execute-api.localhost.localstack.cloud:4566/dev/healthcheck
# awslocal apigateway test-invoke-method --rest-api-id 0a7kbil37e --resource-id 1tgnwdfydv --http-method GET --path-with-query-string '/'
