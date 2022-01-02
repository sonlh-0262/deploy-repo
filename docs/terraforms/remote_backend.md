### Advantage

- Best practice to store state remote than your local machine
- Working in a team
  + Remote data store can be shared between all members
  + Infrastructure can be broken down into multiple components
  + Share infrastructure resources in a read-only way
- State Locking
- Keep sensitive information securely
- Remote operations (when apply too long, can keep this action in remote server)

### Definition
- Remote backend is a feature of terraform

EX: configure AWS S3 as remote Backend (remote storage)

- Store the state as a given key in a given bucket on Amazon S3
- Configure state locking with Dynamo DB

Setup in file main.tf :

```
terraform {
  backend "s3" {
    bucket = "bucket-state-remote"
    key = "mystate/terraform.tfstate"
    region = "us-west-2"
  }
}
```
