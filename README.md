# First Terraform azure project

this project is a proof of concept for creating azure resources and managing them using terraform

## Project setup

* firstly install terraform on your machine if you havent already. https://developer.hashicorp.com/terraform/install
* secondly run the terraform init command
``` terraform init ```

* go to your azure portal or shell of choice, using Entra Idan create an app registry for your terraform to have permissions in your azure subscription
* create a terraform.tfvars file and copy the following code ensuring you provide your own values for your azure subscription for the following code

```
# you can find your subscription Id in the azure portal or with the "Get-AzSubscription" command in PowerShell
subscription_id = #

# you can find your client ID in the azure app registry where you registered the permissions for terraform
client_id =

# client secret can be found in the app registry for terraform 
client_secret = 

# can be found in entra Id under properties or with the "Get-AzTenant" command in powershell
tenant_id =
```

## Deployment and destroy
* finally tweak the resources or deploy them as described running the following commands

``` terraform plan ```
``` terraform apply ```
followed by entering yes when prompted

* to destroy the created resource group and resources run the following command
``` terraform destroy ```
