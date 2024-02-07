provider "google" {
project = var.project
region = var.region
zone = var.zone
}

#module fournie par mongoDB pour mongoDBatlas
terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.15.0"
    }
  }
}

provider "mongodbatlas" {
  public_key = var.mongodbatlas_public_key
  private_key  = var.mongodbatlas_private_key
}