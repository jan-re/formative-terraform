variable "ec2_instance_type" {
  type        = string
  description = "Type of the EC2 instance"
  # We're enforcing a single option via validation so a default doesn't make sense.
  # default = "t3.micro"
  nullable = false

  validation {
    # Obviously it doesn't really make sense to have a variable for a single possible value.
    condition     = var.ec2_instance_type == "t3.micro"
    error_message = "Only \"t3.micro\" instances are supported."
  }
}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  description = "The size and type of the root block volume for EC2 instances."
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}
