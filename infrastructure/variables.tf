variable "cidr_block" {
    type        = string
    description = "VPC CIDR block - split and route IP addresses"
    default     = "10.0.0.0/16"
}

variable "vpc_name" {
    type        = string
    description = "VPC name"
    default     = "management"
}

variable "profile" {
    type        = string
    description = "aws profile account"
    default     = "pocs"
}

variable "shared_credentials_files" {
    type        = list
    description = "aws profile credentials"
    default     = ["~/.aws/credentials"]          
}

variable "author" {
    type        = string
    description = "Provisioner Author"
    default     = "pipeline-as-code"
}


variable "region" {
    type = string
    description = "aws workspace region"
    default = "us-east-2"
}

variable "public_subnets_count" {
    type = number
    description = "Number of public subnets"
    default = 2
}

variable "private_subnets_count" {
    type = number
    description = "Number of public subnets"
    default = 2
}

variable "availability_zones" {
    type = list
    description = "avalilability zones inside region"
    default = ["us-east-2a","us-east-2b"]

}