variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for first public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for second public subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}

variable "app_instance_type" {
  description = "EC2 instance type for application server"
  type        = string
}

variable "bastion_instance_type" {
  description = "EC2 instance type for bastion host"
  type        = string
  default     = "t3.micro"
}

variable "my_ip_cidr" {
  description = "Your IP in CIDR form for SSH access"
  type        = string
}

variable "github_repo_https" {
  description = "GitHub repository HTTPS URL"
  type        = string
}

variable "github_repo_branch" {
  description = "GitHub repository branch"
  type        = string
}

variable "app_dir" {
  description = "Application directory name"
  type        = string
}
