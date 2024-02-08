# IAAC bloc 1
fichier présent :<ul>
  <li>main.tf : contient les resssources à créer</li>
  <li>output.tf : permets de faire sortir des variables</li>
  <li>provider.tf : contient les information sur les fournisseurs clouds</li>
  <li> variables.tf : contient les blocs variables</li>
<br>
Vous pouvez créer un fichier de variable.<br>
exemple.tfvars<br>
```
region                      = Région_pour_GCP 
zone                        = Zone_pour_GCP
project                     = ID_projet_GCP

mongodbatlas_private_key    = votre_clé_privée_pour_mongoDB
mongodbatlas_public_key     = votre_clé_publique_pour_mongoDB

mongo_project_id            = ID_projet_mongoDB
atlas_provider_name         = Fournissseur_pour_mongoDB(GCP,AWS-AZURE)
provider_instance_size_name = Taille_d_instance_M0_M2_...
clusterDBname               = Votre_nom_de_cluster
atlasregion                 = Region_mongoDB
```
<br>
Pour lancer :<br>
```
terraform init
terraform validate
terraform plan -var-file example.tfvars
terraform apply -var-file example.tfvars
terraform output
```