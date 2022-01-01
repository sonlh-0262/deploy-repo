### Config aws

```
# install aws cli

# setup authen aws
aws configure
```

### aws-instance.tf

```
provider "aws" {
}

resource "aws_instance" "example1" {
  ami = "ami_id"
  instance_type = "t2.micro"
}
```

### Commands

```
# Init
terraform init

# Preview infrastructure change
terraform plan

# Apply infrastructure change
terraform apply

# Destroy infrastructure change that has been deployed
terraform destroy
```
