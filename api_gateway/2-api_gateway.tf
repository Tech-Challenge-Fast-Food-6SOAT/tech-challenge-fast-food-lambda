data "kubernetes_service" "nodejs_app_svc" {
  metadata {
    name      = "nodejs-app-svc"
    namespace = "lanchonete"
  }
}

resource "aws_api_gateway_rest_api" "main" {
  name        = "lanchonete_gateway"
  description = "Lanchonete Gateway used for EKS. Managed by Terraform."
  endpoint_configuration {
    types = ["REGIONAL"]
  }

  depends_on = [data.kubernetes_service.nodejs_app_svc]
}
