from flask import Flask


def create_app():
    app = Flask(__name__, static_folder="static")

    app.config.from_object("config")

    # routage des pages web

    with app.app_context():
        import spark_app.views

    return app
