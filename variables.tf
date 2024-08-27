variable "ami" {
  type        = string
  description = "value of the AMI"
  default     = "ami-0de02246788e4a354"
}

variable "instance_type" {
  type        = string
  description = "type of the instance (example: t2.micro, t4g.micro)"
}
