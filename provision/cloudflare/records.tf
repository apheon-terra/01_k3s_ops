# To use Cloudflare's Provisioning API capabilities requires enablement by Cloudflare. Reach out to partners@cloudflare.com for more information.
# resource "cloudflare_account" "main" {
#   name              = "My main Cloudflare Account"
#   # type              = "standard"
#   # enforce_twofactor = false
# }


resource "cloudflare_record" "apex" {
  name    = "ingress"
  zone_id = data.cloudflare_zone.domain.id
  value   = chomp(data.http.public_ipv4.response_body)
  proxied = true
  type    = "A"
  ttl     = 1
}


resource "cloudflare_record" "uptimerobot_status" {
  name    = "status"
  zone_id = data.cloudflare_zone.domain.id
  value   = "stats.uptimerobot.com"
  proxied = false
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "root" {
  name    = "alpheon.uk"
  zone_id = data.cloudflare_zone.domain.id
  value   = "ingress.alpheon.uk"
  proxied = true
  type    = "CNAME"
  ttl     = 1
}
