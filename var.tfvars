vpc_cidr_block                   = "10.90.77.0/24"
vpc_name                         = "dev"
cidr_public_subnet_az1           = "10.90.77.0/26"
cidr_public_subnet_az2           = "10.90.77.64/26"
cidr_private_subnet_az1          = "10.90.77.128/26"
cidr_private_subnet_az2          = "10.90.77.192/26"
identifier_name                  = "lamp-db"
name                             = "lamp"
user                             = "lampuser"
password                         = "lamp12345"
instance_class                   = "db.t2.micro"
storage_type                     = "gp2"
storage                          = 20
skip_final_snapshot              = true
keypair                          = "lamp"
sshpubkey                        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJ+jpUSkurDLdXMDhrvcgqqcOo2TrbMHrnK50X2bm4d7tFIS2SEA+4eu6+7TxyUj9HSJaN7vqrvglFkhdQARbBfPxAe1kunPy6hF51nix5GRO8tV1v8i+F58Cwn3weDxJrtTNDg7x8bL9MW6UPDqweTy9WemIlUVqa1zdWLunl/JltGRLXCJm4xgTpzCe5qAXhJMBqPmrPNH+OGQiHvFewOI82ZW7lUlgK/y0bvkknUzoSnAwFU+TLg3/bJ+kt6VnSHlo0UxwZDdUYeCbMoK+Cy3oVi2Z8mXVp4b028kkM5ys4wm0MUWLmqYLhQos8F0oVuZnGQXLryEmRcRqz8b1AilWboJgj4j7aPyv+qUtGrEWGabmKN0ImsUK1DMEqvnzW5sm1MPnTgQ8L3LEPS9NIC37xG7+BergzNG4RoEyI56leNuuGznFZKZmjnkq4IBenRao4p/G/ugnKR3HvByLSMEMt5Q6lbT0ZgRetcfGD6a4kHJPXJPnoRbQOj7hZvXeUksDqFwQeVimhSBC/RXQH3Ps+E5LprafoQpLGcCi6l63aAVI9WS3uaa9rEnz3VPScmrTGHripzTw7raIl0PbucuW4lz8GlnTi4+SlA++66XhBWPLK/ArDJwmDnFlGkAXOix9JPuZeRSb996CnllPQEpego9u35Fd7B4o4hTIfiQ== nagarjun.repala@outlook.com"
ami_id                           = "ami-04505e74c0741db8d"
instance_type                    = "t2.micro"
webserver_name                   = "lamp"
user_data_filename               = "init.sh"
health_check_path                = "/index.php"
health_check_port                = 80
instance_target_port             = 80
is_internal                      = false
enable_cross_zone_load_balancing = true
alb_name                         = "lamp"