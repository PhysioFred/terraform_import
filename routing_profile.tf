# Create a basic routing profile for HR agents
resource "aws_connect_routing_profile" "hr_routing" {
  instance_id               = aws_connect_instance.existing.id
  name                      = "HRRoutingProfile"
  description               = "Routing profile for HR agents"
  default_outbound_queue_id = aws_connect_queue.hr_department_queue.queue_id
  
  # Media concurrency settings
  media_concurrencies {
    channel     = "VOICE"
    concurrency = 1
  }

  # Primary queue (HR Queue)
  queue_configs {
    channel  = "VOICE"
    delay    = 0
    priority = 1  # Highest priority for HR queue
    queue_id = aws_connect_queue.hr_department_queue.queue_id
  }
}

# Create a service desk routing profile
resource "aws_connect_routing_profile" "service_desk_routing" {
  instance_id               = aws_connect_instance.existing.id
  name                      = "ServiceDeskRoutingProfile"
  description               = "Routing profile for service desk agents"
  default_outbound_queue_id = aws_connect_queue.service_desk_queue.queue_id
  
  # Media concurrency settings
  media_concurrencies {
    channel     = "VOICE"
    concurrency = 1
  }

  # Primary queue (Service Desk)
  queue_configs {
    channel  = "VOICE"
    delay    = 0
    priority = 1  # Highest priority for service desk queue
    queue_id = aws_connect_queue.service_desk_queue.queue_id
  }
}

# Create a supervisor/admin routing profile with access to both HR and Service Desk queues
resource "aws_connect_routing_profile" "supervisor_routing" {
  instance_id               = aws_connect_instance.existing.id
  name                      = "supervisor_routing"
  description               = "Routing profile for supervisors and admins with access to all queues"
  default_outbound_queue_id = aws_connect_queue.hr_department_queue.queue_id
  
  # Media concurrency settings
  media_concurrencies {
    channel     = "VOICE"
    concurrency = 1
  }

  # Primary queue (HR Queue)
  queue_configs {
    channel  = "VOICE"
    delay    = 0
    priority = 2
    queue_id = aws_connect_queue.hr_department_queue.queue_id
  }

  # Secondary queue (Service Desk Queue)
  queue_configs {
    channel  = "VOICE"
    delay    = 0
    priority = 1
    queue_id = aws_connect_queue.service_desk_queue.queue_id
  }
}
