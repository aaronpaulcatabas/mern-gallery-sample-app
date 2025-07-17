resource "aws_instance" "proxy" {
  ami                    = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.proxy_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "proxy-server"
  }
}

resource "aws_instance" "frontend" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "frontend-instance"
  }
}

resource "aws_instance" "backend" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "backend-instance"
  }
}

resource "aws_instance" "mongodb" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.mongodb_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "mongodb-instance"
  }
}