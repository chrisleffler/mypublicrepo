resource "aws_ecs_task_definition" "datadog_monitored" {
  family = "datadog_monitored"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${var.task_execution_arn}"
  container_definitions = jsonencode([
    {
      name      = "datadog-agent"
      image     = "public.ecr.aws/datadog/agent:latest"
      cpu       = 256
      memory    = 512
      essential = true
      
      portMappings = [
        {
          containerPort = 8126
          protocol = "tcp"
          
        },
        {
          containerPort = 8125
          protocol = "udp"
        }
      ]
      ### API Key can be passed through secret manager
      # secrets = [
      #   {
      #     name = "DD_API_KEY"
      #     valueFrom = "${var.datadog_api_key_arn}"
      #   }
      # ]
      environment = [
        {
          name = "DD_SITE"
          value = "datadoghq.com"
        },
        {
          name = "DD_API_KEY"
          value = "${var.datadog_api_key}"
        },
        {
          name = "ECS_FARGATE"
          value = "true"
        },
        {
          name = "DD_APM_ENABLED"
          value = "true"
        },
        {
          name = "DD_APM_REPLACE_TAGS"
          value = jsonencode([{"name"= "resource.name", "pattern"= "get_/plan/[0-9]+/[A-Za-z][0-9]+/[0-9]+/[0-9]+", "repl"= "get_/plan/{year}/{contract_id}/{plan_id}/{segment_id}"}])
        }
      ]
    }//,
    ### Definition for your service container(s)
    # {
    #   name      = "first"
    #   image     = "service-first"
    #   cpu       = 10
    #   memory    = 512
    #   essential = true
    #   portMappings = [
    #     {
    #       containerPort = 80
    #       hostPort      = 80
    #     }
    #   ]
    # }
  ])

}