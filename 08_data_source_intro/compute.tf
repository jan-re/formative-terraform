resource "aws_instance" "web" {
  ami                         = data.aws_ami.latest_ami.image_id
  associate_public_ip_address = true
  instance_type               = "t3.micro"

  lifecycle {
    create_before_destroy = true
  }
}
