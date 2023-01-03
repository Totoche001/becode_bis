ssh machin@IPMACHIN
ssh machin@IPMACHIN -p 12345
ssh -i /mondossier/id_rsa machin@IPMACHIN

# Accès à distance à la console en ligne de commande (shell ssh)

Pour ouvrir une session distant ayant un serveur SSH, vous devez écrire quelque chose comme ceci :

`ssh <nom_utilisateur>@<ipaddress> -p <num_port>`

Exemple :

`ssh phyrex@192.168.23.42 -p 12345`

L'option -p <num_port> qui précise le port utilisé par le serveur est facultative. Si rien n'est précisé, c'est le port 22 qui sera utilisé par défaut (protocole TCP).

Pour se connecter avec SSH en IPV6 depuis un terminal, écrire sans crochet :

`ssh -6 <nom_utilisateur>@<adresse ipv6>` 

Exemple : par exemple pour un lien Internet :

`ssh -6 alfred@2a01:e35:2431::2e57`

# Affichage graphique déporté (Tunneling serveurX par ssh) - Accéder aux applications graphiques

La commande ssh offre une fonctionnalité intéressante: la possibilité d'exécuter des applications X-Window à distance, ce qui est bien pratique pour travailler à distance, partager une machine ou simplement effectuer des tâches d'administration.

Il suffit de passer l'option -X à ssh :

`ssh -X nomtilisateur@Ipserver`

L'option -X permet le déport d'applications X-Window (affichage graphique à distance). Cette possibilité est offerte grâce aux fonctions de tunneling réseau présentes dans SSH. N'oubliez pas qu'Ubuntu (Unix en général) est un système d'exploitation client/serveur, ce qui s'applique aussi à l'affichage géré par X-Window.

Et on peut lancer :

`nomUtilisateur@Ipserver$ xeyes`

là, l’œil de Moscou vous regarde depuis votre écran local !
N.B. : pour que cet exemple fonctionne il faut que le paquet x11-apps qui fournit xeyes soit installé sur le serveur. 

# Transfert - copie de fichiers

Pour copier un fichier à partir d'un ordinateur sur un autre avec SSH, vous devrez utiliser la commande scp ou rcp. Cela ressemblera à ceci :

`scp <fichier> <username>@<ipaddressDistant>:<DestinationDirectory>`

et en IPv6

`scp -6 <élément> <nom>@[addresse ipv6]:<destination>`

Exemples

Pour un fichier:

`scp fichier.txt hornbeck@192.168.1.103:/home/hornbeck`

et en IPv6

`scp -6 fichier.txt albertine@[2a01:e35:2431::2a34]:/home/albertine`

Pour un répertoire:

`scp -r répertoire hornbeck@192.168.1.103:/home/hornbeck/`

et en IPv6

`scp -6r répertoire/ albertine@[2a01:e35:2431::2a34]:/home/albertine`

Vous pouvez aussi bien copier des fichiers à partir des ordinateurs à distance sur votre disque local :

`scp hornbeck@192.168.1.103:/home/hornbeck/urls.txt .`

Ici, le point . à la fin de commande indique de copier le fichier dans le répertoire courant.
Pour les noms avec des espaces : de distant vers local

`$ scp utilisateur@12.345.678.90:"le\ fichier" .`
`$ scp utilisateur@12.345.678.90:'"le fichier"' .`  
`# Notez les simples ' ET doubles " guillemets ' "`



on host sample.ssh.com, type the following command at a shell prompt:

ssh sample.ssh.com  ls /tmp/doc