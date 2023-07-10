resource "aws_ecr_repository" "ecr_repo" {
  name                  = var.ecr_name
  image_tag_mutability  = "MUTABLE"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name

  tags = {
    Name = "${var.ecs_cluster_name}"
  }
}

resource "aws_ecs_task_definition" "task_definition1" {
  family                   = var.ecs_task_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = file("task-definitions/service.json")

}

# Not needed!
#resource "aws_ecs_service" "service1" {
#  name            = "Service1-terraform"
#  cluster         = aws_ecs_cluster.ecs_cluster.id
#  task_definition = aws_ecs_task_definition.task_definition1.arn
#  desired_count   = 0
#  launch_type     = "FARGATE"
  
#  network_configuration {
#    subnets           = [aws_subnet.pub-subnet.id]
#    assign_public_ip  = true
#    security_groups   = [aws_security_group.sg_tasks.id]
#  }
#}