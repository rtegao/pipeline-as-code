variable "cidr_block" {
    type = "string"
    description = "VPC CIDR block - split and route IP addresses"
}

variable vpc_name{
    type = "string"
    description = "VPC name"
    default = "management"
}