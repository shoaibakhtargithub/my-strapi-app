variable "project_name" {
  description = "Project name for resource naming"
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

variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID where app instance will be launched"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID where bastion will be launched"
  type        = string
}

variable "app_security_group_id" {
  description = "Security group ID to attach to app instance"
  type        = string
}

variable "bastion_security_group_id" {
  description = "Security group ID to attach to bastion host"
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

