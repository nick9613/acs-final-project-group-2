### ACS730 Final Project (Two-tier Web Application Automation Using Terraform, Ansible and GitHub Actions)
#sample commit
###Deployment pre-requisites:
Create an S3 bucket with unique name. The bucket will store Terraform state.

Either create a bucket with same name as used in the config.tf files for each
environment (dev and prod) or create a new custom bucket name and update the new bucket name to the
config.tf files.

##Deployment Process
1. Upload the code to AWS Cloud9 environment or Start with the existing code or start from the scratch
```
2. Update the desired input varibles in dev/network and deploy dev/network with the commands below
```
   cd ~/webappproject/terraform/dev/network
   tf init
   tf plan
   tf apply 
```
3. Update the desired input varibles in prod/network and deploy prod/network with the commands below
```
   cd ~/webappproject/terraform/prod/network
   tf init
   tf plan
   tf apply --auto-approve 
```
4. Create a custom SSH key pair in dev/webservers for remote access to the dev VMs (Please use 'dev-keypair' as
the name to avoid having to update the code)
``` 
   cd ~/webappproject/terraform/dev/webservers
   ssh-keygen -t rsa -f dev-keypair
   
5. Deploy webserver VMs in dev/webservers
```
   tf init
   tf plan
   tf apply --auto-approve

6. Create a custom SSH key pair in prod/webservers for remote access to the prod VMs (Please use 'prod-keypair' as
the name to avoid having to update the code)
``` 
   cd ~/webappproject/terraform/prod/webservers
   ssh-keygen -t rsa -f prod-keypair
   
7. Deploy webserver VMs in prod/webservers
```
   tf init
   tf plan
   tf apply --auto-approve

###Clean Up process 

The cleanup process is a reverse of the deployment process,

1. Delete  instances in dev VPC
``` 
 cd ../../dev/webservers/
 tf destroy  -var my_private_ip=${PRIVATE_IP} -var my_public_ip=${PUBLIC_IP} --auto-approve
 ```
2. Delete  instances in prod VPC
``` 
 cd ../../prod/webservers/
 tf destroy  -var my_private_ip=${PRIVATE_IP} -var my_public_ip=${PUBLIC_IP} --auto-approve
 ```

