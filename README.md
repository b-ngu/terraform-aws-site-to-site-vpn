# terraform-aws-site-to-site-vpn

## Summary

Terraform module which creates Site-to-Site VPN resources on AWS.

The main purpose of this module is to provision the necessary resources for establishing a secure connection between a local network and an AWS VPC.

## Helpful AWS Documentation Links

* [AWS S2S VPNs: How They Work](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)
* [Customer Gatewway](https://docs.aws.amazon.com/vpn/latest/s2svpn/your-cgw.html)


## Example Usage

```hcl
module "vpn_connection" {
  source              = "path_to_this_module"
  vpc_id              = "vpc-0xxxxxxx"
  customer_gateway_ip = "1.2.3.4"
}
```

Replace `path_to_this_module` with the path to where you have this module.

## VPN Components
1. VPN Gateway: A VPN gateway is a type of virtual router. It uses the Border Gateway Protocol (BGP) to advertise your VPC's CIDR blocks to your network.
2. Customer Gateway: Represents a physical device or software application on your side of the Site-to-Site VPN connection.
3. VPN Connection: Connects your VPC to your network.

## VPN Connection

This module facilitates the creation of a VPN connection that ties together the VPN Gateway and the Customer Gateway. The result is a secure connection between your VPC and your local network.

## Customizing the VPN
This module provides a basic configuration for a VPN connection, but VPN connections have many customizable settings like tunnel options and static routes. Review the AWS documentation and adjust the module as necessary to fit specific requirements.

## Tags

To configure any additional tags, set tags map in module definition

```hcl

module "vpn_connection" {
  source              = "path_to_this_module"
  vpc_id              = "vpc-0xxxxxxx"
  customer_gateway_ip = "1.2.3.4"
  tags = {
    key1        = "value1"
    key2        = "value2"
  }
}

```

## Examples

* [VPN Connection](./examples/site2site)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.28 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpn_gateway.vpn_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway) | resource |
| [aws_customer_gateway.customer_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway) | resource |
| [aws_vpn_connection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contact"></a> [contact](#input\_contact) | (Required) The contact for this resource. | `string` | n/a | yes |
| <a name="input_customer_gateway_bgp_asn"></a> [customer_gateway_bgp_asn](#input_customer_gateway_bgp_asn) | The Border Gateway Protocol (BGP) Autonomous System Number (ASN) of the customer gateway. | `string` | `"65000"` | no |
| <a name="input_customer_gateway_ip"></a> [customer_gateway_ip](#input_customer_gateway_ip) | The IP address of the customer gateway's Internet-routable external interface. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The environment where this resource will live. | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | (Required) The purpose for this resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_team"></a> [team](#input\_team) | (Required) The team responsible for this resource. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id) | The ID of the VPC where the VPN gateway will be attached. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_customer_gateway_id"></a> [customer_gateway_id](#output_customer_gateway_id) | The ID of the customer gateway. |
| <a name="output_vpn_connection_id"></a> [vpn_connection_id](#output_vpn_connection_id) | The ID of the VPN connection. |
| <a name="output_vpn_gateway_id"></a> [vpn_gateway_id](#output_vpn_gateway_id) | The ID of the VPN gateway. |
<!-- END_TF_DOCS -->