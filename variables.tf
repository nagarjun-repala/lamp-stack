variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.90.77.0/24"

}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "dev"

}

variable "cidr_public_subnet_az1" {
  type        = string
  description = "CIDR for public subnet 1"
  default     = "10.90.77.0/26"

}
variable "cidr_public_subnet_az2" {
  type        = string
  description = "CIDR for public subnet az 2"
  default     = "10.90.77.64/26"

}

variable "cidr_private_subnet_az1" {
  type        = string
  description = "CIDR for private subnet az 1"
  default     = "10.90.77.128/26"

}
variable "cidr_private_subnet_az2" {
  type        = string
  description = "CIDR for private subnet az 2"
  default     = "10.90.77.192/26"

}

variable "identifier_name" {
  type    = string
  default = "lamp-db"

}
variable "name" {
  type        = string
  description = "db name"
  sensitive   = true

}
variable "user" {
  type        = string
  description = "db username"
  sensitive   = true

}

variable "password" {
  type        = string
  description = "db password"
  sensitive   = true

}

variable "instance_class" {
  type        = string
  description = "Storage class for the DB"
  default     = "db.t2.micro"

}

variable "storage_type" {
  type        = string
  description = "Storage type for DB"
  default     = "gp2"

}

variable "storage" {
  type        = string
  description = "Storage for DB"
  default     = 20

}

variable "skip_final_snapshot" {
  type        = string
  description = "Checks whether the snapshot is created or not hile deleting the DB instance"
  default     = true

}

variable "keypair" {
  type        = string
  description = "keypair for ec2"

}

variable "sshpubkey" {
  type        = string
  description = "your own public key"

}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"

}

variable "instance_type" {
  type        = string
  description = "Type of the instance"
  default     = "t2.micro"

}

variable "webserver_name" {
  type        = string
  description = "Name tag for webserver"

}

variable "user_data_filename" {
  type        = string
  description = "Name of the script file"

}

variable "alb_name" {
  type        = string
  description = "Name of the application load balancer"
}

variable "health_check_path" {
  type        = string
  description = "Health check path"
  default     = "/"

}

variable "health_check_port" {
  type        = string
  description = "Health check port"
  default     = "80"

}

variable "instance_target_port" {
  type        = number
  description = "Target port on instance"

}

variable "is_internal" {
  type        = bool
  description = "Set to false for external load balancer"
  default     = false

}

variable "enable_cross_zone_load_balancing" {
  type        = bool
  description = "Enable cross zone load balancing"
  default     = true

}
