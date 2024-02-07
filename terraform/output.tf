#commenter lors de test mongo db

output "dataproc_cluster_id" {
  value = google_dataproc_cluster.cluster.id
}

output "dataproc_cluster_url" {
  value = "https://console.cloud.google.com/dataproc/clusters/${google_dataproc_cluster.cluster.name}/monitoring?region=${var.region}&project=${var.project}"
}