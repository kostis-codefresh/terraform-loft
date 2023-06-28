terraform {

  backend "kubernetes" {
    secret_suffix = "multiple-clusters-local"
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

  count = 3

  metadata {
    namespace = "loft-p-default"
    name      = "example-vcluster2-${count.index}"
  }
  spec {
    owner {
      user = "admin"
    }
    template {

    }
  }
}



