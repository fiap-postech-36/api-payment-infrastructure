data "aws_instance" "ec2" {
  filter {
    name   = "tag:Name"           # mudar para tag do eks api payment
    values = ["MongoDB-Instance"] # mudar para valor da tag do eks api payment
  }
}