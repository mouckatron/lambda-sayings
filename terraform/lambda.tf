
resource "aws_lambda_function" "sayings" {
  function_name = "get-saying"
  s3_bucket = "${var.lambda_s3bucket}"
  s3_key = "get-saying/get-saying.zip"

  handler = "get-saying"
  runtime = "go1.x"

  role = "${aws_iam_role.sayings.arn}"
}

resource "aws_lambda_permission" "sayings" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.sayings.arn}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_deployment.sayings.execution_arn}*/*"
}
