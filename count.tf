provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myawsserver" {
  ami = "ami-02e136e904f3da870"
  instance_type = "t2.nano"
  key_name = "test1"
  count = 2
  tags = {
    Name = "Sana-aws-ec2-instance.${count.index}"
    env = "test"
  }
}

output "Private-IP-0" {
 value = aws_instance.myawsserver.0.private_ip
}

output "Private-IP-1" {
 value = aws_instance.myawsserver.1.private_ip
}

