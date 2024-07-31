variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-west-2" # AWS region
}

variable "instance_type" {
  description = "The type of instance to create"
  default     = "t3.micro" # instance type
}

variable "ami_id" {
  description = "The ID of the AMI to use"
  default     = "" # AMI ID
}

variable "spot_price" {
  description = "The maximum price per hour you're willing to pay for a spot instance"
  default     = "0.03" #  according to budget and market prices
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  default     = "" #  key pair name 
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  default     = "" #  subnet ID
}

variable "security_group_ids" {
  description = "The IDs of the security groups to associate with the instance"
  type        = list(string)
  default     = [""] #  security group IDs
}

variable "valid_until" {
  description = "The time until which the spot instance request is valid"
  default     =  ""  # Set this to an appropriate future time
}