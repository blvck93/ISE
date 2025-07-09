resource "aws_network_interface" "nic" {
  subnet_id       = var.privatesubnetaz1
  security_groups = [var.vpc_security_group_id]
}

resource "aws_instance" "isevm1" {
  ami                  = var.iseami
  instance_type        = var.size
  key_name             = var.keyname
  monitoring           = true
  ebs_optimized        = true
  iam_instance_profile = aws_iam_instance_profile.ciscoise.id
  user_data_base64     = base64encode("hostname=${var.ise_vm1_hostname}\nprimarynameserver=${var.ise_dns_server}\ndnsdomain=${var.ise_domain}\nntpserver=${var.ise_ntp_server}\ntimezone=${var.ise_timezone}\nusername=${var.ise_username}\npassword=${var.ise_password}")

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }
  
  root_block_device {
    delete_on_termination = true
    volume_size           = 700
    volume_type           = "gp3"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  #  tags = var.tags

  #  lifecycle {
  #    prevent_destroy = true
  #  }
}