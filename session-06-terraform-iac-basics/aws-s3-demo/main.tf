resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name

  tags = {
    Project = "devops-foundations-practice"
    Owner   = "learning"
  }
}

resource "aws_s3_bucket_public_access_block" "demo" {
  bucket = aws_s3_bucket.demo.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

