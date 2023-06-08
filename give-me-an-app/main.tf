terraform {

  backend "kubernetes" {
    secret_suffix = "create-app"
    config_path   = "~/.kube/config"
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

}
provider "kubernetes" {
  config_path = "~/.kube/config"
}