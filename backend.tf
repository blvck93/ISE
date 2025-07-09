terraform {
  backend "s3" {
    bucket = "terraformstatebucket999930uk"
    key    = "terraform/state"
    region = "eu-west-2"  # Specify your AWS region
  }
}