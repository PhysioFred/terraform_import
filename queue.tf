# Create an HR department queue
resource "aws_connect_queue" "hr_department_queue" {
  instance_id           = aws_connect_instance.existing.id
  name                  = "hr_department_queue"
  description           = "HR department queue for human resources inquiries"
  hours_of_operation_id = aws_connect_hours_of_operation.twenty_four_seven.hours_of_operation_id
  max_contacts          = 10
  quick_connect_ids     = []  # Add quick connect IDs if needed
  status                = "ENABLED"

  outbound_caller_config {
    outbound_caller_id_name = "HR Department"
    # outbound_flow_id is optional and can be omitted if not needed
  }
}

# Create a service desk queue
resource "aws_connect_queue" "service_desk_queue" {
  instance_id           = aws_connect_instance.existing.id
  name                  = "service_desk_queue"
  description           = "Service desk queue for specialized support"
  hours_of_operation_id = aws_connect_hours_of_operation.twenty_four_seven.hours_of_operation_id
  max_contacts          = 5  # Lower concurrency for specialized support
  quick_connect_ids     = []
  status                = "ENABLED"

  outbound_caller_config {
    outbound_caller_id_name = "Service Desk"
    # outbound_flow_id is optional and can be omitted if not needed
  }
}
