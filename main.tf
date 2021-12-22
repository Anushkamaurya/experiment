provider "google" {
  credentials = file(var.cred-name)
  project = var.project
}
resource "google_storage_bucket" "bucket" {
  name     = var.bucket-name
  location = var.location
}