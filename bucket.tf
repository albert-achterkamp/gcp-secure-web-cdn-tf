# Bucket to store website on GCP
resource "google_storage_bucket" "website" {
  provider = google
  #  name     = "p-57068-albert-website"
  name          = var.gcs_bucket
  location      = "US"
  force_destroy = true
}

# Make new objects public
resource "google_storage_default_object_access_control" "website_read" {
  bucket = google_storage_bucket.website.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket_object" "hello" {
  name   = "hello.html"
  source = "hello.html"
  #  bucket = "website"
  bucket = var.gcs_bucket
}
