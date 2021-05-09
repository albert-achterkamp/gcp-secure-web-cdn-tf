variable "gcp_svc_key" {}
variable "gcp_project" {}
variable "gcp_region" {}
variable "folder_path" {
  type        = string
  description = "Path to your folder"
}
variable "gcs_bucket" {
  type        = string
  description = "Your GCS bucket"
}
