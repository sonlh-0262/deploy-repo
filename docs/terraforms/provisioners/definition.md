### Provisioner
Respoinsibilities of `Provider Plugins`:
- Initialization of any included libraries
- Authentication
- Define resources

Responsibilities of `Provisioner Plugins`:
- Executing commands or scripts on the designated Resource after creation, or on destruction

#### Provisioner types
- `remote-exec` Provisioner
   invokes a script on a remote resource after it is created
   
- `local-exec` Provisioner
   invokes a local executable after a resource is created

- `file` Provisioner
   used to copy files or directories from machine executing Terraform to the newly created resource
   
- `Chef` Provisioner
   install, configures and runs the Chef Client on a remote resource
   support both ssh and winrm type connections
   
- Provisioner for habitat, puppet and salt-masterless

#### Understanding

##### Creation-Time Provisioners

By default, provisioners run when the resource they are defined within is created

##### Destroy Provisioners
- Run only with destroy operation on the resource
- Destroy provisioners are run before the resource is destroyed
- If they fail, terraform will error and rerun the provisioners again on the next apply

```
provisioner "local-exec" {
  when = "destroy"
  command = "echo 'Destroy-time provisioner'"
}
```

##### Failure Behavior
- By default, provisioners that fail will also cause the Terraform apply itself to fail

`Fail`
- Default behavior
- Raise an error and stop applying
- If creation provisioner, taint the resource

`Continue`
- Ignore the error and continue with creation or destruction

```
provisioner "local-exec" {
  command = "echo The server's IP address is ${self.private_ip}"
  on_failure = "continue"
}
```
