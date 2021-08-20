##
# define aws region
##
AWS_REGION = "eu-central-1"

##
# define vpc cidr block (network range)
##
VPC_CIDR_BLOCK = "10.0.0.0/16"

##
# define public network cidr bloks per az
##
PUBLIC_SUBNETS = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

##
# define application network cidr bloks per az
##
PRIVATE_SUBNETS = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

##
# define basic auth secret generatede with htpasswd
##
NGINX_BASIC_AUTH_USER = "admin"
NGINX_BASIC_AUTH_PASSWORD = "admin123"
