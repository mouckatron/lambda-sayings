
resource "aws_dynamodb_table" "sayings" {
  name           = "sayings"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"
  }
}
