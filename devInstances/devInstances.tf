# Creates an EC2 instance for development
resource "aws_instance" "developmentServer" {
  count         = 1
  ami           = "ami-0ac80df6eff0e70b5"
  instance_type = "t3.micro"
  key_name      = "hoist"

  tags = {
    Name = "hoist-internal-development"
  }
}

