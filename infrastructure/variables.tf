variable "cidr_block" {
    type        = string
    description = "VPC CIDR block - split and route IP addresses"
    default     = "10.0.0.0/16"
}

variable "vpc_name"{
    type        = string
    description = "VPC name"
    default     = "management"
}

variable "profile"{
    type        = string
    description = "aws profile account"
    default     = "pocs"
}

variable "shared_credentials_files" {
    type        = list
    description = "aws profile credentials"
    default     = ["~/.aws/credentials"]          
}

variable author {
    type        = string
    description = "Provisioner Author"
    default     = "Tegao"
}


variable region {
    type = string
    description = "aws workspace region"
    default = "us-east-2"
}