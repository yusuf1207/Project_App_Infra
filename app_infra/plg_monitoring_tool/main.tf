module "ec2_module" {
  source                      = "github.com/yusuf1207/Project_Modules//modules/ec2_module"
  ami_id                      = "ami-0d50e5e845c552faf"
  instance_type               = "t2.micro"
  key_name                    = "mackey"
  subnet_id                   = "subnet-0ab2fb103e79db61b"
  aws_security_group_id       = ["sg-00cbd61bd01bc4e02"]
  iam_instance_profile        = ""
  associate_public_ip_address = true
  tags = {
    Name = "Plg"
  }
}