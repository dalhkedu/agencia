# Arquivo main.tf

provider "aws" {
  region = "us-east-1" # Substitua pela região desejada da AWS
}

resource "aws_instance" "django_app" {
  ami                    = "ami-0c94855ba95c71c99" # Substitua pela AMI do sistema operacional desejado
  instance_type          = "t2.micro"              # Substitua pelo tipo de instância desejado
  key_name               = "your-key-pair"         # Substitua pelo nome do par de chaves da AWS
  vpc_security_group_ids = [aws_security_group.django_app.id]

  tags = {
    Name = "django-app"
  }
}

resource "aws_security_group" "django_app" {
  name        = "django-app-sg"
  description = "Security group for Django app"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "django-db"
  username             = "admin"            # Substitua pelo nome de usuário desejado
  password             = "your-db-password" # Substitua pela senha do banco de dados desejada
  parameter_group_name = "default.mysql5.7"
  publicly_accessible  = false
  skip_final_snapshot  = true

  tags = {
    Name = "django-db"
  }
}
