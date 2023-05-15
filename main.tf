# --- root/main.tf ------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
#  required_version = ">= 1.2.0"
}



locals {
  vpc_cidr      = "10.123.0.0/16"
}


module "compute" {
  source                  = "./modules/compute"
  frontend_app_sg         = module.networking.frontend_app_sg
  backend_app_sg          = module.networking.backend_app_sg
  bastion_sg              = module.networking.bastion_sg
  public_subnets          = module.networking.public_subnets
  private_subnets         = module.networking.private_subnets
  bastion_instance_count  = 1
  instance_type           = var.instance_type
  key_name                = "Three-Tier-Deployment"
  lb_tg_name              = module.loadbalancing.lb_tg_name
  lb_tg                   = module.loadbalancing.lb_tg

}


module "networking" {
  source            = "./modules/networking"
  vpc_cidr          = local.vpc_cidr
  access_ip         = var.access_ip
  public_sn_count   = 2
  private_sn_count  = 2
  db_subnet_group   = true
  availabilityzone  = var.availabilityzone
  azs               = 2
}


module "database" {
  source               = "./modules/database"
  db_storage           = 10
  db_engine_version    = var.db_engine_version
  db_engine            = var.db_engine  
  db_instance_class    = var.db_instance_class
  db_name              = var.db_name
  dbuser               = var.dbuser
  dbpassword           = var.dbpassword
  db_identifier        = "database"
  skip_db_snapshot     = true
  rds_sg               = module.networking.rds_sg
  db_subnet_group_name = module.networking.db_subnet_group_name[0]
}

module "loadbalancing" {
  source                  = "./modules/loadbalancing"
  lb_sg                   = module.networking.lb_sg
  public_subnets          = module.networking.public_subnets
  tg_port                 = 80
  tg_protocol             = "HTTP"
  vpc_id                  = module.networking.vpc_id
  app_asg                 = module.compute.app_asg
  listener_port           = 80
  listener_protocol       = "HTTP"
  azs                     = 2
}