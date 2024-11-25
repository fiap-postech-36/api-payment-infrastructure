resource "aws_security_group" "sg-rds" {
  name        = "mongodb-security-group"
  description = "Allow MongoDB access"

  vpc_id = var.vpcId

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permita o acesso com base na sua necessidade
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
