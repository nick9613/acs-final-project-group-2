# This Terraform file uses an existing module to deploy
# the webserver VMs for the project

module "webserver_vms" {
  source        = "../../modules/aws_ec2"
  env           = var.env
  instance_type = var.instance_type
  prefix        = var.prefix
  default_tags  = var.default_tags
}