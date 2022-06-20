resource "vpc_aws" "management" {
    cidr_block = var.cidr_block
    enable_dns_hostname = true

    tags = {
        Name = var.vpc_name
        Author = var.author
    }
}