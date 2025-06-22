provider "aws" {
  region = "eu-west-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "devops-key"
  public_key = file("/Users/sever/.ssh/id_rsa.pub")  # This uses your local SSH public key
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins Web UI"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # (for now, allow your IP later for security)
  }

  ingress {
    description = "Jenkins UI"
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "jenkins_server" {
  ami           = "ami-051fd0ca694aa2379"  # Ubuntu 22.04 in London (eu-west-2)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.jenkins_sg.name]

  tags = {
    Name = "JenkinsServer"
  }
}
