[Cracker un logiciel avec l'assembleur](https://pro-domo.ddns.net/blog/crack-icecream-sreen-recorder.html)

# Cracker un logiciel avec l'assembleur

  Lex


  
    33-43 minutes


  






---




  Aujourd'hui nous allons faire souffrir un logiciel souvent demandé et dont le crack n'existe pas : *Icecream Screen Recorder* . Ces petits logiciels sont peu connus et sont donc peu ciblés par les teams de crack constituant la Scene. La **rétro-ingénierie du code de licence sera complète avec fabrication d'un keygen** .
Nous verrons aussi qu'il existe [des alternatives gratuites sous licence libre](https://fr.wikipedia.org/wiki/Logiciel_libre) à ce logiciel (comme à beaucoup d'autres). *Icecream Screen Recorder*
ne devrait pas être utilisé car il n'apporte qu'une plus-value
négligeable par rapport à des outils vraiment respectueux des droits des
utilisateurs comme [Peek](https://github.com/phw/peek). Rappelons aussi au passage que l'usage d'un crack est illégal.

Trop
souvent dans l'environnement Windows/Apple, et malheureusement souvent
par méconnaissance de la part des ~~utilisateurs~~ consommateurs,
l'usage d'un logiciel *freeware* souvent payant (et parfois malware déguisé) est favorisé.

Ce tuto est donc de bonne guerre, car plus que jamais **nous avons besoin de personnes formées à la rétro-ingénierie** et **conscientes du problème que posent les logiciels propriétaires.**

## Sommaire

* [Sommaire](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#sommaire)
* [Préliminaires](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#preliminaires)
* [Analyse réseau:](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#analyse-reseau)
* [Audit de l&#39;application:](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#audit-de-lapplication)
  * [Lister les fonctions (clic droit dans le code / Search for / Names)](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#lister-les-fonctions-clic-droit-dans-le-code-search-for-names)
  * [Lister les chaines](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#lister-les-chaines)
  * [Moi je continue un peu :](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#moi-je-continue-un-peu)
* [Un crack ?](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#un-crack)
* [L’activation en ligne](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#lactivation-en-ligne)
* [L’activation en local](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#lactivation-en-local)
* [La licence](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#la-licence)
* [Une valeur mystère ?](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#une-valeur-mystere)
* [Le keygen](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#le-keygen)
* [Conclusion - Pourquoi suis-je en colère ?](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fcrack-icecream-sreen-recorder.html#conclusion-pourquoi-suis-je-en-colere)

## Préliminaires

Avant toute chose, voici l’archive contenant le code du Keygen et l’application ayant servi à la rédaction de ce tuto.
[Icecream_recorder_2.0.17_crack.rar](https://www.multiup.org/download/8715d8c2099d8030be8eefd7c272a8c2/Icecream_recorder_2.0.17_crack.rar)

Rendons nous sur la [page de l&#39;éditeur](http://icecreamapps.com/fr/activation.html). Nous voyons une capture de la méthode d'enregistrement de la licence:

![capture licence](https://nsa38.casimages.com/img/2015/08/20/15082008472251503.png "capture licence")

Voyons la FAQ:
*Q: J'obtiens constamment le message "Erreur de connexion Internet" lorsque j'essaye d'activer ma version du produit.*
*R: => connexion internet instable ou pare-feu.*
*Q: J'obtiens le message "Clé incorrecte" lorsque j'essaye d'activer ma version du produit.*
*R:
Pour éviter les fautes de frappe, veuillez copier-coller votre code
d'activation à partir de votre e-mail d'activation TEL QUEL. Si vous
obtenez encore ce message, cela signifie que vous avez déjà utilisé
cette clé auparavant. Rappelez-vous : une clé ne peut être utilisée que
sur 2 ordinateurs.*

Ce que l'on apprend:

* Connexion internet obligatoire pour activer => requête http(s).
* La requête retournera forcément une indication de validation/invalidation.
* La requête envoie un identifiant propre à la machine sur laquelle se fait l’installation.
* Il s’agit d’une version PRO limitée simplement par une absence de clé :nickel :.

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## Analyse réseau:

L'outil absolument incontournable pour l'analyse réseau est [Wireshark](https://www.wireshark.org/download.html). Exécutons le logiciel et lançons une capture sur ma carte wifi:

[![](https://nsa38.casimages.com/img/2015/08/20/15082009534647142.png)](https://nsa38.casimages.com/img/2015/08/20/15082009534647142.png)

On aurait pu penser qu'en termes de sécurité, la transmission d'une clé d'authentification en https eut été une priorité.
Non.
Vous êtes sur Windows.

Même
un certificat auto-signé aurait pu me rendre aveugle… Néanmoins, comme
on le verra plus tard, des requêtes chiffrées n'auraient pas empêché les
investigations, mais m'auraient ralenti.

```
GET /act/license.php?p=3&k=DDDD-DDDDD-DDDDD-DDDDD-DDDDD&m=525ce79dcf4fd92bda0ef0980d910d9f&s=4060033375163170&hash=b4871ad2155fecc0061f437e697cc2b5
GET /act/license.php?p=3&k=DDDD-DDDDD-DDDDD-DDDDD-DDDDD&m=525ce79dcf4fd92bda0ef0980d910d9f&s=1775778066082285&hash=b4871ad2155fecc0061f437e697cc2b5
Retour: {"statusCode":403,"statusInfo":"Wrong activation key"}
```
Ce que l'on apprend:

* Les transmissions
  sont en clair, donc ça va être facile de faire des tests et ça va être
  facile de se faire passer pour le serveur :p
* Le retour se fait en JSON. Le document comporte 2 objets aux noms évocateurs : statusCode et statusInfo.
* Les transmissions ne semblent pas limitées en nombre.
* Certains paramètres sont variables, d'autres non. Donc certains concernent l'identifiant fixe de la machine.

  ‘k’ se nommera "user_key", ‘m’ se nommera "master_key", ‘s’ : pour le
  moment on ne sait pas, ‘hash’ sera "hash", m ne change jamais tout comme
  hash, et ‘s‘ change à chaque fois.

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## Audit de l'application:

Plusieurs
méthodes peuvent être envisagées. Elles sont d'ailleurs souvent
complémentaires. Personnellement je commence en général par utiliser [OllyDbg](http://www.ollydbg.de/version2.html). C'est un débugger / désassembleur qui nous affiche le code du programme en langage machine: l'Assembleur.

L'Assembleur est un langage de bas niveau. C'est le dernier langage qui
peut être compris par un humain avant les successions de 0 et de 1
manipulées par les puces. Il s'agit d'un langage avec très peu de
fonctions, mais il faudra en contrepartie 20 lignes de code difficiles à
comprendre pour afficher un caractère dans une console alors que le C++
permet de faire ça en 5 lignes simples (et Python en 1) ; Vous
trouverez de nombreux tutos sur le net. Ceux-ci commencent d’ailleurs à
dater, signe que le langage se perd…

En général je préfère
attacher le debugger au processus en cours d'exécution, car certaines
protections peuvent empêcher le démarrage d'une application depuis un
debugger. [![](https://nsa38.casimages.com/img/2015/08/20/15082008472294966.png)](https://nsa38.casimages.com/img/2015/08/20/15082008472294966.png) => Préparez l’application comme si vous étiez sur le point de valider un code d’activation.
=> File/Attach: cherchez le processus puis cliquez sur "Attach". Patientez le temps que les dépendances se chargent.

Le
programme debuggé freeze (se met en pause); En général le debugger nous
arrête alors dans du code qui est tout autre que celui que l'on veut
analyser.
=> Choisir le bon module dans View/Executable module (rechercher recorder.exe).

2 choses à faire ensuite:

* Lister
  toutes les chaines de caractères du programme => Nous cherchons
  entre autres tout ce qui peut avoir trait à une licence et surtout nos 2
  chaines "statusCode" et "statusInfo".
* Lister les fonctions appelées par le programme et se focaliser sur les comparaisons de chaines.

### Lister les fonctions (clic droit dans le code / Search for / Names)

Je
commence par ça dans le tuto mais en pratique ça vient bien en 2ième
position puisqu’il faut avoir une certaine connaissance du langage
utilisé, et puis il y en a tellement qu’on ne peut pas faire de tri sans
savoir ce qu’on cherche. Ici nous voyons tout de suite que le programme
est codé avec le framework Qt. Une connaissance de ce framework est un
plus mais ici les noms des fonctions sont suffisamment explicites.

En contrepartie c’est de l’orienté objet : le programme gère des
adresses d'objets en mémoire (pointeurs/références) et non les nombres
ou les chaines de caractères eux-mêmes.
Par conséquent on ne verra
passer que très rarement les chaines qui nous intéressent dans la pile
(en bas à droite d’OllyDbg), ou dans les registres (en haut à droite).

### Lister les chaines

Les gentils programmes n’obfusquent pas les chaines de caractères manipulées. Ici c’est quasi Open-Bar.
=> clic droit dans le code / Search for / All referenced strings
=> clic droit dans la nouvelle fenêtre / Search for text :

* chercher "statusCode" => aucune réponse, dommage.
* chercher "activation" (ça marche toujours :p)

On tombe sur un passage assez intéressant :
[![](https://nsa38.casimages.com/img/2015/08/20/15082008472520092.png)](https://nsa38.casimages.com/img/2015/08/20/15082008472520092.png)

=> Clic droit sur « Activation successed » / Follow in Disassembler ; vous arrivez dans le code concerné
[![](https://nsa38.casimages.com/img/2015/08/20/150820084724166813.png)](https://nsa38.casimages.com/img/2015/08/20/150820084724166813.png)

Toutes
les adresses (colonne de gauche) en rouge sont des breakpoints(BP). Ils
servent à forcer l’arrêt du programme à cet endroit. Les breakpoints
s’ajoutent avec la touche F2.
Les sauts conditionnels (utilisant le
résultat d’un test) sont notés JZ ou JNZ (saut si valeurs égales ou
différentes), les sauts inconditionnels sont notés JMP. Ce sont des
opcodes assembleur (voir [la liste des opcodes assembleur Intel x86](http://www.haypocalc.com/wiki/Liste_des_instructions_assembleurs_Intel_x86) ou, [asm ref x86](http://www.mathemainzel.info/files/x86asmref.html)).

Nous
voyons d’emblée un saut conditionnel juste au-dessus de « Activation
successed ». Si celui-ci est pris on se dirige vers « Activation failed
», dans le cas contraire une routine de validation semble s’exécuter
puis on se dirige vers la fin de la fonction. Modifier ce saut pourrait
être une première action mais ça ne marche pas. Il faut remonter un peu
et nous voyons le convoité « statusInfo » ; mais sans test à proximité
si ce n’est une expression régulière :

```
Address   Hex dump          Command                                  Comments
0108C511  |.  FF15 E8E80C01 CALL DWORD PTR DS:[<&Qt5Core.??4QString@ ; \Qt5Core.??4QRegularExpression
```
Il y a peut-être autre chose. Le string est une
constante, recherchons son utilisation dans le programme ou remontons
tout simplement dans le code.
=> Clic droit sur « statusInfo » / Find references to / Address constant.

Une nouvelle fenêtre s’ouvre avec 2 adresses, l’adresse courante et une
autre au-dessus qui nous envoie un peu plus haut dans le code.
[![](https://nsa38.casimages.com/img/2015/08/20/150820084738974322.png)](https://nsa38.casimages.com/img/2015/08/20/150820084738974322.png)

Si on remonte encore on tombe sur les routines qui gèrent le retour de la requête http (document JSON).

Nous voyons un test sur l’objet « statusCode ». Si la valeur
(transformée en string) est 200 (c’est un code d’erreur http, tout comme
403), la routine en 0108C26D est exécutée. Sinon on arrive directement
dans la zone de tout à l’heure.
La première chose que nous allons faire est de supprimer ce saut :
=> Clic droit Edit / Fill with NOPs (no operation)
[![](https://nsa37.casimages.com/img/2015/08/20/150820084725211365.png)](https://nsa37.casimages.com/img/2015/08/20/150820084725211365.png)

Plaçons un BP sur la condition et descendons un peu.
Nous voyons une fonction intéressante :

```
Address   Hex dump          Command                                  Comments
0108C30C  |.  FF15 0CE70C01 CALL DWORD PTR DS:[<&Qt5Core.?hash@QCryp ; \Qt5Core.?hash@QCryptographicHash@@SA?AVQByteArray@@ABV2@W4Algorithm@1@@Z
```
Nous le voyions depuis le début, nous manipulons
des hashs. Ça tombe bien voilà la fonction qui s’en occupe. Allons jeter
un coup d’œil à la [documentation de Qt](https://doc.qt.io/qt-5/qcryptographichash.html). Le constructeur de cet objet a le prototype suivant :

```
QCryptographicHash::QCryptographicHash(Algorithm method)
```
"Algorithm method" est la valeur d’une énumération
documentée dans la même page et définissant le type de hash utilisé. Ça
tombe bien, dans notre debugger nous voyons un paramètre constant :
Arg3=1 Retour dans la doc, la valeur 1 correspond à

```
QCryptographicHash::Md5   1   Generate an MD5 hash sum
```
Plaçons un BP là-dessus… Vraisemblablement le hash
obtenu est converti en caractères hexadécimaux puis placés dans un
QByteArray (une sorte de string).

```
0108C324  |.  FF15 10E70C01 CALL DWORD PTR DS:[<&Qt5Core.?toHex@QByt ; \Qt5Core.?toHex@QByteArray
```
Nous voyons ensuite :

```
0108C383  |.  FF15 4CE90C01 CALL DWORD PTR DS:[<&Qt5Core.??0QMessage ; \Qt5Core.??0QMessageLogger
[…]
0108C3B6  |.  FF15 58E90C01 CALL DWORD PTR DS:[<&Qt5Core.??6QDebug@@ ; \Qt5Core.??6QDebug
```
Même sans connaitre le framework, il n’est pas
difficile de voir que ce sont des informations de debug. Ces
informations n’ont rien à faire dans une application en production. Nous
avons en plus carrément une compilation en mode debug ><. Grande
classe. Alors ici soit vous faites comme si vous n’avez rien vu et vous
continuez à lire le code, soit vous démarrez à coté une autre instance
du programme mais via une console… ça pourrait être instructif.

### Moi je continue un peu :

Je
m’attends donc à avoir dans la console un rHash et un cHash. Descendons
un peu et nous arrivons dans notre zone de départ. Mais juste avant :

```
0108C434  |.  FF15 80E50C01 CALL DWORD PTR DS:[<&Qt5Core.?compare@QS ; \Qt5Core.?compare@QString@@QBEHABV1@W4CaseSensitivity@Qt@@@Z
[…]
0108C441     /74 3A         JZ SHORT 0108C47D
```
Une jolie comparaison de strings puis un saut conditionnel !
Plaçons un BP sur le saut.

Plaçons quelques BP puis exécutons le programme touche F9 ou Debug/run.

Le programme s’arrête au premier BP. Les touches F7 et F8 vous
permettent de debugger le programme pas à pas. F8 n’entrera pas dans les
fonctions rencontrées en restant toujours dans la fonction courante. F7
s’enfoncera toujours plus loin dans le code jusqu’à tomber dans les
librairies de base du système (en C++ ça peut vite partir dans tous les
sens…).
Appuyons sur F8. Comme prévu le saut n’est pas pris.
Appuyons sur F8 plusieurs fois ou sur F9 et nous arrivons sur
QCryptographicHash.
Comme je l’ai dit, nous n’avons rien dans la
pile ou dans les registres qui affiche les chaines manipulées... Nous
sommes à un trop haut niveau, il faut descendre dans les classes de Qt
et s’affranchir des multiples abstractions...
Appuyons donc sur F7.

Nouvelle fonction, courte cette fois. Avançons pas à pas et scrutons le
debugger et les registres. Notez au passage que nous ne sommes plus
dans recorder.exe mais dans la dll Qt5Core (voir le nom du module dans
le titre de la fenêtre d’OllyDbg). **Donc ne modifiez rien dans ce genre de code ça n’aura aucun sens** !
[![](https://nsa38.casimages.com/img/2015/08/20/15082008473583405.png)](https://nsa38.casimages.com/img/2015/08/20/15082008473583405.png)

A l’adresse 5AAB650E, l’argument passé à la méthode addData contient la chaine à hasher…

```
5AAB650E  |.  51            PUSH ECX                                 ; |Arg1 = ASCII "DDDD-DDDDD-DDDDD-DDDDD-DDDDD525ce79dcf4fd92bda0ef0980d910d9f6228418110785200"
```
Là on est plutôt content car le hash de cette
chaine est calculé en local puis comparé avec la version récupérée via
le serveur. Si les 2 hashs sont identiques l’activation du programme est
faite !
Ressortons et allons jusqu’au prochain BP (la comparaison de strings) avec F9.

```
0108C434  |.  FF15 80E50C01 CALL DWORD PTR DS:[<&Qt5Core.?compare@QS ; \Qt5Core.?compare@QString@@QBEHABV1@W4CaseSensitivity@Qt@@@Z
```
Si nous cliquons sur arg1 nous voyons la valeur 0034A6EC. C’est un pointeur vers l’objet qui contient la chaine à comparer.
Cliquons sur le registre EDX, puis Follow in Dump. [![](https://nsa37.casimages.com/img/2015/08/20/150820084732645860.png)](https://nsa37.casimages.com/img/2015/08/20/150820084732645860.png) La fenêtre en bas à gauche s’active. Le caractère hexadécimal en haut à gauche est le début de l’adresse vers notre string. [![](https://nsa37.casimages.com/img/2015/08/20/150820084738496141.png)](https://nsa37.casimages.com/img/2015/08/20/150820084738496141.png) => Clic droit sur 68 / Follow DWORD in dump.

Nous arrivons dans une zone différente de la mémoire, et nous voyons le hash convoité, calculé par le programme. [![](https://nsa38.casimages.com/img/2015/08/20/150820084738190571.png)](https://nsa38.casimages.com/img/2015/08/20/150820084738190571.png)

Entrons dans la fonction avec F7 puis avançons pas à pas : [![](https://nsa38.casimages.com/img/2015/08/20/150820084725379579.png)](https://nsa38.casimages.com/img/2015/08/20/150820084725379579.png)

```
5AAF82B9  |.  3BC2          CMP EAX,EDX                              ; UNICODE "e6ce3053bd3eb49942f02ae6d6fe45d1"
[…]
5AAF82C8  |>  3BFE          CMP EDI,ESI
```
Nous voyons les registres se charger, puis un CMP
EAX,EDX. CMP est l’opcode de comparaison des valeurs des registres. Or
EAX vaut « Wrong activation key », EDX vaut «
e6ce3053bd3eb49942f02ae6d6fe45d1 ».
Plus bas nous voyons une
comparaison des registres EDI et ESI. Ce sont des registres de «
comptage ». Ils servent en général à incrémenter des variables.
Ici
EDI vaut 14 et ESI vaut 20. C’est de l’hexadécimal, donc respectivement,
20 et 32 en décimal. Ce sont les tailles des 2 chaines.
Bref, ressortons de l’application ; nous atterrissons sur le test et le saut :

```
0108C43F  |.  84C0          TEST AL,AL
0108C441      74 3A         JZ SHORT 0108C47D
```
[![](https://nsa37.casimages.com/img/2015/08/20/150820084731147592.png)](https://nsa37.casimages.com/img/2015/08/20/150820084731147592.png)
Lorsque vous êtes sur le JZ, une flèche rouge s’affiche ; cela veut
dire que le saut sera pris si nous ne faisons rien. Nous voyons alors
que cela nous mènera vers « Invalid response hash ».
Noppons ce saut.
=> Clic droit Edit / Fill with NOPs (no operation)

Exécutez
ensuite le programme pas à pas avec F8. Vous verrez qu’il prend tous
les sauts allant vers une validation et qu’il arrive vers « Activation
successed » :p
Si vous continuez un peu, vous sortirez de la
fonction pour aller vers l’écriture d’un fichier de licence… Mais ceci
concernera la partie suivante. En attendant vous pouvez faire F9 pour
rendre la main au programme parce que vous aurez une surprise : [![](https://nsa37.casimages.com/img/2015/08/20/150820084735979672.png)](https://nsa37.casimages.com/img/2015/08/20/150820084735979672.png)

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## Un crack ?

Bien.
Les plus flemmards vont s’arrêter là. L’opération aura pris 15min à
tout casser. Bien que l’app ait été enregistrée, on pourrait la modifier
en dur pour faire un crack. Retournons maintenant aux 2 endroits
modifiés :
=> Clic droit sur les zones noppées en rouge / edit / undo selection

Notons les caractères hexadécimaux aux alentours de ces zones :

```
Backup    Hex dump          Command                                  Comments
0108C262   0F94C0           SETZ AL
0108C265   84C0             TEST AL,AL
0108C267   0F84 53020000    JZ 0108C4C0
0108C26D   8B15 181F1901    MOV EDX,DWORD PTR DS:[1191F18]           ; ASCII "statusInfo"

Et 
0108C43C  |.  0F94C0        SETZ AL
0108C43F  |.  84C0          TEST AL,AL
0108C441      74 3A         JZ SHORT 0108C47D
0108C443  |.  8D4C24 4C     LEA ECX,[ESP+4C]
0108C447  |.  C64424 17 01  MOV BYTE PTR SS:[ESP+17],1
```
Nous allons devoir remplacer les séquences comme cela :

```
0F94C084C00F84530200008B15181F => 0F94C084C09090909090908B15181F
0F94C084C0743A8D4C244C => 0F94C084C090908D4C244C
```
Il va falloir ouvrir l’application .exe avec un
éditeur hexadécimal (OllyDbg permet de sauvegarder les modifications
dans un nouveau .exe mais je n’ai pas l’impression que cela marche très
bien). J’utilise [HexWorkShop (version d’évaluation…)](http://www.hexworkshop.com/).

Recherchez les séquences et faites les changements. Veillez à ce que la
séquence recherchée ne soit présente qu’une fois pour éviter de
modifier d’autres portions du code…

Bon… c’est la méthode courte,
classique, facile… mais je vous ai eu. Le programme plante
lamentablement :p Il y a peut-être un contrôle de CRC (une protection
!). Mais peu importe, de toute façon comme j’ai décidé de défoncer ce
logiciel, je ne m’arrêterai pas là. Et puis, un crack est une solution
portable, facile d’installation, mais aussi assez sale, puisqu’on
modifie en dur l’application ; or ici on a justement la possibilité de
faire bien plus propre !

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## L’activation en ligne

Pour
l’instant nous devons quand même interroger le serveur de la société,
modifier en temps réel le programme avec un debugger etc... Pas propre.

Ce que nous savons :

* L’url est formée de la clé, d’un hash et d’un truc qui bouge.
* clé
  + hash + truc qui bouge sont hashés par le serveur et par le client en
    md5, puis le client compare les 2 résultats (vérification locale =>
    vachement sécurisé :p).
* Le hash de "DDDD-DDDDD-DDDDD-DDDDD-DDDDD" sur mon poste est « fce06c5e8f16b9a8e50a80218721749f »
* Lorsque
  l’authentification est réussie, un fichier de licence est généré. Un
  bref coup d’œil à l’intérieur
  (C:\Users\XXX\AppData\Local\Icecream\Icecream Screen Recorder) nous
  montre qu’il est rédigé en JSON et comporte une signature :
  {
  "Date": "2015-08-18", "Key": "DDDD-DDDDD-DDDDD-DDDDD-DDDDD", "Product":
  "Icecream Screen Recorder", "Signature":
  "597a64684f5455334e5463304e546735597a4d354e7a6c6c4e3255774e44557a4d5442684d5449304e7a64684d7a4d334d47453359673d3",
  "Version": "2.0.17" }
  (j’ai modifié la signature pour qu’elle soit incorrecte afin de vous forcer à suivre le tuto).

Dès lors plus de raison de faire des requêtes au serveur officiel. Créons notre propre serveur d’authentification !

Redirigeons
sur nous-mêmes les requêtes vers icecreamapps.com, en ajoutant dans
notre fichier hosts (C:\Windows\System32\drivers\etc\hosts) :

```
127.0.0.1 icecreamapps.com
```
Videz le cache DNS pour prendre en compte la modif
du hosts, ouvrez une invite de commande windows (Démarrer/exécuter/
cmd) puis :

Voilà vous avez maintenant grosso-modo une méthode de
blocage d’un site web digne des services de renseignements français. (En
vrai, les requêtes seraient redirigées dans les bureaux de M. Valls,
garant de nos libertés individuelles).
Installons ensuite un serveur web pour les tests [Wamp](http://www.wampserver.com/). Le répertoire des pages se trouve dans « C:\Program Files\wamp\www ».
Ajoutons à l’intérieur un dossier « act », contenant une page « license.php ». Le tout pour mimer la requête légitime.

Dans cette page collez le code php suivant :

```
<?php
// Vérification de la présence de tous les champs dans la requête
if ((isset($_GET['k']) AND !empty($_GET['k'])) AND 
    (isset($_GET['m']) AND !empty($_GET['m'])) AND
    (isset($_GET['s']) AND !empty($_GET['s']))) {

    // Stockage sécurisé des données
    $user_key       = $_GET['k'];
    $master_hash    = $_GET['m'];
    $seed           = $_GET['s'];

    // Transtypage
    settype($user_key,      "string");
    settype($master_hash,   "string");
    settype($seed,          "string");

    // Bad request:
    //{"statusCode":403,"statusInfo":"Wrong activation key"}

    /*$ret = array('statusCode' => 200,
                "statusInfo" => "Wrong activation key");*/

    // Correct request:
    // Hash : user_key + master_hash + seed
    $top_secret_hash = md5($user_key . $master_hash . $seed);

    $ret = array('statusCode' => 200,
                "statusInfo" => $top_secret_hash);

    // I want JSON !
    # Content-type & charset
    header('Content-Type: application/json; Charset=utf-8');
    echo json_encode($ret);
    exit();
}
```
Le code se suffit à lui-même je pense, il fait
exactement ce que le serveur officiel fait : renvoyer le hash md5
réalisé sur la concaténation des différents paramètres. Effacez le
fichier licence.lic sinon vous ne pourrez pas tester de nouvelles clés.
Démarrez le logiciel, entrez une clé bidon. Félicitations vous avez un
serveur d’authentification chez vous :p

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## L’activation en local

Bon…
C’est bien mais pas suffisant. A cause du paramètre variable on a
toujours besoin d’un serveur et c’est assez lourd. Ce qu’on apprend:

* Nous
  pouvons tester de multiples clés ; le fichier de licence ne change pas
  mais la signature change à chaque fois. Il va falloir deviner comment
  elle est conçue :Shifty :
* Plus la peine de vous le cacher, il y a
  de fortes chances que le paramètre ‘s’ de la requête soit une seed
  => une succession de chiffres tirés d’un générateur pseudo-aléatoire
  de nombres. Cela pour éviter qu’on puisse rejouer l’échange entre le
  client et le serveur. En effet l’activation échoue si mon serveur
  renvoie une seconde fois le premier hash «
  fce06c5e8f16b9a8e50a80218721749f ».
* Nous avons donc cette structure :
  User_key + master_key + seed
* Nous allons devoir deviner comment est conçue master_key.

C’est le moment de confirmer tout cela en exécutant le programme depuis une console comme je l’avais proposé plus haut.
Là, c’est la cour des miracles.
[![](https://nsa38.casimages.com/img/2015/08/20/150820084741169790.png)](https://nsa38.casimages.com/img/2015/08/20/150820084741169790.png) Toutes les informations de debug, la création de la seed, les url, les retours json…

On
se doutait que le programme rechargeait la licence au démarrage pour
évaluer son état d’activation. Eh bien nous en avons la preuve : [![](https://nsa37.casimages.com/img/2015/08/20/150820084740466932.png)](https://nsa37.casimages.com/img/2015/08/20/150820084740466932.png)

Gardons
la licence pour la fin puisqu’il faut auditer master_key maintenant.
Master_key fait 32 caractères ; c'est vraisemblablement un hash md5. Ça
tombe bien, nous savons que QCryptographicHash s’occupe de ça…

Retour dans OllyDbg. (Tout fermer, ouvrir icecream puis attacher le
process, effacer le fichier de licence. On repart sur de nouvelles
bases. Vos anciens BP ont été conservés entre temps). Comme je le
disais, il est difficile de trouver les fonctions quand on ne sait pas
ce qu’on cherche. Ici on sait.
=> Clic droit sur QCryptographicHash en 0142C30C / Find references / for selected command.
=> Mettre un BP avec F2 sur chaque ligne de la liste (Sauf la dernière. On s’intéresse uniquement aux appels CALL)
[![](https://nsa37.casimages.com/img/2015/08/20/150820084729510676.png)](https://nsa37.casimages.com/img/2015/08/20/150820084729510676.png)

Testons une nouvelle clé.
Grâce aux PB sur QCryptographicHash le programme s’arrête immédiatement en :

```
0023F6E8  |.  FF15 0CE72700 CALL DWORD PTR DS:[<&Qt5Core.?hash@QCryp ; \Qt5Core.?hash@QCryptographicHash@@SA?AVQByteArray@@ABV2@W4Algorithm@1@@Z
```
Un peu plus haut nous trouvons une chaîne écrite en dur dans le programme :

```
010FF68A  |.  68 C8CF1401   PUSH OFFSET 0114CFC8                     ; ASCII "{887917A7-EF04-4E1D-BE63-CEDA97C8390A}"
```
[![](https://nsa37.casimages.com/img/2015/08/20/150820084742848118.png)](https://nsa37.casimages.com/img/2015/08/20/150820084742848118.png)

C’est
un Class ID. Un identifiant unique utilisé par Windows pour gérer ses
logiciels/composants/périphériques… Son format est tout à fait
compréhensible par un être humain et sa gestion est absolument parfaite ;
car ce n’est pas du tout le genre de chaines qui s’accumulent dans le
registre Ad Vitam Aeternam.
Sous Linux on a des fichiers de
configuration rédigés en anglais. Sous Windows il y a les Class ID.
C’est mieux. Sans aucun doute.

Rentrons dans la fonction avec F7 (c’est la même que tout à l’heure). [![](https://nsa37.casimages.com/img/2015/08/20/15082008472531382.png)](https://nsa37.casimages.com/img/2015/08/20/15082008472531382.png)

Nous voyons :
Arg1 = ASCII "78:E7:D1:C4:10:1D{887917A7-EF04-4E1D-BE63-CEDA97C8390A}"
Ressortons avec F8 puis descendons un peu sous le QCryptographicHash en 010FF6E8 toujours avec F8. Nous arrivons sur :

```
010FF6FD  |.  FF15 10E71301 CALL DWORD PTR DS:[<&Qt5Core.?toHex@QByt ; \Qt5Core.?toHex@QByteArray@@QBE?AV1@XZ
010FF703  |.  8B7424 30     MOV ESI,DWORD PTR SS:[ESP+30]
```
Une fois sur 010FF703 le registre EDX s’illumine et nous voyons… Notre master_key «525ce79dcf4fd92bda0ef0980d910d9f ». [![](https://nsa37.casimages.com/img/2015/08/20/15082008472850084.png)](https://nsa37.casimages.com/img/2015/08/20/15082008472850084.png)

Mystère résolu. Dans "78:E7:D1:C4:10:1D{887917A7-EF04-4E1D-BE63-CEDA97C8390A}" vous aurez reconnu votre adresse MAC.
Pour obtenir la liste des adresses mac de ses interfaces réseau :

Ce qu’on apprend:

* hash d’authentification = md5(key + md5(mac_adress + CLSID) + seed).
* Master_key
  aurait pu être générée 1 seule fois, discrètement au démarrage de
  l’appli. Pas à chaque fois qu’on teste une clé… ça aurait été plus dur
  de voir d’où elle venait..

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## La licence

Maintenant
qu’on arrive à générer une requête complète et sa réponse, il nous faut
comprendre comment le fichier de licence est généré. N’effacez pas la
licence cette fois (le programme plante si pas de licence au démarrage
quand on debug.. surement une exception levée lors de l’accès au fichier
mais masquée par Qt et qui n’échappe pas au debugger), dans ollyDbg :
=> Debug /restart : cette fois c’est OllyDbg qui démarre le logiciel

Lorsque les librairies sont chargées appuyez sur F9. Grâce aux BP qui
sont toujours sur QCryptographicHash, le programme s’arrête :

```
0133F6E8  |.  FF15 0CE73701 CALL DWORD PTR DS:[<&Qt5Core.?hash@QCryp ; \Qt5Core.?hash@QCryptographicHash@@SA?AVQByteArray@@ABV2@W4Algorithm@1@@Z
```
C’est une fonction que nous connaissons déjà. En
effet c’est elle qui permet de forger le hash de l’adresse mac et du
CLSID. Notez qu’elle était en 010FF6E8 ; après redémarrage du debugger
elle est en 0133F6E8. Seuls les 2 derniers octets de l’adresse comptent
ici… F6E8 ne changera pas chez vous mais 0133 oui.
Sortons de la fonction pas à pas avec F8.
Nous arrivons en 0133FFCF, la fonction dans laquelle on était s’appelait 0133FF00.

```
0133FFCA  |.  E8 31FFFFFF   CALL 0133FF00                            ; \recorder.0133FF00, hash md5 mac + class id
0133FFCF  |.  8B4C24 5C     MOV ECX,DWORD PTR SS:[ARG.2]
```
Continuons avec F8 jusqu’au prochain CALL 012F2530 en 0133FFDF. Entrons à l’intérieur avec F7. [![](https://nsa38.casimages.com/img/2015/08/20/150820084743194902.png)](https://nsa38.casimages.com/img/2015/08/20/150820084743194902.png)

Nous voyons une fonction append.QString. [![](https://nsa38.casimages.com/img/2015/08/20/150820084740500572.png)](https://nsa38.casimages.com/img/2015/08/20/150820084740500572.png)

Plaçons-nous
avec F8 sur l’argument 1. Puis regardons le contenu de l’adresse via le
registre/follow in dump / clic droit /Follow DWORD in dump.
Nous tombons sur notre clé. [![](https://nsa37.casimages.com/img/2015/08/20/150820084733845811.png)](https://nsa37.casimages.com/img/2015/08/20/150820084733845811.png)

Juste au-dessus nous avons une fonction *QBitArray. Jetons aussi un coup d’œil à son paramètre ARg1 : [![](https://nsa38.casimages.com/img/2015/08/20/150820084727995678.png)](https://nsa38.casimages.com/img/2015/08/20/150820084727995678.png) Le programme concatène donc notre master_key avec key.

Poursuivons…
Ici j’ai passé un moment sur le code.

On voit qu’on appelle à nouveau CALL 012F2530, la fonction fera la même
chose que précédemment : une concaténation. La chaine obtenue est la
suivante :
Master_key + key + 827anNjc1ksdjh5MnGJst1L0sBBs92v5
Mais d’où vient 827anNjc1ksdjh5MnGJst1L0sBBs92v5 ??

Cette chaine provient de la fonction appelée ici :

```
0130FFB4  |.  E8 07FCFFFF   CALL 0130FBC0                            ; \recorder.0130FBC0
```
(soit, au-dessus de là où nous sommes. Il a fallu
redémarrer le debuggage pour y revenir). Les caractères sont générés de
manière assez complexe, j’y reviendrai donc plus tard.

Nous arrivons un peu plus bas sur un nouveau QCryptographicHash. Décidément ils se sont éclatés avec… [![](https://nsa37.casimages.com/img/2015/08/20/150820084736442913.png)](https://nsa37.casimages.com/img/2015/08/20/150820084736442913.png)

```
01340062  |.  FF15 0CE73701 CALL DWORD PTR DS:[<&Qt5Core.?hash@QCryp ; \Qt5Core.?hash@QCryptographicHash@@SA?AVQByteArray@@ABV2@W4Algorithm@1@@Z
```
L’argument 2 nous indique qu’il s’agit cette fois d’un hash en sha1 Nous avons donc sha1 (Master_key + key + valeur_mystere).
Descendons...

```
013400D3  |.  FF15 28E73701 CALL DWORD PTR DS:[<&Qt5Core.?toBase64@Q ; \Qt5Core.?toBase64@QByteArray@@QBE?AV1@XZ, conversion du sha1 en base64
013400D9  |.  8D5424 3C     LEA EDX,[ESP+3C]
```
Une fois sur 013400D9 , examinons l’objet en EAX / follow in dump / clic droit /Follow DWORD in dump :
« YzdhOTU3NTc0NTg5YzM5NzllN2UwNDUzMTBhMTI0NzdhMzM3MGE3Yg== »

C’est bien une conversion en base64 (notons que cette procédure n’est
pas destructive comme pour un hash ; il est possible de faire la
conversion).
Continuons :

```
013400E5  |.  FFD7          CALL EDI                                 ; conversion du base64 en hex
013400E7  |.  8B7424 58     MOV ESI,DWORD PTR SS:[ARG.22]
013400EB  |.  50            PUSH EAX                                 ; /Arg1 = 27FB80, signature valide ok ici
```
Peu de temps après nous voyons arriver notre signature complète après conversion de la chaine Base64 en hexadécimal :
« 597a64684f5455334e5463304e546735597a4d354e7a6c6c4e3255774e44557a4d5442684d5449304e7a64684d7a4d334d47453359673d3d »

A ce moment nous sommes presque à la fin de la fonction (la grande
accolade noire à droite des adresses et à gauche des opcodes, prend
fin). Allons-y en F8 puis sortons.
Nous arrivons ici : [![](https://nsa37.casimages.com/img/2015/08/20/1508200847296266.png)](https://nsa37.casimages.com/img/2015/08/20/1508200847296266.png)

Le
programme compare donc sa signature calculée avec la signature lue dans
le fichier de licence. On pourrait nopper le saut qui suit...

Ce que l'on apprend:

* La signature est formée de : sha1(md5(mac_address + CLSID) + key + valeur_mystere).toBase64().toHex()
* Une valeur mystère vient se greffer dans le code…

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## Une valeur mystère ?

D’où vient cette valeur mystère ?
827anNjc1ksdjh5MnGJst1L0sBBs92v5
Elle fait 32 caractères et ne varie pas.

Tout le monde a pensé à un hash vu qu’il y en a partout... Mais
l’hexadécimal ne contient pas de caractères de l’alphabet après F. Et
puis il y a des majuscules... Or à ma connaissance les [spécifications du md5](https://www.ietf.org/rfc/rfc2617.txt) ou en tout cas les implémentations de la norme n’autorisent pas de majuscules dans le hash...

Bon vraisemblablement c’est un [salage de la signature](https://fr.wikipedia.org/wiki/Salage_%28cryptographie%29). **Les hashs ne sont / ne doivent plus être utilisés seuls** .
On ajoute toujours un sel (un séquence de caractères connue du
programmeur et inconnue du public) pour stocker par exemple des hashs de
mots de passe en base de données etc... Si quelqu’un se procure la base
de données, les mots de passe seront protégés car la personne n’aura
pas le sel.

Ici, le sel n’est pas ajouté par l’installeur dans
l’application lors de l’installation : 2 installations différentes
valident le même fichier de licence. Le sel n’est pas ajouté à
l’installeur lors du téléchargement : 2 applications téléchargées et
installées séparément valident le même fichier de licence et les
empreintes md5 des téléchargements sont identiques.

Ça pourrait
être le cas ; une sorte d’application dynamique serait une bonne
protection contre les keygens ou cracks (mais il suffirait de localiser
puis lire le sel dans l’exe).

Vraisemblablement le sel est généré à
partir de valeurs numériques codées en dur dans le programme. Saler son
hash avec ceci est assez intelligent puisque lorsque l’on fait une
recherche dans les strings du programme le sel n’apparait pas. C’est
néanmoins illusoire, puisque pour générer le hash il faut bien que toute
la chaine soit reconstituée à un moment où à un autre.

Le salage
n’a de sens que si le sel n’est connu que du programmeur. Là, le sel
doit être connu par l’application, donc quelqu’un qui l’analyse tombera
dessus. Le recourt systématique à QCryptographicHash est la cause du
problème, puisque à un moment il faudra bien que toute la chaine soit
présente en mémoire pour être traitée. Un bon vieux Xor [(OU exclusif)](https://fr.wikipedia.org/wiki/Fonction_OU_exclusif))
aurait masqué le salage pendant bien longtemps, en ajoutant une
minuscule boucle sans appel à une fonction Qt, au milieu du bazar qu’est
un code assembleur…

Personnellement j’ai passé énormément de
temps à essayer de comprendre comment cette chaine de caractère était
générée. Ce n’est pourtant pas le but. Nous ne sommes pas en train de
recoder le programme mais plutôt de comprendre sa logique !

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## Le keygen

Maintenant
que nous avons tout ce qu’il faut on peut passer à la partie amusante
après le serveur d’authentification : le générateur de clés /licences :p

[![](https://nsa38.casimages.com/img/2015/08/20/150820084741704429.png)](https://nsa38.casimages.com/img/2015/08/20/150820084741704429.png)

Icecream
a été écrit avec Qt, j’ai donc également écrit mon Keygen avec Qt. Le
code est plus rapide à écrire, et permet de reproduire exactement le
comportement d’Icecream en quelques lignes (La majorité des lignes sert à
gérer l’affichage ; le keygen en lui-même occupe très peu de place.) :

```
#include "widget.h"
#include "ui_widget.h"

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    ui->setupUi(this);


    QRegExp rx("^[a-zA-Z0-9]{4}-[a-zA-Z0-9]{5}-[a-zA-Z0-9]{5}-[a-zA-Z0-9]{5}-[a-zA-Z0-9]{5}$");
    QValidator *validator = new QRegExpValidator(rx, this);

    ui->lineEdit->setValidator(validator);


    connect(ui->pushButton, SIGNAL(clicked()), this, SLOT(keygen()));
    connect(ui->toolButton, SIGNAL(clicked()), qApp, SLOT(aboutQt()));
}

Widget::~Widget()
{
    delete ui;
}

QString Widget::getMacAddress()
{
    QList<QNetworkInterface>  interfaces = QNetworkInterface::allInterfaces();

        foreach(const QNetworkInterface &interface, interfaces)
        {
            //qDebug() << "Interface: " + interface.hardwareAddress() << "flags:" << interface.flags();

            // Adresse mac obligatoire
            if ((!interface.hardwareAddress().isEmpty()) &&
                    (interface.flags() >= (QNetworkInterface::CanBroadcast & QNetworkInterface::CanMulticast))) {
                /*
                *  "Interface: AA:BB:CC:XX:YY:ZZ" flags: QFlags(0x4|0x20)
                    ok 36
                    "Interface: AA:BB:CC:XX:YY:ZZ" flags: QFlags(0x1|0x2|0x4|0x20)
                    ok 39
                    "Interface: " flags: QFlags(0x1|0x2|0x4|0x8|0x20) => pas ok (loopback)
                */
                //qDebug() << "ok" << (int)interface.flags();
                return interface.hardwareAddress();
            }
        }

    return "";
}

void Widget::keygen()
{

    QString user_key = ui->lineEdit->text();

    // Vérif entrée
    QRegExp rx("^[a-zA-Z0-9]{4}-[a-zA-Z0-9]{5}-[a-zA-Z0-9]{5}-[a-zA-Z0-9]{5}-[a-zA-Z0-9]{5}$");

    // Pas bon => on s'arrete
    if (!user_key.contains(rx)) {
        ui->textEdit->setText("Please insert a correct form of KEY ! ");
        return;
    }


    // Etape 1 : master hash
    // concatène l'adresse mac avec le class id et fait le hash md5
    QByteArray master_concat = QString(getMacAddress() + "{887917A7-EF04-4E1D-BE63-CEDA97C8390A}").toUtf8();

    QByteArray master_hash = QCryptographicHash::hash(master_concat, QCryptographicHash::Md5).toHex();
    //qDebug() << master_hash;

    // Etape 2 : concatène le hashmd5 + la clé DDDD-DDDDD-DDDDD-DDDDD-DDDDD + 827anNjc1ksdjh5MnGJst1L0sBBs92v5 valeur sortie de nulle part
    QByteArray concat = master_hash + user_key.toUtf8() + "827anNjc1ksdjh5MnGJst1L0sBBs92v5";
    //qDebug() << concat;

    // Etape 3 : hash sha1 => Base64 => Hex
    QByteArray temp_hash1 = QCryptographicHash::hash(concat, QCryptographicHash::Sha1).toHex();
    QByteArray signature = temp_hash1.toBase64().toHex();
    //qDebug() << signature;


    // Enregistrement de la licence
    QJsonObject object;
    object["Date"] = QDateTime::currentDateTime().toString("yyyy-MM-dd");;
    object["Key"] = user_key;
    object["Product"] = "Icecream Screen Recorder";
    object["Signature"] = QString(signature);
    object["Version"] = "2.0.17";

    QJsonDocument license(object);

    QFile saveFile("license.lic");
    if (!saveFile.open(QIODevice::WriteOnly)) {
        ui->textEdit->setText("Couldn't open save file.");
        return;
    }

    saveFile.write(license.toJson());
    saveFile.close();

    ui->textEdit->setText("Please move licence.lic to\nC:\\Users\\XXXX\\AppData\\Local\\Icecream\\Icecream\\Icecream Screen Recorder");
}
```
Et voici l’archive contenant le code du Keygen et l’application ayant servi à la rédaction de ce tuto.
[Icecream_recorder_2.0.17_crack.rar](https://www.multiup.org/download/8715d8c2099d8030be8eefd7c272a8c2/Icecream_recorder_2.0.17_crack.rar)

*****_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** ***_*** __**

## Conclusion - Pourquoi suis-je en colère ?

Ces
développeurs auraient pu gagner en visibilité et toucher un public
gigantesque en parcourant la route difficile d'une insertion dans des
dépôts de grandes distributions Linux/GNU. En effet, les bureaux Linux
ont grand besoin de logiciels grand public de ce genre.

Avec un
système de don et de prix libre ils auraient sans aucun doute pu gagner
sur au moins 2 points: les gains financiers, la qualité de leurs
logiciels grâce aux nombreuses contributions bénévoles.
De plus, ça
ne se voit peut-être pas, mais Icecream Recorder n’utilise presque que
des logiciels libres venant de l’environnement GNU. Nous retrouvons
évidemment [Qt](https://www.qt.io/), mais aussi [ffmpeg](https://www.ffmpeg.org/)
qui est LA librairie de référence dans le domaine de la manipulation de
médias. Les licences de ces outils permettent leur utilisation dans des
projets propriétaires comme Icecream (Ils sont d’ailleurs mentionnés
dans le contrat que vous acceptez lors de l’installation). Mais si vous
voulez vraiment les utiliser dans un environnement adapté et respectueux
de leurs philosophies de développement, n’utilisez pas les freewares
sous Windows. N’utilisez pas Windows.

Vous pouvez visiter cette page => [https://doc.ubuntu-fr.org/capture](https://doc.ubuntu-fr.org/capture) Et plus particulièrement ce projet => [https://doc.ubuntu-fr.org/recorditnow](https://doc.ubuntu-fr.org/recorditnow)
Vous avez également sous GNOME, des extensions qui permettent une
intégration directe d’un logiciel d’enregistrement d’écran dans
l’environnement : [easyscreencast](https://iacopodeenosee.wordpress.com/projects/easyscreencast/).

![](https://iacopodeenosee.files.wordpress.com/2013/05/esc_screen1.jpg?w=450&h=357)

EDIT - Juin 2019: Depuis quelques temps le projet [Peek](https://github.com/phw/peek) est devenu très actif.

![Peek - an animated GIF recorder](https://raw.githubusercontent.com/phw/peek/master/data/screenshots/peek-recording-itself.gif "Peek - an animated GIF recorder")

Simplissime !

Voilà
j’espère que la démarche servira. La prochaine fois crackez vous-mêmes
vos applis, ça m’évitera de passer 2 jours entiers à la rédaction d’un
tuto :p
