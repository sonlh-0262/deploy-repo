resource "aws_ebs_volume" "name1" {
  availability_zone = var.ebs_azs
  size = 10
}

resource "aws_ebs_volume" "name2" {
  availability_zone = var.ebs_azs
  size = 10
}
