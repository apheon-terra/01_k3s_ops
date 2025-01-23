terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.51.0"
      # version = "~> 3.11.0"
    }

    # kubernetes = {
    #   source  = "hashicorp/kubernetes"
    #   version = "~> 2.9.0"
    # }

    http = {
      source  = "hashicorp/http"
      version = "~> 3.4.0"
    }
    random = {
      version = "~> 3.5.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
}

provider "cloudflare" {
  email   = local.cloudflare_email
  api_key = local.cloudflare_api_key
  # api_token = local.cloudflare_token
}


data "http" "public_ipv4" {
  url = "https://ipv4.icanhazip.com"
}

# data "http" "public_ipv6" {
#   url = "https://ipv6.icanhazip.com"
# }



data "cloudflare_zone" "domain" {
  name = "alpheon.uk"
}

# only with api_token
# data "cloudflare_api_token_permission_groups" "all" {}


# provider "kubernetes" {
#   # Use KUBE_CONFIG_PATH environment variables
#   # Or in cluster service account
# }
