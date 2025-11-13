# Create an admin user
resource "aws_connect_user" "admin_user" {
  instance_id = aws_connect_instance.existing.id
  name        = "freddejrangsi"
  
  identity_info {
    first_name = "Admin"
    last_name  = "User"
    email      = "admin@example.com"
  }
  
  phone_config {
    after_contact_work_time_limit = 0
    phone_type = "SOFT_PHONE"
  }
  
  routing_profile_id = aws_connect_routing_profile.supervisor_routing.routing_profile_id
  security_profile_ids = [data.aws_connect_security_profile.admin.security_profile_id]  # Admin security profile
  password = var.pass # In production, use a secure method for password management
}

# Create a supervisor user
resource "aws_connect_user" "supervisor" {
  instance_id = aws_connect_instance.existing.id
  name        = "supervisor_user"
  
  identity_info {
    first_name = "Supervisor"
    last_name  = "User"
    email      = "supervisor@example.com"
  }
  
  phone_config {
    after_contact_work_time_limit = 0
    phone_type = "SOFT_PHONE"
  }
  
  routing_profile_id = aws_connect_routing_profile.supervisor_routing.routing_profile_id
  security_profile_ids = [data.aws_connect_security_profile.call_center_manager.security_profile_id]  # Call Center Manager security profile
  password = var.pass  # In production, use a secure method for password management
  # hierarchy_group_id is optional and can be set later if needed
}

# Create first call agent (Service Desk Agent)
resource "aws_connect_user" "agent1" {
  instance_id = aws_connect_instance.existing.id
  name        = "ServiceDeskAgent"
  phone_config {
    after_contact_work_time_limit = 0
    phone_type = "SOFT_PHONE"
  }
  routing_profile_id = aws_connect_routing_profile.service_desk_routing.routing_profile_id
  security_profile_ids = [data.aws_connect_security_profile.agent.security_profile_id]  # Agent security profile
  password = var.pass  # In production, use a secure method for password management
  
  identity_info {
    first_name = "Service"
    last_name  = "Agent 1"
    email      = "agent1@example.com"
  }
}

# Create second call agent (HR Agent)
resource "aws_connect_user" "agent2" {
  instance_id = aws_connect_instance.existing.id
  name        = "HrAgent"
  phone_config {
    after_contact_work_time_limit = 0
    phone_type = "SOFT_PHONE"
  }
  routing_profile_id = aws_connect_routing_profile.hr_routing.routing_profile_id
  security_profile_ids = [data.aws_connect_security_profile.agent.security_profile_id]  # Agent security profile
  password = var.pass  # In production, use a secure method for password management
  
  identity_info {
    first_name = "HR"
    last_name  = "Agent 2"
    email      = "agent2@example.com"
  }
}
