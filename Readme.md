# Terraform Azure Resource Management


## terraform-state

* Directory to set up my terraform state storage in Azure through an Azure Storage Account
* Apply once, and done, tf state is now managed in the cloud and secure

## terraform-resources

* Directory to control all my terraform resources, referencing the state from terraform-state

### Project Structure
* Resources are grouped into modules that are specific to a singular application


## Guides

### Create Static Web App and Configure DNS

1. Create the static web app through Terraform
2. Create Azure DNS Zone through Terraform
3. Create Apex & CNAME (www) record sets on the dns zone pointing to the static web app created
4. Replace your DNR nameservers with the Azure DNS Zone nameservers (this shifts name service to Azure)
5. Add custom domains to the Azure Static Web app for the www (subdomain) and @ (root / apex domain).