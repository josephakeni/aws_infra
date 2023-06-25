############################################
#          ECS SECURITY GROUP            #
############################################
ingress_rules = [
  {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
    description = "SSH Port"
  },
  {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
    description = "SSH Port"
  },
]

# app_port = 3000
desired_capacity = 2
max_size         = 3
min_size         = 1