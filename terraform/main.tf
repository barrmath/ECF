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
  # modifier pour un projet stable. Durant le développement j'était "sans IP fixe"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

# creation resource spark
# inspiration : https://www.pulumi.com/ai/answers/qs7TPyHrtjnwYno8mYu1xY/managing-gcp-dataproc-spark-and-hadoop-with-terraform
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


# création cluster mongodbatalas
# https://github.com/mongodb/terraform-provider-mongodbatlas/tree/master/examples/mongodbatlas_cluster/nvme-upgrade

resource "mongodbatlas_cluster" "cluster" {
  project_id                  = var.mongo_project_id
  name                        = var.clusterDBname
  cluster_type                = "REPLICASET"
  backup_enabled = false
  provider_name = var.atlas_provider_name
  backing_provider_name = var.atlas_backing_provider_name
  provider_region_name = var.atlasregion
  provider_instance_size_name = var.atlas_instance_size_name
}

# DATABASE USER
resource "mongodbatlas_database_user" "user1" {
  username           = var.dbuser
  password           = var.dbpassword
  project_id         = var.mongo_project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = var.database_name
  }
  labels {
    key   = "API_goldenline"
    value = "DB User1"
  }

  scopes {
    name = mongodbatlas_cluster.cluster.name
    type = "CLUSTER"
  }
}

#output "user1" {
#  value = mongodbatlas_database_user.user1.username
#}