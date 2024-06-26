data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "rancher-ec2" {
  ami           = data.aws_ami.ubutu.id
  instance_type = "t3.medium"
  subnet_id= var.subnet_id
  tags = {
    Name = "rancher-server"
  }
}