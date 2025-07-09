resource "aws_iam_role" "ciscoise" {
  name = "ciscoiseiamrole-09072025"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Sid = ""
      }
    ]
  })
  #  tags = var.tags
}

resource "aws_iam_role_policy" "cisco-ise-iam_role_policy" {
  name   = "fgthaiamrolepolicy-09072025"
  role   = aws_iam_role.ciscoise.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
   {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*",
        "ec2:AssociateAddress",
        "ec2:AssignPrivateIpAddresses",
        "ec2:UnassignPrivateIpAddresses",
        "ec2:ReplaceRoute"
        ],
      "Resource": "*"
   }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ciscoise" {
  name = "ciscoiseprofile-09072025"

  role = aws_iam_role.ciscoise.name
  #  tags = var.tags
}