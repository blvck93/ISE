resource "aws_network_interface" "nic" {
  subnet_id       = var.privatesubnetaz1
  security_groups = [var.vpc_security_group_id]
}

resource "aws_instance" "isevm2" {
  ami                  = var.iseami
  instance_type        = var.size
  key_name             = var.keyname
  monitoring           = true
  ebs_optimized        = true
  iam_instance_profile = aws_iam_instance_profile.ciscoise.id
  user_data = "${file("ise.txt")}"

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }

  ebs_block_device {
    volume_size = "700"
    device_name = "/dev/sda1"
  }

  lifecycle {
    ignore_changes = [root_block_device,ebs_block_device]
  }

# metadata_options {
#   http_endpoint               = "enabled"
#   http_tokens                 = "required"
#   http_put_response_hop_limit = 1
#   instance_metadata_tags      = "enabled"
# }

  #  tags = var.tags

  #  lifecycle {
  #    prevent_destroy = true
  #  }
}