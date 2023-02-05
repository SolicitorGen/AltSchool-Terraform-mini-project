output "ec2_public_ips" {
    value = {
        for k, v in aws_instance.altschool-server : k => v.public_ip
    }
}