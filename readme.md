Je stocke ici mes fichiers pour mon projet d'Évaluation en Cours de Formation (ECF) chez studi.<br>
Work In Progress<br>
<br>
arborescence : <br>
-terraform : dossier comprenant les ressources pour créer une BDD mongoDB et un serveur apache Spark<br>
-app_python : contient l'application spark
LICENSE : la licence du git (GPL3)<br>
readme.md : ce readme<br>
<br>
Pour deployer l'infra :<br>1
<br>
```bash
cd terraform
terraform init
terraform validate
terraform plan
terraform apply
```
