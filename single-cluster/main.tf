terraform {

  backend "kubernetes" {
    secret_suffix = "single-cluster"
    config_path   = "~/.kube/config"
  }
  required_providers {
    loft = {
      source = "registry.terraform.io/loft-sh/loft"
    }
  }


}

provider "loft" {}



resource "loft_virtual_cluster_instance" "example-vcluster" {

  metadata {
    namespace = "loft-p-default"
    name      = "my-vcluster-tf"
  }
  spec {
    owner {
      user = "admin"
    }
    template {

    }
  }
}



