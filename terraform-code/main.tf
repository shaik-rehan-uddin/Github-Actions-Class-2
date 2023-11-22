provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  subnet_id     = "subnet-007567bcb4c0bd7a9"
  key_name      = "EC2_instance"

  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  user_data              = file("installer.sh")


  tags = {
    Name = "web-server-instance"
  }

  associate_public_ip_address = true
}

resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Example security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "security_group_id" {
  value = aws_security_group.web_server_sg.id
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}
