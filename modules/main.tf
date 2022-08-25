resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instant_tenancy = "default"
}

resource "aws_security_group" "bastion_sg" {
    name = "bastion_sg"
    vpc_id = aws_vpc.main.id
}

resource "aws_security_group_rule" "bastion_sg_ingress" {
    security_group_id = aws_security_group.bastion_sg.id

    type = "ingress"
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
}



