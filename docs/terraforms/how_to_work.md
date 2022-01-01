### Include
- Terraform Core (like client that make API to server)
- Terraform Plugin (install automatically in cloud provider) - (like server)

### Responsible
1. Terraform Core
- Infrastructure as code
- Resource state management (state files)
- Construction of the Resource Graph
- Plan excution
- Communication with plugins over RPC


2. Terraform Plugin
- External single static binaries
- Each plugin exposes an implementation for a service `provider` or `provisioner`
- Several Provisioners (ex bash) are built-in, while Providers are discovered dynamically

Responsiblitily of Provider Plugins:
- Initialization of any included libraries
- Authentication
- Define resources

Responsiblitily of Provisioner Plugins:
- Executing commands or scripts on the designated Resource after creation, or on destruction

