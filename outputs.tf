output "instance_id" {
  description = "The ID of the created EC2 instance (either spot or on-demand)"
  value       = coalesce(
    aws_spot_instance_request.spot_instance[0].spot_instance_id,
    aws_instance.on_demand_instance[0].id
  )
}
