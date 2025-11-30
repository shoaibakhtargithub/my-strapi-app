output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "ID of the first public subnet"
  value       = aws_subnet.public.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets (for ALB)"
  value       = [aws_subnet.public.id, aws_subnet.public_2.id]
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

