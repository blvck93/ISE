variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "uk_region" {
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
  default = "172.31.0.2"
}

variable "ise_domain" {
  type    = string
  default = "example.com"
}
variable "ise_ntp_server" {
  type    = string
  default = "time.nist.gov"
}

variable "ise_timezone" {
  type    = string
  default = "CET"
}

variable "ise_username" {
  type    = string
  default = "admin"
}

variable "ise_password" {
  type    = string
  default = "Cisco1234"
}

variable "iseami" {
  type    = string
  default = "ami-00e0b109d715904ad"
}

variable "size" {
  type    = string
  default = "c5.4xlarge"
}

variable "privatesubnetaz1" {
  type    = string
  default = "subnet-1157c35d"
}

variable "vpc_security_group_id" {
  type    = string
  default = "sg-0668c08342ab19cb7"
}

variable "tags" {
  type = any
  default = {
    "environment" = "dev",
    "application" = "ise"
  }
}

variable "keyname" {
  type    = string
  default = "ise-key"
}