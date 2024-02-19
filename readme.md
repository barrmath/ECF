Je stocke ici mes fichiers pour mon projet d'Évaluation en Cours de Formation (ECF) chez studi.<br>
Work In Progress<br>
<br>
arborescence : <br>
-terraform : dossier comprenant les ressources pour créer une BDD mongoDB et un serveur apache Spark<br>
-app_python : contient l'application spark
LICENSE : la licence du git (GPL3)<br>
readme.md : ce readme<br>
<br>

## Bloc 1: 
<br>
Pour deployer l'infra (plus de details dans le déploiement dans le fichier readme du dossier):<br>
<br>

```bash
cd terraform
terraform init
terraform validate
terraform plan
terraform apply
```

## Bloc 2 :<br>
<br>
un fichier .github/workflow/python-test-app.yml fait les tests unitaires sur la branche dev_App<br>
un fichier cloudbuild.yaml va créer une image docker dans artifact registry<br>
avec bien sur l'aide d'un fichier Dockerfile<br>
un fichier cloudbuild.yaml va deployer l image docker dans cloud run.<br>
<br>
GCP a été configuré pour les éxécuter automatiquement (cloud build trigger). et les permissions ont été accordés à cloud build pour utiliser cloud run.

## bloc 3 :