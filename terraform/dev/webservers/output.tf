output "public_webservers_ip_address" {
  value = module.webserver_vms.public_webservers_ip_address
}

output "private_webservers_ip_address" {
  value = module.webserver_vms.private_webservers_ip_address
}