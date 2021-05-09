terraform {
  backend "remote" {
    organization = "achterkamp"

    workspaces {
      name = "gh-actions-gcp"
    }
  }
}
