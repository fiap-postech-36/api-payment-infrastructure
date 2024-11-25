# Instância EC2 para MongoDB
resource "aws_instance" "mongo_instance" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu 20.04 (substitua pela AMI da sua região)
  instance_type = "t3.micro"              # Tipo de instância
  key_name      = var.key_name
  subnet_id     = aws_subnet.default.id
  security_groups = [aws_security_group.sg-rds.name]

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y gnupg
    wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
    apt-get update -y
    apt-get install -y mongodb-org
    systemctl start mongod
    systemctl enable mongod
  EOF

  tags = {
    Name = "MongoDB-Instance"
  }
}

