output "ec2_public_ips" {
    value = module.project.ec2_public_ips
}

resource "local_file" "host-names" {
    content = <<-EOT
    [servers]
    %{ for ip in module.project.ec2_public_ips}${ip}
    %{ endfor }
    EOT
    filename = "./ansible/host-inventory"
}