data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["self"]
  filter {
    name      = "name"
    values    = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name      = "virtualization-type"
    values    = [ "hvm" ]
  }

  owners = ["099720109477"] #canonical
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"

  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
 
  tags = {
    Name = "bastion"
  }
 
}
