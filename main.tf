# AWS provider and region
provider "aws" {
  region = var.aws_region
}

# Spot instance request resource
resource "aws_spot_instance_request" "spot_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  spot_price             = var.spot_price
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  
  # Set a deadline for the spot request
  valid_until = var.valid_until

  tags = {
    Name = "SpotInstance"
  }

  # Wait until the request is fulfilled or until the valid_until time
  wait_for_fulfillment = true

}

# On-demand instance resource
resource "aws_instance" "on_demand_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  # Create the on-demand instance only if the spot instance request was not fulfilled
  count = length(aws_spot_instance_request.spot_instance.spot_instance_id) == 0 ? 1 : 0

  tags = {
    Name = "OnDemandInstance"
  }

  # Ensure this resource waits for the spot instance request to be resolved
  depends_on = [aws_spot_instance_request.spot_instance]
}
