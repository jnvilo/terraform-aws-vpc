resource "aws_key_pair" "jnvilo" {
  key_name   = "jnvilo"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEK52DlZsqL3lGbsM5jW7bRM24DbD+iMHhmi2IjhiRbAKt3KlSsAR+4ab5Lg2P/yrALXJ/7Wu/4ZV0s2Pala/wQiqMMSC/t42wwel6Rpc4uZ3x/ILZGUc7tydWekOgHa6Z0VXoL/ORGw035qEhrEkIRDByiFI/SWagt0kbHlzCTJYGpAnfDGGmA5KQrCV62VbhvNkRFU8JAdqeNCLOM5nwIiAWi47Lnw4rzXOU5TF075Fv6ONqpj/oERvU8bgfByO0H0ttEpTDfwYW36pdgGjVrBd2O71tAwnDGgz9MBMXBd9Flxz/hraGRNSDz2N7Mtp8P5N2eSQzm5OXLanXfSDENibvHbRT2xissLTHMRcpIHF4dX5axHlBxE0ouGFO0YAmYUeDEAoJbjqA4R6weWgvlLT8I4mfB+MuPBQ88FRZy8TbcV+lOE/GyxLczYotGqa3/JZUib4go80yrp4VnhCabYCkRG3PnZwhScMFg0j8Va09GBbPG+oVjXJW+CgL+ps= jasonviloria@jv.optiscangroup.com"
}


resource "aws_instance" "web1" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    # the Public SSH key
    key_name = "jnvilo"
    # nginx installation
}




