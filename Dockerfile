# Utilisation de l'image Python officielle comme base
FROM python:3.9-slim

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers de requirements et installation des dépendances
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copie du reste du code
COPY . /app/

# Copie des fichiers de configuration
RUN python manage.py collectstatic --noinput

# Exposition du port 8000
EXPOSE 8000

# Commande pour démarrer l'application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "oc_lettings_site.wsgi:application"]
