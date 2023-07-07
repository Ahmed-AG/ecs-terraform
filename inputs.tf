variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default = "ECS_VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "192.168.0.0/24" 
}

variable "ecr_name" {
  type        = string
  description = "Name of the ECR repo"
  default     = "ecr_repo" 
}

variable "ecs_cluster_name" {
  type        = string
  description = "Name of the ECS Cluster"
  default     = "Cluster1" 
}

variable "ecs_task_name" {
  type        = string
  description = "Name of the ECS Cluster"
  default     = "Task-terraform-1" 
}

#variable "notification_emails" {
#  type        = list(any)
#  description = "Email addresses for pipeline notifications"
#}
