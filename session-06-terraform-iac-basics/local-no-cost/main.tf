terraform {
  required_version = ">= 1.6.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "practice_note" {
  filename = "${path.module}/generated-note.txt"
  content  = "Created by Terraform. Change this text, run plan, then apply again.\n"
}

