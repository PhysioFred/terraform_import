variable "pass" {
  type        = string
  default     = "SpaceCode3122!"  # Meets AWS Connect password requirements
  sensitive   = true
  description = "Password for Connect users. Must be at least 8 characters long and include uppercase, lowercase, number, and special character."
}
