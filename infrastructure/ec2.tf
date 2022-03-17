
resource "aws_instance" "example" {
  count         = var.example-count
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  tags = {
    Environment = "dev"
  }
}
