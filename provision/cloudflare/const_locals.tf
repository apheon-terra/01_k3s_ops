data "sops_file" "infra_secret" {
  source_file = "secret.sops.yaml"
}


#- cloudflare
locals {
  cloudflare_email   = data.sops_file.infra_secret.data["secret_cloudflare_email"]
  cloudflare_api_key = data.sops_file.infra_secret.data["secret_cloudflare_api_key"]
  # cloudflare_home_zone_id = data.sops_file.infra_secret.data["secret_cloudflare_home_zone_id"]
  cloudflare_account_id = data.sops_file.infra_secret.data["secret_cloudflare_account_id"]
  cloudflare_domain     = data.sops_file.infra_secret.data["secret_cloudflare_domain"]
  cloudflare_zone_id    = data.sops_file.infra_secret.data["secret_cloudflare_zone_id"]
  email_domain          = data.sops_file.infra_secret.data["secret_email_domain"]

  gsuite_client_id = data.sops_file.infra_secret.data["secret_gsuite_client_id"]
  gsuite_secret    = data.sops_file.infra_secret.data["secret_gsuite_client"]
  cloudflare_token = data.sops_file.infra_secret.data["secret_cloudflare_token"]

}

#- static
locals {
  home_ipv4 = data.sops_file.infra_secret.data["secret_home_ipv4"]
}
