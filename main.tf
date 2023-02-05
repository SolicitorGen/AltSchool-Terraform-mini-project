provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
        project = "Altschool Project"
    }
  }
  version = "4.52.0"
}


