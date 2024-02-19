# image de base
FROM debian:latest

ENV VIRTUAL_ENV=/opt/venv

# on copie l'app
COPY ./app_python /app

#on va dans le dossier de l app
WORKDIR /app

# on installe les dependances avec pip
RUN apt-get update && apt-get install -y --no-install-recommends \
python3-setuptools \
python3-pip \
python3-dev \
python3-venv \
apt-transport-https \
ca-certificates \
gnupg \
curl \
sudo

#on install gcloud-CLI
#RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-sdk -y


# on active venv car debian utlise pas par defaut pip
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade pip && pip install -r requirements.txt

#configurer Gcloud utilisateur

# on lance le serveur flask
EXPOSE 8080
CMD gunicorn -b 0.0.0.0:8080  "run:create_app()"
