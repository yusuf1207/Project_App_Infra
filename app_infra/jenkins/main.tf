module "ec2_module" {
  source                      = "github.com/yusuf1207/Project_Modules//modules/ec2_module"
  ami_id                      = "ami-0d50e5e845c552faf"
  instance_type               = "t2.medium"
  key_name                    = "mackey"
  subnet_id                   = "subnet-0ab2fb103e79db61b"
  aws_security_group_id       = ["sg-0e14f59a31df8d27a"]
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  associate_public_ip_address = true
  tags = {
    Name = "Jenkins"
  }
}

resource "aws_eip" "jenkins_eip" {
  instance = "i-0b14f02f92cbc3bb7"
  vpc      = true
}

resource "aws_eip_association" "jenkins_eip_association" {
  instance_id   = "i-0b14f02f92cbc3bb7"
  allocation_id = aws_eip.jenkins_eip.id
}
########## Instance_Profile ##############
resource "aws_iam_instance_profile" "instance_profile" {
  name = "EC2InstanceProfile"
  role = aws_iam_role.instance_profile_role.name
}
resource "aws_iam_role" "instance_profile_role" {
  name = "EC2InstanceProfileRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}