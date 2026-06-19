# -------------------------
# Ubuntu AMI
# -------------------------
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# -------------------------
# VPC
# -------------------------
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "devops-rescue-vpc"
  }
}

# -------------------------
# Internet Gateway
# -------------------------
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "devops-rescue-igw"
  }
}

# -------------------------
# Public Subnet
# -------------------------
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

# -------------------------
# Private Subnet
# -------------------------
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
  }
}

# -------------------------
# Route Table
# -------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# -------------------------
# Route Table Association
# -------------------------
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# -------------------------
# Security Group
# -------------------------
resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "Allow HTTP, HTTPS and SSH"
  vpc_id      = aws_vpc.main.id
}

# HTTP
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

# HTTPS
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}

# SSH
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "20.61.127.53/32"

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

# Outbound
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

# -------------------------
# Key Pair
# -------------------------
resource "aws_key_pair" "devops_key" {
  key_name   = "devops-rescue-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# -------------------------
# EC2 Instance
# -------------------------
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]

  key_name = aws_key_pair.devops_key.key_name

  tags = {
    Name = "devops-rescue-web"
  }
}
