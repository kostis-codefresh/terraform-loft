terraform {
  backend "kubernetes" {
    secret_suffix = "create-pipelines"
    config_path   = "~/.kube/config"
  }

  required_providers {
    codefresh = {
      source  = "codefresh-io/codefresh"
      version = "0.3.1"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


provider "codefresh" {
  api_url = var.api_url  # or `CODEFRESH_API_URL`
  token   = var.cf_token # or `CODEFRESH_API_KEY`
}

provider "github" {
  token = var.gh_token # or `GITHUB_TOKEN`
}

