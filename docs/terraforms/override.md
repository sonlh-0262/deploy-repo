Override resource in other file, result will be merge original resource with override resource

Using name file with `override.tf` or with `_override.tf` or `_override.tf.json` in name file

Ex:
```
# file1.tf
resource "aws_instance" "example1" {
  instance_type = "t2.small"
}

# override.tf
resource "aws_instance" "example1" {
  instance_type = "t2.micro"
}

=> Result will be instance_type = "t2.micro"
```
