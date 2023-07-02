#!/bin/bash

# Charger les variables d'environnement à partir du fichier .env
export $(cat .env | xargs)

# Lancement du conteneur MySQL avec Docker
docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=votre_mot_de_passe -p 3306:3306 -d mysql

# Attendre que le conteneur MySQL soit prêt
echo "En attente du démarrage du conteneur MySQL..."
sleep 10

# Démarrage du backend Express.js
cd back-end
node server.js &

# Démarrage du frontend Angular
# cd ../front-end
# npm start