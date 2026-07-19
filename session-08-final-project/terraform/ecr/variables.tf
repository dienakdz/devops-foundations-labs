variable "aws_region" {
  description = "AWS region for ECR."
  type        = string
  default     = "ap-southeast-1"
}

variable "repository_name" {
  description = "ECR repository name."
  type        = string
  default     = "final-demo-api"
}

