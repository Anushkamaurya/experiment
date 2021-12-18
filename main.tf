terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.4.0"
    }
  }
}

provider "google" {
  credentials = file("mylearning-331213-21e283592fa8.json")

  project = "mylearning-331213"
  region  = "asia-south1"
  zone    = "asia-south1-a"
}

resource "google_compute_network" "t_vpc_network" {
  name                    = "terra_network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "t_subnet" {
  name          = "terra-subnetwork"
  ip_cidr_range = "192.168.0.0/20"
  region        = "asia-south1"
  network       = google_compute_network.t_vpc_network.id
  depends_on    = [google_compute_network.t_vpc_network]
 
}

resource "google_compute_firewall" "t_firewall" {
  name    = "terra-firewall"
  network = google_compute_network.t_vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_tags = ["web"]  
}