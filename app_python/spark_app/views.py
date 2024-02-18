from flask import current_app, send_from_directory, render_template, request

app = current_app


@app.route("/robots.txt")
def static_from_root():
    return send_from_directory(app.static_folder, request.path[1:])


@app.route("/", methods=["GET", "POST"])
@app.route("/index/", methods=["GET", "POST"])
def index():
    return render_template("index.html")

@app.route("/Hello_start/",methods=["GET","POST"])
def hello_spark():
    # envoyer le job à faire mettre dans un bucket le discours de macron + le script python. faire une commande pour renvoyer le truc dans le bucket pyspark
    # os.system("")
    return render_template("job_send.html")

@app.route("/Hello_read/",methods=["GET","POST"])
def hello_read():
    # lire le bucket
    return render_template("job_read.html")
