resource "tls_private_key" "name" {
  rsa_bits  = 2048
  algorithm = "RSA"
}

resource "local_file" "github_key" {
  filename = "${aws_key_pair.name.key_name}.pem"
  content  = tls_private_key.name.private_key_pem
}

resource "aws_key_pair" "name" {
  public_key = tls_private_key.name.public_key_openssh
  key_name   = var.keyname
}