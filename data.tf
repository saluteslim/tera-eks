data "aws_availability_zones" "available" {
  state = "available"
}

resource "local_file" "ca_certificate_file" {
  content  = data.tls_private_key.cluster_ca_certificate_pem.private_key_pem
  filename = "cluster-ca.crt"
}

data "tls_private_key" "cluster_ca_certificate_pem" {
  algorithm         = "RSA"
  rsa_bits          = 4096
  generate_subjects = ["CN=cluster-ca"]
}
