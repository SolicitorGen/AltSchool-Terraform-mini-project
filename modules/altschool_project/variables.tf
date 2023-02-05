variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_subnets" {
  type = list(object({
    subnet = string
    availability_zone = string
  }))
}