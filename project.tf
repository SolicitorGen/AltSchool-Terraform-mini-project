module "project" {
  source = "./modules/altschool_project"
  vpc_subnets = [
    {
    subnet = "10.0.1.0/24"
    availability_zone = "us-east-1a"
  }, {
    subnet = "10.0.2.0/24"
    availability_zone = "us-east-1b"
  }, {
    subnet = "10.0.3.0/24"
    availability_zone = "us-east-1c"
  }]
}