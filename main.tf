provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:\\Users\\Nagarjun\\.aws\\credentials"
  profile                 = "lamp"
}

module "vpc_config" {
  source                  = ".\\modules\\vpc"
  vpc_cidr_block          = var.vpc_cidr_block
  vpc_name                = var.vpc_name
  cidr_public_subnet_az1  = var.cidr_public_subnet_az1
  cidr_public_subnet_az2  = var.cidr_public_subnet_az2
  cidr_private_subnet_az1 = var.cidr_private_subnet_az1
  cidr_private_subnet_az2 = var.cidr_private_subnet_az2

}

module "mysql_db_config" {

  source = ".\\modules\\mysql-database"
  identifier_name     = var.identifier_name
  name                = var.name
  user                = var.user
  password            = var.password
  instance_class      = var.instance_class
  storage_type        = var.storage_type
  storage             = var.storage
  vpc_id              = module.vpc_config.vpc_id
  webserver_sg_id     = module.ubuntu_webserver.webserver_sg_id
  skip_final_snapshot = var.skip_final_snapshot
  db_subnet_ids       = [module.vpc_config.private_subnet_az1, module.vpc_config.private_subnet_az2]

}

module "ubuntu_webserver" {
  source              = ".\\modules\\webserver"
  keypair             = var.keypair
  sshpubkey           = var.sshpubkey
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_id           = module.vpc_config.private_subnet_az1
  webserver_name      = var.webserver_name
  user_data_filename  = var.user_data_filename
  vpc_id              = module.vpc_config.vpc_id
  vpc_cidr            = module.vpc_config.vpc_cidr
  lb_sg_id            = module.app_load_balancer.lb_sg_id
  secrets_manager_arn = module.mysql_db_config.secrets_manager_arn

}

module "app_load_balancer" {
  source                   = ".\\modules\\app-load-balancer"
  alb_name                 = var.alb_name
  health_check_path        = var.health_check_path
  vpc_id                   = module.vpc_config.vpc_id
  target_id                = module.ubuntu_webserver.instance_id
  load_balancer_subnet_ids = [module.vpc_config.public_subnet_az1, module.vpc_config.public_subnet_az2]

}

output "load_balancer_endpoint" {
  value = "http://${module.app_load_balancer.endpoint}"
  
}