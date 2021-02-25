resource "aws_subnet" "pub_subnet_a" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.0.0/24"
    availability_zone = "us-east-1a"
     
}
resource "aws_subnet" "pub_subnet_b" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    
}