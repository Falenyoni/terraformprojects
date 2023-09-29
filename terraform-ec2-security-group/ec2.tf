resource "aws_instance" "jenkins-server" {
  ami = var.ec2_ami

  instance_type               = "t2.small"
  vpc_security_group_ids      = [aws_security_group.public_jenkins.id]
  associate_public_ip_address = true

  user_data = "${file("installjenkins.sh")}"

  tags = {
    "Name" : var.ec2_name
  }
}