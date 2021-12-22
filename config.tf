terraform {
  backend "gcs" {
    bucket  = "myfirst-terra-bucket"
    prefix  = "terraform/state"
  }
}