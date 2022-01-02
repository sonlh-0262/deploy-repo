### Input variable
- Defined by stating: name, type (option), default value (option)
- Type of variable:
    +  String, Number, Boolean
    +  Rich data types as list, set, map, object or tuple
- Description of variable

EX:

```
variable "region" {
  default = "us-east-1"
}

variable "aws_ami_id" {
  type = string
  description = "The id of machine image to use for the server"
  default = "ami-xxxxx"
}

variable "vpc_val" {
  type = bool
}

variable "cidrs" {
  type = "list"
  default = ["10.0.0.0/16", "10.1.0.0/16"]
}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-xxxx"
    "us-west-1" = "ami-yyyy"
  }
}
```

- Assign value to variable:
+ Command-line flags
```
terraform apply -var 'region=us-east-1'
```

+ In variables definition files:
   File terraform.tfvars or any vairation of `*.auto.tfvars` are automatically loaded
   Can also specify file as terraform.tfvars.json or any file ending in `.auto.tfvars.json`
   
   Apply var file:
   
   ```
   terraform apply -var-files="testing.tfvars"
   ```
   
+ Environment Variables
+ UI input

- Priority loading of variables (from low to highest priority):
   + Environment variables
   + terraform.tfvars file
   + terraform.tfvars.json file
   + any `*.auto.tfvars` or `*.auto.tfvars.json` file
   + any `-var` and `-var-file` options on command line  


- Using variable: `var.<NAME>`

```
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami = var.aws_ami_id
}
```

### Output variable
- Used to get information about the infrastructure after deployment
- With output variable, we can extract any server-specific values including caculated details
- Data is outputted when `terraform apply` is called and can be queried using `terraform output` command as well

EX:

```
output "instance_public_ip_sensitive" {
  value = aws_instance.example_ec2.public_ip
  sensitive = true
}

output "instance_state" {
  value = aws.instance.example.instance_state
  description = "State of server instance"
}
```

### Data source 

- Data Source can query external sources and return data
- Each provider mya offer data sources alongside its set of resource types

```
EX:

data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  
  owners = ["account_id"]
}

# using
resource "aws_instance" "ubuntu_ec2" {
  ami = data.aws_ami.ubuntu.id
}

data "aws_ebs_volume" "ebs_volume" {
  most_recent = true
  
  filter {
    name = "volume-type"
    values = ["gp2"]
  }
  
  filter {
    name = "tag:Name"
    values = ["my-vol"]
  }
}

# using
resource "aws_volume_attachment" "name" {
  volume_id = data.aws_ebs_volume.ebs_volume.id
}
```
