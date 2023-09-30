# 1. Create Elastic Container Registry (ECR)
resource "aws_ecr_repository" "repo" {
  name                 = "demo"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

# 2. Create Elastic Container Service (ECS) Cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = "my_cluster"
}

# 3. Create Task Definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family = "demo"

  container_definitions = jsonencode([
    {
      name      = "demo"
      image     = "162268681047.dkr.ecr.ap-southeast-2.amazonaws.com/demo"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

  requires_compatibilities = ["FARGATE"]

  cpu                = "256"
  memory             = "512"
  network_mode       = "awsvpc"
  task_role_arn      = "arn:aws:iam::162268681047:role/ecsTaskExecutionRole"
  execution_role_arn = "arn:aws:iam::162268681047:role/ecsTaskExecutionRole"


}

# 4. Create Service
resource "aws_ecs_service" "service" {
  name = "my_service"

  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn

  desired_count = 1
  launch_type   = "FARGATE"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.allow_traffic.id]
    subnets          = [aws_subnet.main.id]
  }

}