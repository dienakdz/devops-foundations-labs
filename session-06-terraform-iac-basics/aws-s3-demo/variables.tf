variable "aws_region" {
  description = "AWS region for this lab."
  type        = string
  default     = "ap-southeast-1"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name. Change this before apply."
  type        = string
}

