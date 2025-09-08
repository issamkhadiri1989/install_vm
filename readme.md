# Installation de l'environnement!

Ce guide vous permettra d'installer votre environnement de travail rapidement et facilement.


# Pré-requis

Avant de commencer, il est important d'avoir une machine virtuelle connectée à Internet et fonctionnant sur une distribution Linux. De préférence **Ubuntu** ou **Debian**, car les commandes contenues dans les fichiers **.sh** sont destinées à ces distributions.

Télécharger ce repo dans votre ordinateur, puis dézippez-le dans l'endroit de votre choix. Les étapes suivantes seront à exécuter dans la racine de ce projet.

# Installation 
## Outils nécessaires

Cette section vous guidera à installer votre environnement de travail. 

## 1. install.sh

Ce script vous permettra d'installer les outils nécessaires pour le développement, particulièrement :

- VS CODE
- MAKE 
- DOCKER / DOCKER COMPOSE 
- GIT

Ce script est à lancer en *SUDO* :
```
sudo chmod +x install.sh // pour attribuer les droits d'exécution
sudo ./install.sh
```
Après que l'installation se termine, vous auriez:

- VS CODE ✅
- Docker & Docker Compose  ✅
- Git ✅
- Make ✅

### Installer VS CODE
l'éditeur de code VSCODE vient d'être installé. Mais il n'est pas bien configuré. Afin de faciliter le développement Symfony avec VSCode, il faut installer des extensions supplémentaires. 

Ces extensions sont listées dans https://github.com/issamkhadiri1989/install_vm/blob/main/vsccode/extensions.list . Afin de vous faciliter la tâche, vous pouvez lancer le fichier  https://github.com/issamkhadiri1989/install_vm/blob/main/vsccode/extensions.sh . 

⚠️ Note : Le fichier extensions.sh à ne pas installer en *SUDO*. Il faut juste lui attribuer les droits d'exécution et lancer le script

```
sudo chmod +x .extensions.sh
./extensions.sh
```

## 2. Installer le projet Symfony

Une fois l'étape 1 est terminée, il est temps d'installer et lancer le projet  `Symfony`. Pour cela, il faut lancer les commandes suivantes: 
```
sudo chmod +x ./init_projects.sh
sudo ./init_project.sh
```
Le script `init_project.sh` va
-  cloner le projet depuis https://github.com/issamkhadiri1989/empty_symfony_project
- démarrer les container Docker
- installer la base de données
- préparer et démarre le projet Symfony 

Pour vérifier que vous va bien, visitez http://localhost vous devez voir la page d'accueil de Syfmony


## Contenu du projet 

Vous allez travailler avec :

- PHP 8.3 (et les extensions nécessaires: pdo, mysql, apcu ...)
- NGINX
- Symfony 7.3
- MySQL
- Docker
- Composer
- Make Gnu



