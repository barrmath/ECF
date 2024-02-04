
provider "google" {
#  project = "ecf-studi-413016"
#  region  = "europe-west1"
#  zone    = "europe-west1-b"
project = var.project
region = var.region
zone = var.zone
}

/*
configuration reseaux inspiré par le tuto :
https://cloud.google.com/docs/terraform/get-started-with-terraform?hl=fr
*/
resource "google_compute_network" "vpc_network"{
  name                    = "my-custom-mode-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "default" {
  name          = "my-custom-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.id
}


resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

#creation ressource BDD
resource "google_compute_instance" "default"{
  name         = "mongodb-community"
  machine_type = "e2-micro"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image="ubuntu-os-cloud/ubuntu-minimal-2310-amd64"
    }
  }
  #install mongoDB_communty_server
  #metadata_startup_script = "wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc |sudo apt-key add -;echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/debian bookworm/mongodb-org/5.0 main' | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list;sudo apt update;sudo apt install -y mongodb-org;sudo systemctl enable mongod;sudo systemctl status mongod"

  network_interface {
     subnetwork = google_compute_subnetwork.default.id

     access_config {
      #include this section to give VM an external ip address
     }
   }
}

#creation resource spark
# inpiration : https://www.pulumi.com/ai/answers/qs7TPyHrtjnwYno8mYu1xY/managing-gcp-dataproc-spark-and-hadoop-with-terraform

resource "google_dataproc_cluster" "cluster" {
  name    = "dataproc-cluster"
  region = var.region

  cluster_config {
    master_config {
      num_instances   = 1
      machine_type    = "n1-standard-2"
      disk_config {
        boot_disk_size_gb = 30
      }
    }

    worker_config {
      num_instances   = 2
      machine_type    = "n1-standard-2"
      disk_config {
        boot_disk_size_gb = 30
      }
    }
  }
}

output "dataproc_cluster_id" {
  value = google_dataproc_cluster.cluster.id
}

output "dataproc_cluster_url" {
  value = "https://console.cloud.google.com/dataproc/clusters/${google_dataproc_cluster.cluster.name}/monitoring?region=${var.region}&project=${var.project}"
}