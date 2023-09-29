variable "ec2_ami" {
  description = "Value of the AMI Id for the EC2 Instance"
  type        = string
  default     = "ami-03a6eaae9938c858c"
}

variable "ec2_name" {
  description = "Value of the Name for the EC2 Instance"
  type        = string
  default     = "JenkinsServer"
}