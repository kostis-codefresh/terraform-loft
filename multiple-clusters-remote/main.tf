terraform {

  backend "kubernetes" {
    secret_suffix = "multiple-clusters-remote"
    config_path   = "~/.kube/config"
  }
  required_providers {
    loft = {
      source = "registry.terraform.io/loft-sh/loft"
    }
  }


}

provider "loft" {
  host       = var.loft_host
  access_key = var.loft_access_key
  insecure   = var.loft_insecure
}

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

  count = 5

  metadata {
    namespace = "loft-p-default"
    name      = "example-vcluster-${count.index}"
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



