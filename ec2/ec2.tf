# resource "aws_security_group" "allow_ssh_terraform" {
#     name = "allow_ssh_port"  #here alerady allow ssh SG is there in aws account
#     description = "allow port 22 for ssh access"

#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }

#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]     #example:allow everyone
#         ipv6_cidr_blocks = ["::/0"]
#     }

#     tags = {
#         Name = "Allow-SSH-PORT"
#     }
# }

# resource "aws_instance" "terraform" {
#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

#     tags  = {
#         Name = "terraform"
#     }
# }

#Reevese order which means 1st instance and 2nd security group

resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags  = {
        Name = "terraform"
    }
}
resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_ssh_port"  #here alerady allow ssh SG is there in aws account
    description = "allow port 22 for ssh access"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]     #example:allow everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "Allow-SSH-PORT"
    }
}
