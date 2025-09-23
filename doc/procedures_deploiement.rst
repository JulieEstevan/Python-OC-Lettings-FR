.. _procedures_deploiement:

Procédures de Déploiement et de Gestion
========================================

Cette section décrit les processus de déploiement et de gestion de l'application Orange County Lettings, en utilisant GitHub Actions pour l'intégration et la livraison continues (CI/CD), Docker pour la conteneurisation, et Render pour le déploiement.

Déploiement
-----------

- **Configuration de Django pour la Production** :
  - Assurez-vous que `DEBUG` est défini sur `False` et que les `SECRET_KEY` et autres variables sensibles sont définies en utilisant des variables d'environnement.
  - Configurez les fichiers statiques et les médias pour la production en utilisant une librairie python comme Whitenoise.

- **Configuration du Pipeline CI/CD** :
  - Le fichier `.github\workflows\ci_cd.yml` du projet contient la configuration du pipeline.
  - À chaque push sur le repository, GitHub Actions exécute les tests automatisés et vérifie que le code respecte les standards de qualité.
  - Si le push est effectué sur la branche principale, et que les tests passent, le pipeline déploie automatiquement l'application sur Render.

- **Création de l'Image Docker** :
  - Le `Dockerfile` à la racine du projet définit les étapes de création de l'image Docker de l'application.
  - Utilisez la commande `docker build` pour créer une image de l'application.
  - Poussez l'image vers un registre Docker comme Docker Hub ou GitHub Container Registry avec `docker push`.

- **Déploiement Automatisé** :
    - Configurez un compte Render et créez un nouveau service web.
    - Connectez votre image Docker publique à Render.
    - Configurez les variables d'environnement nécessaires dans le tableau de bord Render.
    - Render détectera automatiquement les changements dans la branche principale et déploiera la nouvelle version de l'application.

Maintenance et Mises à Jour
---------------------------

**Maintenance Régulière**
- Surveillez régulièrement les performances et les journaux d'erreurs sur Heroku pour identifier et résoudre les problèmes.
- Mettez à jour les dépendances régulièrement pour garantir la sécurité et l'efficacité de l'application.

**Processus de Mise à Jour**
- Testez toutes les mises à jour en local ou dans un environnement de staging avant de les déployer en production.
- Utilisez les Pull Requests sur GitHub pour examiner les modifications de code et les faire valider par l'équipe avant de les fusionner dans la branche principale.
- Assurez-vous que GitHub Actions réussit à construire et tester les modifications avant de déployer sur Render.

Ce guide fournit un aperçu des étapes essentielles pour déployer et maintenir l'application Orange County Lettings. Ces procédures devraient être adaptées en fonction des spécificités de votre environnement de production et des besoins de votre équipe.