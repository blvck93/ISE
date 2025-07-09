resource "aws_instance" "isevm1" {
  ami           = var.iseami
  instance_type = var.size
  subnet_id     = var.privatesubnetaz1
  key_name      = "ise-key"
  #   private_ip           = var.iseport1ip[0] # Assign static private IP
  monitoring           = true
  ebs_optimized        = true
  iam_instance_profile = aws_iam_instance_profile.ciscoise.id
  user_data_base64     = base64encode("hostname=${var.ise_vm1_hostname}\nprimarynameserver=${var.ise_dns_server}\ndnsdomain=${var.ise_domain}\nntpserver=${var.ise_ntp_server}\ntimezone=${var.ise_timezone}\nusername=${var.ise_username}\npassword=${var.ise_password}")

  root_block_device {
    delete_on_termination = true
    volume_size           = 500
    volume_type           = "gp3"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  vpc_security_group_ids      = [var.vpc_security_group_id]
  associate_public_ip_address = false

  tags = var.tags

  #  lifecycle {
  #    prevent_destroy = true
  #  }
}