# Bring up ISE interfaces
resource "aws_network_interface" "nic" {
  subnet_id       = var.privatesubnetaz1
  security_groups = [var.vpc_security_group_id]
}

#Bring up ISE instance
resource "aws_instance" "ise" {
  ami                  = var.iseami
  instance_type        = var.size
  key_name             = var.keyname

  
  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }
  tags = {
    Name = "Test"
  }
  ebs_block_device {
    volume_size = "700"
    device_name = "/dev/sda1"
  }
  lifecycle {
    ignore_changes = [root_block_device,ebs_block_device]
  }
  user_data = "${file("ise.txt")}"
}