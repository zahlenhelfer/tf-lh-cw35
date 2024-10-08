variable "ami" {
  type        = string
  description = "value of the AMI"
  default     = "ami-0de02246788e4a354"
  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "Image-id value must be a valid ami id, does it start with 'ami-'?"
  }
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-central-1"
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

variable "server_build" {
  type        = bool
  default     = false
  description = "soll eim Datenbankserver erstellt werden"
}

variable "ports" {
  type = map(any)
  default = {
    "http" = {
      port        = 80,
      to_port     = 80,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
    }
    "ssh access" = {
      port        = 22,
      to_port     = 22,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
    }
    "https" = {
      port        = 443,
      to_port     = 443,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
    }
  }
}

variable "common_tags" {
  type = map(string)
  default = {
    Department  = "Global Infrastructure Services"
    Team        = "EMEA Delivery"
    CostCenter  = "12345"
    Application = "Intranet-Portal"
    Environment = "Production"
  }
}

variable "s3bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
  default     = "mro-4711"
}
