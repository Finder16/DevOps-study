provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_vpc" "terraform-vpc" {
  cidr_block = "var.vpc_cidr"
  tags
  {
    Name = "var.vpc-name"
  }
}

resource "aws_internet_gateway" "terraform-igw"
{
  vpc_id = "aws_vpc.terraform-vpc.id"
}

resource "aws_eip" "nat-eip"
{
  vpc = True
}

resource = "aws_subnet" "public-1"{
  vpc_id = "aws_vpc.terraform-vpc.id"
  cidr_block = "cdirsubnet"
  availability_zone = "{element(split(",",var.aws-availability_zones),count.index)}"
  tags {
    Name = "Private"
  }
}
