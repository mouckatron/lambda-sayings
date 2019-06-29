
resource "aws_api_gateway_rest_api" "sayings" {
  name = "lambda-sayings-api"
}

resource "aws_api_gateway_resource" "sayings" {
  rest_api_id = "${aws_api_gateway_rest_api.sayings.id}"
  parent_id   = "${aws_api_gateway_rest_api.sayings.root_resource_id}"
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "sayings" {
  rest_api_id   = "${aws_api_gateway_rest_api.sayings.id}"
  resource_id   = "${aws_api_gateway_resource.sayings.id}"
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "sayings_root" {
  rest_api_id   = "${aws_api_gateway_rest_api.sayings.id}"
  resource_id   = "${aws_api_gateway_rest_api.sayings.root_resource_id}"
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "sayings" {
  rest_api_id = "${aws_api_gateway_rest_api.sayings.id}"
  resource_id = "${aws_api_gateway_method.sayings.resource_id}"
  http_method = "${aws_api_gateway_method.sayings.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.sayings.invoke_arn}"
}

resource "aws_api_gateway_integration" "sayings_root" {
  rest_api_id = "${aws_api_gateway_rest_api.sayings.id}"
  resource_id = "${aws_api_gateway_method.sayings_root.resource_id}"
  http_method = "${aws_api_gateway_method.sayings_root.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.sayings.invoke_arn}"
}


resource "aws_api_gateway_deployment" "sayings" {
  depends_on = [
    "aws_api_gateway_integration.sayings",
    "aws_api_gateway_integration.sayings_root",
  ]

  rest_api_id = "${aws_api_gateway_rest_api.sayings.id}"
}

output "base_url" {
  value = "${aws_api_gateway_deployment.sayings.invoke_url}"
}
