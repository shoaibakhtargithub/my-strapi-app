variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "strapi-app"
}

variable "public_key_path" {
  type    = string
  default =  "/home/shoaib-mirza/.ssh/my-strapi-key.pub"

}

variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "my_ip_cidr" {
  description = "my IP in CIDR form for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "github_repo_https" {
  type    = string
  default = "https://github.com/shoaibakhtargithub/my-strapi-app"
}

variable "github_repo_branch" {
  type    = string
  default = "master"
}

variable "app_dir" {
  type    = string
  default = "my-strapi-app"
}
