terraform {
  cloud {
    organization = "phmelomorais-terraform"

    workspaces {
      name = "ph-dev"
    }
  }
}

