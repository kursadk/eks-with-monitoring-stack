locals {
  cluster_name = "kursadk-eks-${random_string.suffix.result}"
}

variable "AWS_REGION" {
  description = "Provide aws region"
  default     = "eu-central-1"
}


variable "VPC_CIDR_BLOCK" {
  description = "Provide aws cidr block for whole vpc"
  default     = "10.0.0.0/16"
}

variable "PUBLIC_SUBNETS" {
  default     = []
  description = "Provide list of public cidr bloks per availability zones, ex ['10.1.1.0/24']"
  type        = list(string)
}

variable "PRIVATE_SUBNETS" {
  default     = []
  description = "Provide list of application cidr bloks per availability zones, ex ['10.1.10.0/24']"
  type        = list(string)
}

variable "CLUSTER_VERSION" {
  default     = "1.18"
  description = "Provide EKS cluster version, ex '1.18'"
}

variable "INSTANCE_TYPE" {
  default     = "t2.small"
  description = "Provide EKS node instance type, ex 't2.small'"
}



variable "NGINX_BASIC_AUTH_USER" {
  description = "Username"
}
variable "NGINX_BASIC_AUTH_PASSWORD" {
  description = "Password"
}
