
output "security_group" {
  description = "Security group."
  value       = aws_security_group.this
}

output "security_group_name" {
  description = "Security group name."
  value       = aws_security_group.this.name
}

output "security_group_id" {
  description = "Security group ID."
  value       = aws_security_group.this.id
}
