
[Cracker un logiciel java](https://pro-domo.ddns.net/blog/crack-programme-java-vidal.html)

# Cracker un logiciel écrit en Java (Vidal 2013)

  Lex


  
    8-10 minutes
---




  Voici
un tuto démontrant les méthodes de cracking d'applications en java. Ces
applications se repèrent par leurs archives dont l'extension est en
*.jar (voire *.apk pour Android).

Je n'entrerai pas dans les
détails et irai au plus simple en me contentant de donner les pistes de
recherches pour aviser dans les cas alternatifs.

La démonstration
se fera sur un logiciel peu protégé mais dont le crack n'existe pas
vraiment. Il s'agit du logiciel VIDAL (2012/2013 ici); C'est un logiciel
médical français rassemblant l'ensemble des « résumés des
caractéristiques du produit » des médicaments fabriqués par les
laboratoires pharmaceutiques. Une nouvelle version majeure sort tous les
ans, et une version mineure sort tous les trimestres. Chaque version a
une date limite d'utilisation qui sous couvert de sécurité, incite par
la force, le rachat du logiciel par le corps médical et éventuellement
par les étudiants.

Bref, les étudiants et autres n'ont pas besoin
d'une monographie mise à jour de façon trimestrielle. Voici donc le
moyen de passer cette foutue limitation.

Page web avec plus de détails et ayant servi de source d'inspiration => [http://www.jmdoudoux.fr/java/dej/chap-decompil.htm](http://www.jmdoudoux.fr/java/dej/chap-decompil.htm).

## Sommaire:

* [Sommaire:](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-programme-java-vidal.html#sommaire)
* [Fichier JAR - A propos &amp; décompression](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-programme-java-vidal.html#fichier-jar-a-propos-decompression)
* [Décompilation des class](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-programme-java-vidal.html#decompilation-des-class)
* [Analyse de la décompilation](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-programme-java-vidal.html#analyse-de-la-decompilation)
* [Crack](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-programme-java-vidal.html#crack)
  * [1 : Recompilation](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-programme-java-vidal.html#1-recompilation)
  * [2 : Analyse du binaire (.class) via désassembleur/debugger](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-programme-java-vidal.html#2-analyse-du-binaire-class-via-desassembleurdebugger)
* [Patch du binaire](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-programme-java-vidal.html#patch-du-binaire)

## Fichier JAR - A propos & décompression

Jar
est en fait un fichier Zip contenant les classes java compilées. Ces
classes ont une extension en *.class; Elles sont compilées à partir des
sources en *.java, par l'utilitaire "javac" fournit dans le JAVA JDK
(Java Developpement Kit), (non nécessaire ici), qu'on peut installer ([disponible ici](http://www.oracle.com/technetwork/java/javase/downloads/index.html)).

Certains
fichiers Jar sont signés (ce n'est pas le cas dans notre exemple), et
la moindre modification entrainera un plantage du logiciel. C'est le cas
pour les apk d'Android qui sont des jar renommés.

Pour contourner
le problème, la solution se situe encore dans le Java Developpement
Kit. Il suffit de générer soit-même des clés et de signer soit-même le
jar.

Les utilitaires sont : *keytool* et *jarsigner* .

## Décompilation des class

Les fichiers *class*
sont d'autant plus remarquables que leur code source peut être obtenu
facilement avec un processus de décompilation. Le debugger n'est donc
pas l'outil privilégié pour cracker ces logiciels puisqu'on a le code
source sous les yeux.

Je cite :

> *La
> décompilation est possible parce que la compilation du code source ne
> produit pas du code machine binaire mais produit du bytecode qui est un
> langage indépendant de toute plate-forme. Lors de son exécution, le
> bytecode peut être interprété ou compilé en code machine. Le format du
> bytecode est assez proche du code source, ce qui permet de réaliser une
> décompilation relativement facilement notamment pour ce qui concerne la
> logique des traitements.*

Un outil de décompilation parmi d'autres : [JAD (Java Decompiler)](http://varaneckas.com/jad/),
"DJ Java decompiler" (à cracker), lui, est presque un véritable environnement de programmation.

Extraction des class: ![winrar jar file](https://pro-domo.ddns.net/blog/extra/3/012.jpg "winrar jar file")

Commande pour décompiler tout le dossier provenant du jar: ![jad command](https://pro-domo.ddns.net/blog/extra/3/013.jpg "jad command")

```
$ jad -s java -d src -r com/**/*.class
```
Dans l'ordre: Donner l'extension `.java` aux fichiers décompilés et les placer dans le dossier `src` placé à coté du dossier `com` contenant les fichiers `class`.

Des
erreurs de décompilation peuvent survenir. Tout le code n'est pas
forcément produit mais dans notre cas en tout cas l'essentiel est
obtenu. Parfois le code est obfusqué. Les noms des classes, méthodes,
variables, textes sont modifiés. Le tout pour rendre presque
incompréhensible le résultat d'une décompilation.

Ce n'est pas le cas ici. Poursuivons.

## Analyse de la décompilation

On
va rechercher ici ce qui nous intéresse... Il s'agit de cracker un
système basé sur des dates. Supposons que les méthodes et variables
gérant cela comportent le mot "date" dans leurs noms :p

J'utilise
le logiciel gratuit "Agent Ransack" pour faire ces recherches dans les
fichiers obtenus. Bien meilleur et plus rapide que la recherche moisie
de Windows, voilà ce qu'il nous donne:

![Agent Ransack utilisation](https://pro-domo.ddns.net/blog/extra/3/017.jpg "Agent Ransack utilisation")

Rapidement j'identifie une zone très intéressante (marquée en rouge).

Ouvrons donc le fichier: ![DateOfKillCheckerImpl.java](https://pro-domo.ddns.net/blog/extra/3/018.jpg "DateOfKillCheckerImpl.java")

La méthode `checkDateOfKillStatus()`
est TRES parlante. Plusieurs tests sont réalisés. Selon le résultat de
ces tests, d'autres tests sont faits ou pas. Le but de l'ensemble est de
renvoyer une valeur d'une énumération adaptée: `KO, WARNING, STILL_OK, OK`.

Une
seconde méthode juste en dessous est aussi parlante. On pourrait
imaginer renvoyer systématiquement une valeur négative pour espérer
bénéficier d'une activation permanente.
Après essai, il n'en est
rien. Quelque soit la valeur retournée, je n'ai pas réussi à modifier le
comportement du logiciel comme cela.

Bref, il faut garder en tête que la compréhension totale des fonctions *n'est pas absolument*
nécessaire. Il ne s'agit pas de la vérification de la validité d'un
fichier de licence ou d'une clé d'activation; Ici c'est basique, il faut
que `checkDateOfKillStatus()` renvoie toujours OK vous l'avez compris..

## Crack

2 écoles ici.

### 1 : Recompilation

Pour les petits projets vous pouvez directement modifier le code et recompiler avec l'utilitaire *javac* présent dans le JDK.

Exemple:

```
$ javac -cp .;c:\Progra~1\Java\jdk1.5.0_17\lib;C:\app newfile.java
```
Seulement ici, le projet est plutôt conséquent,
l'utilisation de javac va être complexe, et on va rapidement avoir
besoin d'importer le projet dans un IDE (logiciel de développement) de
type Eclipse.

Je n'aime pas le Java, je n'aime pas Eclipse, je
n'ai pas le temps de réapprendre à m'en servir et j'ai besoin de cracker
ce machin rapidement..

### 2 : Analyse du binaire (.class) via désassembleur/debugger

La
méthode est très similaire à celle utilisée pour cracker une
application normale (.exe sous windows). On va utiliser l'excellent
logiciel [IDA, produit par Hex-Rays](https://www.hex-rays.com/products/ida/index.shtml).

Payant mais *trouvable sur le net* ,
il permet de visualiser graphiquement le code assembleur. L'outil rêvé
de toute personne allergique aux désassembleurs comme OllyDbg qui ne
permettent pas d'avoir un aperçu graphique structuré des fonctions d'un
programme. Notez que à mon goût, IDA ne se substitue pas à OllyDbg.

Voici donc la zone de notre code java, désassemblée par IDA à partir du fichier `class` correspondant.

![IDA java class](https://pro-domo.ddns.net/blog/extra/3/021.jpg "IDA java class")

Quelques similarités non ?

`KO, WARNING, STILL_OK, OK` sont placés sur la pile à l'adresse `met004_slot002` Puis il y a sortie des conditions pour arriver au return de `checkDateOfKillStatus()` qui retourne... `met004_slot002` :)

On pourrait effacer toute la fonction et ne laisser que l'équivalent de:

```
static DateOfKillStatus checkDateOfKillStatus(License license, LocalDate currentDate)
{
    DateOfKillStatus status;
    status = DateOfKillStatus.OK;
    return status;
}
```
Mais ça n'a pas l'air de marcher ou je m'y prends mal. Bref, allons au plus rapide, on sélectionne l'énumération `DateOfKillStatus.OK` et on jette un coup d’œil sur le code hexadécimal.

![IDA hex dump](https://pro-domo.ddns.net/blog/extra/3/023.jpg "IDA hex dump")

`status = DateOfKillStatus.OK` correspond à l'instruction `B2 00 15`

on voit que les zones jaunes au dessus correspondent respectivement à:

```
B2 00 0F => status = DateOfKillStatus.KO
B2 00 12 => status = DateOfKillStatus.WARNING
B2 00 14 => status = DateOfKillStatus.STILL_OK
```
Voilà... Vous l'avez peut être déjà compris, on va remplacer `0F`, `12`, et `14` par `15` :p La touche F2 permet l'édition.

![IDA hex dump](https://pro-domo.ddns.net/blog/extra/3/028.jpg "IDA hex dump")

Après modification, retour sur l'onglet de visualisation graphique: ![IDA final patch](https://pro-domo.ddns.net/blog/extra/3/029.jpg "IDA final patch")

Magique.

## Patch du binaire

Si
le binaire avait été un .exe on aurait pu produire un patch depuis IDA.
Ici soit je ne sais pas comment faire, soit ce n'est pas possible.

Retour aux bonnes vieilles méthodes => l'éditeur hexadécimal. J'utilise **Hex Worshop** .
On recherche une chaine hexadécimale assez large autour de la zone
convoitée, histoire de ne pas modifier une zone de code similaire mais
localisée ailleurs dans le programme...

PS: IDA nous donne l'offset de la zone hexadécimale qu'on modifie. Ici c'est `0E80`. Ca aide pour ne pas faire d'erreur.

![IDA patch](https://pro-domo.ddns.net/blog/extra/3/032.jpg "IDA patch")

On retrouve donc nos `B2 00 xx` On modifie en plaçant le curseur où l'on veut. On enregistre et le travail est fait :p

Plus qu'à remplacer le fichier `DateOfKillCheckerImpl.class` par le fichier modifié dans `merlin-utils.jar` avec WinRar.

On lance l'application Vidal et miracle aucune fenêtre d'invalidation de la version en cours. Have fun !
