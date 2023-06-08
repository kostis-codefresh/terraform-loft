variable "loft_host" {
  type        = string
  default     = "https://loft.tf-demo.sales-dev.codefresh.io"
  description = "The Loft instance host"
}

variable "loft_access_key" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The Loft access key."
}

variable "loft_insecure" {
  type        = bool
  default     = true
  description = "Allow login into an insecure Loft instance"
}

