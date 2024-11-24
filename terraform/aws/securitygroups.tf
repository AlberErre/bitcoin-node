# Node security group
resource "aws_security_group" "node" {
  description = "${var.env} Node security group"
  name        = "${var.env}-node-inbound"
  vpc_id      = aws_vpc.main.id

  # Outgoing rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Bitcoind access
  ingress {
    from_port   = 8333
    to_port     = 8333
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Optional: Uncomment and update the tags if needed
  tags = {
    Name         = "${var.env}-node-inbound"
    terraform_id = "${var.env}-terraform"
  }
}
