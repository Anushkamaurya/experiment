terraform {
  required_providers {
    google = {
      source = var.source
      version = var.version
    }
  }
}

provider "google" {
  credentials = file(var.cred-name)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "t_vpc_network" {
  name                    = var.network-name
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "t_subnet" {
  name          = var.subnet-name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.t_vpc_network.id
  depends_on    = [google_compute_network.t_vpc_network]
 
}

resource "google_compute_firewall" "t_firewall" {
  name    = var.fire-name
  network = google_compute_network.t_vpc_network.name

  allow {
    protocol = var.protocol[0]
  }

  allow {
    protocol = var.protocol[1]
    ports    = [var.ports[0] , var.ports[1]]
  }
  source_tags = [var.source-tags]  
}