### Built in function:

Terraform support list built in function and not allow to define custom user function

### Console
Got console terraform to test built in function

```
terraform console
```

EX use loop
```
output "example" {
  value = { for s in var.test_list : s => upper(s) }
}
```

### Local values

Variable is used within a module

```
locals {
  service_name => "forum"
  owner => "me"
}
```
