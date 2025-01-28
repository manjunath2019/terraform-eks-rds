variable "cidr_block" {}
variable "subnet_cidrs" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "vpc_name" {}
