terraform {
  backend "remote" {
    organization = "achterkamp"

    workspaces {
      name = "web_cdn_gcp"
    }
  }
}
