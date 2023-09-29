## Public Security Group##
resource "aws_security_group" "public_jenkins" {
  name        = "jenkins-public-sg"
  description = "Public intenet access"
  vpc_id      = "vpc-09ae9730d3a64b2fd"
  tags = {
    Name        = "jenkins-public-sg"
    Role        = "public"
    Project     = "Jenkins"
    Environment = "Dev"
    ManagedBy   = "terraform"
  }
}

resource "aws_security_group_rule" "public_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.public_jenkins.id
}

resource "aws_security_group_rule" "public_in_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.public_jenkins.id
}

resource "aws_security_group_rule" "public_in_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.public_jenkins.id
}

resource "aws_security_group_rule" "public_in_jenkins" {
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.public_jenkins.id
}