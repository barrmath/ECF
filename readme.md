Je stocke ici mes fichiers pour mon projet d'Évaluation en Cours de Formation (ECF) chez studi.<br>
Work In Progress<br>
<br>
arborescence : <br>
-terraform : dossier comprenant les ressources pour créer une BDD mongoDB et un serveur apache Spark<br>
-app_spark : contient l application (templates, route ...)
LICENSE : la licence du git (GPL3)<br>
readme.md : ce readme<br>
<br>
Pour deployer l infra :<br>1
crée un fichier variables.tf
```bash
cd terraform
touch variable.tf
```
mettre les variables project, region et zone
 
exemple :<br>
variable "project"{<br>
    type = string<br>
    default = "Mon_projet_google_cloud"<br>
}
