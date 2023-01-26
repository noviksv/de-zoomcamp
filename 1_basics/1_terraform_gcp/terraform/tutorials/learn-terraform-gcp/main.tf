terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("/mnt/c/Users/Sergey/Downloads/inlaid-citron-374612-12830d4c8d6c.json")

  project = "inlaid-citron-374612"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
