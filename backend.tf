terraform {
  backend "s3" {
    encrypt        = "true"
    bucket         = "terraform-remote-state-bucket-altschool"
    #dynamodb_table = "kennethkafeero-terraform-remote-state-lock"
    key            = "tfstate"
    region         = "us-east-1"
  }
}

