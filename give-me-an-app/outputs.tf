

data "kubernetes_secret" "vcluster_kubeconfig_prod" {
  metadata {
    name      = "vc-${helm_release.target_vcluster_prod.name}"
    namespace = helm_release.target_vcluster_prod.namespace
  }
}

data "kubernetes_secret" "vcluster_kubeconfig_qa" {
  metadata {
    name      = "vc-${helm_release.target_vcluster_qa.name}"
    namespace = helm_release.target_vcluster_qa.namespace
  }
}

data "kubernetes_secret" "vcluster_kubeconfig_staging" {
  metadata {
    name      = "vc-${helm_release.target_vcluster_staging.name}"
    namespace = helm_release.target_vcluster_staging.namespace
  }
}

# output "kube_config_client_authority" {
#   value = data.kubernetes_secret.vcluster_kubeconfig.data.certificate-authority
#   sensitive = true
# }

# output "kube_config_client_cert" {
#   value = data.kubernetes_secret.vcluster_kubeconfig.data.client-certificate
#   sensitive = true
# }

# output "kube_config_client_key" {
#   value = data.kubernetes_secret.vcluster_kubeconfig.data.client-key
#   sensitive = true
# }



# resource "local_sensitive_file" "prod_kube_config_file" {
#   content  = data.kubernetes_secret.vcluster_kubeconfig_prod.data.config
#   filename = "kubeconfig_prod.yaml"
# }

# resource "local_sensitive_file" "qa_kube_config_file" {
#   content  = data.kubernetes_secret.vcluster_kubeconfig_qa.data.config
#   filename = "kubeconfig_qa.yaml"
# }

# resource "local_sensitive_file" "staging_kube_config_file" {
#   content  = data.kubernetes_secret.vcluster_kubeconfig_staging.data.config
#   filename = "kubeconfig_staging.yaml"
# }