data "aws_lbs" "lanchonete_lbs" {
  tags = {
    "kubernetes.io/service-name" = "lanchonete/nodejs-app-svc"
  }
}

resource "aws_api_gateway_vpc_link" "main" {
  name        = "lanchonete_gateway_vpclink"
  description = "Lanchonete Gateway VPC Link. Managed by Terraform."
  target_arns = data.aws_lbs.lanchonete_lbs.arns
}
