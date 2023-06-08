terraform {

  backend "kubernetes" {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
  }
  required_providers {
    loft = {
      source = "registry.terraform.io/loft-sh/loft"
    }
  }


}

provider "loft" {}

resource "loft_space_instance" "example-space" {
  metadata {
    namespace = "loft-p-default"
    name      = "example-space2"
  }
  spec {
    template_ref {
      name = "isolated-space"
    }
  }
}

resource "loft_virtual_cluster_instance" "example-vcluster" {

  metadata {
    namespace = "loft-p-default"
    name      = "example-vcluster2"
  }
  spec {
    owner {
      user = "admin"
    }
    template_ref {
      name = "isolated-vcluster"
    }
  }
}



