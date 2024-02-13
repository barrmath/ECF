#project_id, region, cluster_name

output "dataproc_cluster_id" {
  value = google_dataproc_cluster.cluster.id
}


output "projet_id" {
  value = var.project
}

output "region"{
  value = var.region
} 

output "cluster_name"{
  value = google_dataproc_cluster.cluster.name
}

#output "dataproc_cluster_url" {
#  value = "https://console.cloud.google.com/dataproc/clusters/${google_dataproc_cluster.cluster.name}/monitoring?region=${var.region}&project=${var.project}"
#}