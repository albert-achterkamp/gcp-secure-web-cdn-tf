# Reserve an external IP
resource "google_compute_global_address" "website" {
  provider = google
  name     = "website-lb-ip"
}

resource "google_compute_global_address" "website_1" {
  provider = google
  name     = "website-lb-ip-1"
}

# Get the managed DNS zone
data "google_dns_managed_zone" "devops100_tk_zone" {
  provider = google
  name     = "devops100-tk-zone"
}

# Add the IP to the DNS
resource "google_dns_record_set" "website" {
  provider     = google
  name         = "github.${data.google_dns_managed_zone.devops100_tk_zone.dns_name}"
  type         = "A"
  ttl          = 300
  managed_zone = data.google_dns_managed_zone.devops100_tk_zone.name
  rrdatas      = [google_compute_global_address.website.address]
}

# Add the IP to the DNS
resource "google_dns_record_set" "website_1" {
  provider     = google
  name         = "www.${data.google_dns_managed_zone.devops100_tk_zone.dns_name}"
  type         = "A"
  ttl          = 300
  managed_zone = data.google_dns_managed_zone.devops100_tk_zone.name
  rrdatas      = [google_compute_global_address.website.address]
}

