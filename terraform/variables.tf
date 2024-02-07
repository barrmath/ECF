variable "region" {
    description = "Region voulue"
    type        = string    
}

variable "zone" {
    description = "Zone voulue"
    type        = string  
}

variable "project"{
    description = "nom du project"
    type = string
}

variable "mongodbatlas_private_key" {
    description = "clé privé"
    type = string
}

variable "mongodbatlas_public_key" {
    description = "clé publique"
    type = string
}

variable mongo_project_id{
    description = "Nom du projet mongoDB"
    type        = string
}

variable atlas_provider_name{
    description = "Nom du provider pour mongoDB atlas"
    type        = string
}

variable atlasregion{
    description = "les regions Atlas sont différentes des regions du providers : https://www.mongodb.com/docs/atlas/reference/google-gcp/"
    type        = string
}

variable atlas_instance_size_name{
    description = "type de machine mongoDBatlas"
    type        = string
    default     = "M0"
}

variable clusterDBname{
    description = "Nom du cluster de la BDD"
    type        = string
    default     = "cluster_0"
}