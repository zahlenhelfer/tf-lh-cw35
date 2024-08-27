variable "ami" {
  type        = string
  description = "value of the AMI"
  default     = "ami-0de02246788e4a354"
  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "Image-id value must be a valid ami id, does it start with 'ami-'?"
  }
}

variable "instance_type" {
  type        = string
  description = "type of the instance (example: t2.micro, t4g.micro)"
}

variable "app_server_count" {
  type        = number
  description = "number of app servers to create"
  default     = 3
  validation {
    condition     = var.app_server_count > 0
    error_message = "App server count must be greater than 0"
  }
}
