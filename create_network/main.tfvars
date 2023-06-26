# ############################################
# #          KAFKA SECURITY GROUP            #
# ############################################
# ingress_rules = [
#   {
#     from_port   = 3000
#     to_port     = 3000
#     protocol    = "tcp"
#     cidr_block  = "0.0.0.0/0"
#     description = "SSH Port"
#   },
#   # {
#   #   from_port   = 8778
#   #   to_port     = 8778
#   #   protocol    = "tcp"
#   #   cidr_block  = "0.0.0.0/0"
#   #   description = "Jolokia Port"
#   # },
#   # {
#   #   from_port   = 8080
#   #   to_port     = 8080
#   #   protocol    = "tcp"
#   #   cidr_block  = "0.0.0.0/0"
#   #   description = "JMX Exporter"
#   # },
#   # {
#   #   from_port   = 9999
#   #   to_port     = 9999
#   #   protocol    = "tcp"
#   #   cidr_block  = "0.0.0.0/0"
#   #   description = "JMX Port"
#   # },
#   # {
#   #   from_port   = 9092
#   #   to_port     = 9092
#   #   protocol    = "tcp"
#   #   cidr_block  = "0.0.0.0/0"
#   #   description = "Kafka External Port"
#   # },
# ]
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
app_port = 3000