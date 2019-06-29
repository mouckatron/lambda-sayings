
resource "aws_lambda_function" "sayings" {
  function_name = "get-saying"
  s3_bucket = "${var.lambda_s3bucket}"
  s3_key = "get-saying/get-saying.zip"

  handler = "getSaying"
  runtime = "go1.x"

  role = "${aws_iam_role.sayings.arn}"
}
