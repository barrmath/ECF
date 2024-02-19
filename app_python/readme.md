Ce dossier contient une application Flask.<br>
Vous avez un Dockerfile qui permets de construire une image docker ou podman.<br>
Vous avez .github/workflow/python-test-app qui effectue un test de qualité de code et des test unitaire dans github action<br>
vous avez le fichier cloubuild.yaml qui vous permets de mettre l'image dans un depot artifact repository avec la commande suivante :<br>

'''bash
gcloud builds submit --region=votre_region --config cloudbuild.yaml  
'''

ou configurer un trigger 