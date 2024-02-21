Ce dossier contient une application Flask.<br>

Vous avez .github/workflow/python-test-app qui effectue un test de qualité de code et des tests unitaires dans github action<br>

On est sur une application de type app factory. 

L'application utilise un fichier spark fourni par google dans un bucket pour faire un hello world.

WIP : pour rendre l'appli plus adaptable, des variables d'environnement sont créées mais pas (encore) utilisées.

Pyspark n'est pas installé sur cette application. On utilise Gcloud qui va envoyer directement le fichier python dans le dataproc.

https://cloud.google.com/sdk/gcloud/reference/dataproc/jobs/submit/pyspark