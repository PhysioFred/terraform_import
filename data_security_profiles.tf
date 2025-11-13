# Data sources for existing AWS Connect security profiles

data "aws_connect_security_profile" "admin" {
  instance_id = aws_connect_instance.existing.id
  name        = "Admin"
}

data "aws_connect_security_profile" "call_center_manager" {
  instance_id = aws_connect_instance.existing.id
  name        = "CallCenterManager"
}

data "aws_connect_security_profile" "agent" {
  instance_id = aws_connect_instance.existing.id
  name        = "Agent"
}
