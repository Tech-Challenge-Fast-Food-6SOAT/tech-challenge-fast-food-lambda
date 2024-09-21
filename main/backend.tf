terraform {
  backend "gcs" {
    bucket = "lanchonete-terraform-backend"
    prefix = "lambda/terraform.tfstate"
  }
}
