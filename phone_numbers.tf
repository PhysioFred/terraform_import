# Request a phone number for your Amazon Connect instance
resource "aws_connect_phone_number" "main_number" {
  target_arn    = aws_connect_instance.existing.arn
  country_code  = "AU"  # Australia
  type          = "DID"  # Local Direct Inward Dialing number
  
  # Optional: Specify a specific number pattern if needed
  # For DID numbers, you can specify a prefix or pattern
  # phone_number = "+6128"  # Example: Sydney area code (02) with 8 as the next digit
  
  # Tags for better resource management
  tags = {
    Name        = "MainBusinessLine"
    Environment = "Production"
  }
}

# Output the claimed phone number
output "connect_phone_number" {
  description = "The claimed phone number"
  value       = aws_connect_phone_number.main_number.phone_number
}

# Note: Contact flow configuration has been removed due to errors
# The contact flow can be created manually in the AWS Connect console if needed
