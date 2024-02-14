# mettre la config de Flask Ici
from dotenv import load_dotenv
import os

load_dotenv()

# ajouter project_id, region, cluster_name
PROJECT_ID = os.getenv("projet_id")
REGION = os.getenv("region")
CLUSTER_NAME = ("cluster_name")
