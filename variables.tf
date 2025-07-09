variable "region" {
  type    = string
  default = "us-east-1"
}

variable "eu_region" {
  type    = string
  default = "eu-west-2"
}

variable "us_region" {
  type    = string
  default = "us-east-1"
}

variable "ise_vm1_hostname" {
  type    = string
  default = "test-ise"
}

variable "ise_dns_server" {
  type    = string
  default = "169.254.169.253"
}

variable "ise_domain" {
  type    = string
  default = "example.com"
}
variable "ise_ntp_server" {
  type    = string
  default = "169.254.169.123"
}

variable "ise_timezone" {
  type    = string
  default = "CET"
}

variable "ise_username" {
  type    = string
  default = "iseadmin"
}

variable "ise_password" {
  type    = string
  default = "Cisco1234"
}

variable "iseami" {
  type    = string
  default = "ami-07946ba1cee1ca94a"
}

variable "size" {
  type    = string
  default = "c5.4xlarge"
}

variable "privatesubnetaz1" {
  type    = string
  default = "subnet-05b39f44434b0ea16"
}

variable "vpc_security_group_id" {
  type    = string
  default = "sg-013515ed8ce76d893"
}

variable "tags" {
  type    = any
  default = "Terraform"
}

variable "keyname" {
  type    = string
  default = "ise-key-us"
}