

variable "region" {
  description = "The aws region to deploy into."
  type        = string
  default     = "eu-west-2"
}

variable "availability_zones_count" {
  description = "The number of AZs."
  type        = number
  default     = 2
}

variable "project" {
  description = "Name to be used on all the resources as identifier."
  # description = "Name of the project deployment."
  type = string
  default = "tes-app"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Project"     = "tes-app"
    "Environment" = "Development"
    "Owner"       = "Teslim"
  }
}
############################################################################################################
variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  default = "tes-app-cluster"
}

# variable "kubeconfig_path" {
#   description = "Path to the kubeconfig file"
# }

variable "prometheus_namespace" {
  description = "Namespace to install Prometheus"
  default     = "prometheus"
}

variable "grafana_namespace" {
  description = "Namespace to install Grafana"
  default     = "grafana"
}

variable "argocd_namespace" {
  description = "Namespace to install ArgoCD"
  default     = "argocd"
}

variable "grafana_password" {
  description = "Password for Grafana admin user"
    default     = "admin"
}
