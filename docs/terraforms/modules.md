### Small directory terraform:

##### main.tf
- declaration configuration
- declare provider

##### variables.tf
- variables declaration

##### terraform.tfvars
- assign value for variable in terraform

##### output.tf
- output variable for terraform

##### .terraform
- folder contain all plugin and provider that is downloading
- execute file

### module
- write maintainable
- reuse, shareable component
- organize configuration
- encapsulate configuration
- reuse configuration
- provide consistency and ensure best practices

module can called by other module block (it is called child module)

Local and remove modules

#### Local modules

call directly

EX:

```
module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"
  
  bucket_name = "name-bucket"
  
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

#### Terraform Registry

Link: https://registry.terraform.io/browse/modules

EX:

```
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.11.1"
  # insert the 5 required variables here
}
```

It will fetch module with `terraform init`

#### Git

EX GitHub:
```
# by HTTP
module "consul" {
  source = "github.com/hashicorp/example"
}

# by SSH
module "consul" {
  source = "git@github.com:hashicorp/example.git"
}
```
