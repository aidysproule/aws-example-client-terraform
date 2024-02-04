resource "aws_instance" "server" {
  ami           = "ami-0277155c3f0ab2930"
  instance_type = "t2.micro"
  count         = 1
  key_name      = "temp-keypair"

  subnet_id = ["subnet-007edf91713b014db"]

  vpc_security_group_ids = "sg-065c86502cf01d959"

}