# Creating Load Balancer
resource "aws_lb" "altschool-load-balancer" {
  name               = "altschool-load-balancer"
  internal           = false
  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  depends_on                 = [aws_eip.lb-public]
  
  dynamic "subnet_mapping" {
    for_each = aws_subnet.altschool-public-subnet.*
    content {
      subnet_id = subnet_mapping.value["id"]
      allocation_id = aws_eip.lb-public[subnet_mapping.key].id
    }
  }
}

# Creating Elastic IP address 
resource "aws_eip" "lb-public" {
  count = length(var.vpc_subnets)
  vpc = true
}

# Creating the target group
resource "aws_lb_target_group" "altschool-target-group" {
  name     = "altschool-target-group"
  target_type = "instance"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.altschool_vpc.id
}

# Creating the listener
resource "aws_lb_listener" "altschool-listener" {
  load_balancer_arn = aws_lb.altschool-load-balancer.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.altschool-target-group.arn
 }
}

# Registering instances to target group
resource "aws_lb_target_group_attachment" "target_group_attachment" {
  target_group_arn = aws_lb_target_group.altschool-target-group.arn
  count = length(aws_instance.altschool-server.*)
  target_id        = aws_instance.altschool-server[count.index].id
  port             = 80
}

