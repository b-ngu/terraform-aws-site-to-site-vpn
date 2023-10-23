provider "aws" {
  region = var.region
}

module "vpn_connection" {
  source              = "../../"
  vpc_id              = "vpc-0xxxxxxx"
  customer_gateway_ip = "1.2.3.4"

  contact     = var.contact
  environment = var.environment
  team        = var.team
  purpose     = var.purpose
}