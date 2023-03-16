locals {
  default_tags = {
    Terraform = "true"
    Env       = var.env
  }

  name = "tes-app-cluster"

  vpc_cidr = "10.0.0.0/16"
  azs      = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

  create_workloads = true

}