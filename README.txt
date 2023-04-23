###ACS730 Final Project (Two-tier Web Application Automation Using Terraform, Ansible and GitHub Actions)

###Deployment pre-requisites:
Create an S3 bucket with unique name. The bucket will store Terraform state.

Either create a bucket with same name as used in the config.tf files for each
environment (dev and prod) or create a new custom bucket name and update the new bucket name to the
config.tf files. Note that the bucket name might already be taken, so chances are that it might be
required to create a new bucket name and update that into the config files.

IMPORTANT: This codebase uses a webserver module to deploy the webservers and in that module, the
networking state of the infrastructure is imported from the S3 bucket earlier created. Therefore it
is essential that the ~/module/aws_ec2/main.tf config file is updated with the new bucket name

##Deployment Process
1. Upload the code to AWS Cloud9 environment or use in any other local environment where Terraform is installed
```
2. Update the desired input varibles in dev/network and deploy dev/network with the commands below
```
   cd ~/webappproject/terraform/dev/network
   tf init
   tf plan
   tf apply --auto-approve 
```
3. Update the desired input varibles in prod/network and deploy prod/network with the commands below
```
   cd ~/webappproject/terraform/prod/network
   tf init
   tf plan
   tf apply --auto-approve 
```
4. Create a custom SSH key pair in ~/.ssh/linux for remote access to the dev VMs (Please use 'dev-keypair' as
the name for dev deployment to avoid having to update the code.) Creating the key pair anywhere else will require
updating the code
``` 
   mkdir ~/.ssh/linux
   ssh-keygen -t rsa -f ~/.ssh/linux/dev-keypair
   
5. Deploy webserver VMs in dev/webservers
```
   tf init
   tf plan
   tf apply --auto-approve

6. Create a custom SSH key pair in ~/.ssh/linux for remote access to the prod VMs (Please use 'prod-keypair' as
the name for prod deployment to avoid having to update the code.) Creating the key pair anywhere else will require
updating the code
``` 
   mkdir ~/.ssh/linux
   ssh-keygen -t rsa -f ~/.ssh/linux/prod-keypair
   
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
