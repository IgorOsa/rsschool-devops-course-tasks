resource "aws_dynamodb_table" "tfstate_table" {
  name = "rss-devops-tf-lockid"

  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key = "LockID"
}

resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "rss-devops-tfstate"

  tags = var.tags
}

# resource "aws_s3_bucket_versioning" "tfstate_bucket_versioning" {
#   bucket = "rss-devops-tfstate"

#   versioning_configuration {
#     status     = "Enabled"
#     mfa_delete = "Disabled"
#   }
# }

resource "aws_s3_bucket_public_access_block" "tfstate_bucket_public_access_block" {
  bucket = aws_s3_bucket.tfstate_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "tfstate_bucket_policy" {
  bucket = "rss-devops-tfstate"

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "tfstatebucketpolicy"
    Statement = [
      {
        Sid       = "HTTPSOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.tfstate_bucket.arn,
          "${aws_s3_bucket.tfstate_bucket.arn}/*",
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      },
    ]
  })
}
