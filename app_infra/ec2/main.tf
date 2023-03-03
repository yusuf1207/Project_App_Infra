module "ec2_module" {
  source                      = "github.com/yusuf1207/Project_Modules//modules/ec2_module"
  ami_id                      = data.aws_ami.amazon_linux_2.image_id
  instance_type               = "t2.micro"
  key_name                    = "mackey"
  subnet_id                   = "subnet-0ab2fb103e79db61b"
  aws_security_group_id       = ["sg-039f5dcd7d53d3ee5"]
  iam_instance_profile = false
  associate_public_ip_address = true
  tags = {
    Name = "Main"
  }
}