resource "aws_instance" "isevm2" {
  ami                         = var.iseami[var.region]
  instance_type               = var.size
  key_name                    = var.keyname
  monitoring                  = true
  ebs_optimized               = true
  iam_instance_profile        = aws_iam_instance_profile.ciscoise.id
  associate_public_ip_address = false
  vpc_security_group_ids      = [var.vpc_security_group_id]
  subnet_id                   = var.privatesubnetaz1

  root_block_device {
    delete_on_termination = true
    volume_size           = 500
    volume_type           = "gp3"
  }

  lifecycle {
    ignore_changes  = [root_block_device, ebs_block_device]
    prevent_destroy = true
  }

  metadata_options {
    http_endpoint = "enabled"
    #   http_tokens                 = "required"
    #   http_put_response_hop_limit = 1
    instance_metadata_tags = "enabled"
  }
  user_data = file("ise.conf")

  tags = var.tags
}