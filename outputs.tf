output "VPC_ID" {
  value = aws_vpc.vpc.id
}

output "CLUSTER_NAME" {
  value = var.ecs_cluster_name
}

output "SUBNET_ID" {
  value = aws_subnet.pub-subnet.id
}

output "SG_GROUP" {
  value = aws_security_group.sg_tasks.id
}

output "TASK_DEFINITION_NAME" {
  value = aws_ecs_task_definition.task_definition1.family
}