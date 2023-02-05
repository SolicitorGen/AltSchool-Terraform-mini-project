output "ec2_public_ips" {
    value = module.project.ec2_public_ips
}

resource "local_file" "host-names" {
    content  = jsonencode(module.project.ec2_public_ips)
    filename = "host-names.txt"
}