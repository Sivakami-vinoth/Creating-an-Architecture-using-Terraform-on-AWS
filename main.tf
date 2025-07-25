provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "us-east-1"
}

resource "aws_instance" "firstec2" {
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name="my key"
  user_data = <<-EOL
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install -y apache2
  sudo systemctl start apache2
  sudo systemctl enable apache2
  echo "Hello from Terraform Ubuntu EC2!" > /var/www/html/index.html
  EOL

  subnet_id = "${aws_subnet.first.id}"
  tags = {
      Name = "Terraform-casestudy"
          }
}
resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
  enable_dns_support = "1"
  enable_dns_hostnames = "1"
 tags = {
      Name = "myfirstvpc"
          }
}

resource "aws_subnet" "first" {
  availability_zone = "us-east-1a"
  cidr_block = "172.31.1.0/24"
  map_public_ip_on_launch = "1"
  vpc_id = "${aws_vpc.main.id}"
  tags = {
      Name = "myfirstsubnet"
          }
}
resource "aws_default_security_group" "default_myfirst" {
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.main.id}"
  tags = {
      Name = "myfirstsecuritygroup"
          }
}
resource "aws_internet_gateway" "internet" {
  vpc_id = "${aws_vpc.main.id}"
  tags = {
      Name = "myinternetgateway"
          }
}

resource "aws_route" "internet" {
  route_table_id            = "${aws_vpc.main.default_route_table_id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.internet.id}"

}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.first.id}"
  route_table_id = "${aws_vpc.main.default_route_table_id}"
}
resource "aws_network_interface" "first" {
  subnet_id = "${aws_subnet.first.id}"
  tags = {
      Name = "mynetworkinterface"
          }
}

resource "aws_network_interface_attachment" "connection" {
  instance_id          = "${aws_instance.firstec2.id}"
  network_interface_id = "${aws_network_interface.first.id}"
  device_index         = 1
}

output "IPs" {
  value = "Terraform-casestudy -  ${aws_instance.firstec2.public_ip}"
}
