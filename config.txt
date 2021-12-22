terraform {
  backend "gcs" {
    bucket  = "myfirst-terra-bucket"
    credentials = file(var.cred-name)
    prefix  = "terraform/state"
  }
}