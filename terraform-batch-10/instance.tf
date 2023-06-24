resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key"
  public_key = file("${path.module}/.terraform-batch-10.pub")

}
resource "aws_instance" "ec2" {
  count = 4 
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.test1.id]
  key_name               = aws_key_pair.deployer.key_name


  tags = {
    Name = "first-instance${count.index}"
  }
}

