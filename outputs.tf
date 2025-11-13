# Output the user IDs for reference
output "admin_user_id" {
  value = aws_connect_user.admin_user.id
}

output "supervisor_user_id" {
  value = aws_connect_user.supervisor.id
}

output "agent_ids" {
  value = [
    aws_connect_user.agent1.id,
    aws_connect_user.agent2.id
  ]
}

# Output the queue IDs
output "hr_queue_id" {
  value = aws_connect_queue.hr_department_queue.queue_id
}

output "service_desk_queue_id" {
  value = aws_connect_queue.service_desk_queue.queue_id
}

# Output the routing profile IDs
output "hr_routing_profile_id" {
  value = aws_connect_routing_profile.hr_routing.routing_profile_id
}

output "service_desk_routing_profile_id" {
  value = aws_connect_routing_profile.service_desk_routing.routing_profile_id
}

# Output the hours of operation ID
output "hours_of_operation_id" {
  value = aws_connect_hours_of_operation.twenty_four_seven.hours_of_operation_id
}
