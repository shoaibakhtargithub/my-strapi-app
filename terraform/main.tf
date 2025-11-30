terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Networking Module
module "networking" {
  source = "./modules/networking"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_cidr  = var.private_subnet_cidr
}

# Security Module
module "security" {
  source = "./modules/security"

  project_name    = var.project_name
  vpc_id          = module.networking.vpc_id
  public_key_path = var.public_key_path
  my_ip_cidr      = var.my_ip_cidr
}

# Compute Module
module "compute" {
  source = "./modules/compute"

  project_name            = var.project_name
  app_instance_type       = var.app_instance_type
  bastion_instance_type   = var.bastion_instance_type
  key_name                = module.security.key_name
  private_subnet_id       = module.networking.private_subnet_id
  public_subnet_id        = module.networking.public_subnet_id
  app_security_group_id   = module.security.app_security_group_id
  bastion_security_group_id = module.security.bastion_security_group_id
  github_repo_https       = var.github_repo_https
  github_repo_branch      = var.github_repo_branch
  app_dir                = var.app_dir
}

# Application Load Balancer Module
module "alb" {
  source = "./modules/alb"

  project_name          = var.project_name
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.security.alb_security_group_id
  app_instance_id       = module.compute.app_instance_id
}
