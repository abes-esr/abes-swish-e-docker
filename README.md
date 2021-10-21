# abes-swish-e-docker

Ce dépôt contient la configuration spécifique aux besoin Abes pour [le moteur de recherche de son guide méthodologique](http://documentation.abes.fr/cgi-bin/swish.cgi).

Il utilise l'image docker générique [swish-e-docker](https://github.com/abes-esr/swish-e-docker) et génère un conteneur personnalisé pour les besoins de l'Abes.

## Installation du moteur de recherche du GM

```
# on commence par clonner le dépôt git qui contient toute la conf abes
cd /opt/pod/
git clone https://github.com/abes-esr/abes-swish-e-docker.git

# ensuite on démarre le serveur web du moteur de recherche du GM
cd /opt/pod/abes-swish-e-docker/
./scripts/dockerRunGm-swish.sh

# ensuite on lance une première indexation des fcher HTML, DOC, PDF (...) du guide méthodo
# attention cette opération est indispensable lors d'une première installation (création des fichiers *.prop) et peut être un peu longue
# le contenu indexé est positionné ici : /var/www/html/guide/html/
cd /opt/pod/abes-swish-e-docker/
./scripts/dockerExecIndexerGM.sh

```


## Démarrage/arrêt du moteur de recherche du GM

Une fois le moteur de recherche installé, un conteneur docker tourne sur la machine avec le nom `gm-swish` on peut alors facilement le stopper, le relancer ou observer ses logs :

```
docker stop gm-swish
docker start gm-swish
docker logs -f --tail 100 gm-swish
```

## Exemple de crontab pour la mise à jour des index

Tous les jours à 19:30 les index sont mis à jour.
```
#          Daily updating swish-e indexes
#
30 19 * * *  cd /opt/pod/abes-swish-e-docker/scripts ; ./dockerExecIndexerGM.sh > dockerExecIndexerGM.log 2>&1
```