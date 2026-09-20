# main.tf

# Configure AWS provider
provider "aws" {
  region = "ap-southeast-1"   # Change if you want another region
}

# DynamoDB table definition
resource "aws_dynamodb_table" "habits" {
  name           = "Habits"
  billing_mode   = "PAY_PER_REQUEST"   # No need to manage capacity
  hash_key       = "user_id"           # Partition key
  range_key      = "habit_id"          # Sort key

  attribute {
    name = "user_id"
    type = "S"
  }

  attribute {
    name = "habit_id"
    type = "S"
  }

  tags = {
    Project = "HabitTracker"
    Env     = "dev"
  }
}
