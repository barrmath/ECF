from flask import current_app, send_from_directory, render_template, request
import os
app = current_app


@app.route("/robots.txt")
def static_from_root():
    return send_from_directory(app.static_folder, request.path[1:])


@app.route("/", methods=["GET", "POST"])
@app.route("/index/", methods=["GET", "POST"])
def index():
    return render_template("index.html")


@app.route("/Hello_start/", methods=["GET", "POST"])
def hello_spark():
    #envoyer le job 
    resultat = os.system("gcloud dataproc jobs submit pyspark gs://dataproc-examples/pyspark/hello-world/hello-world.py --cluster=dataproc-cluster --region=europe-west1")
    return render_template("job_send.html", resultat=resultat)

