[pro-domo.ddns.net](https://pro-domo.ddns.net/blog/hack-application-android-xiaomi-mi-remote-partie-1.html)

# Rétro-ingénierie d'une application Android - Xiaomi Mi Remote - Partie 1

Lex

33-42 minutes
-------------

- mer. 10 mars 2021post n°52

![Mi Remote icone](https://pro-domo.ddns.net/blog/extra/52/mi_remote_icon.webp "Mi Remote icone")

Les codes infrarouges des appareils télécommandés vendus dans le monde constituent-ils un secret industriel ? L'application [Mi Remote](https://apkpure.com/fr/mi-remote-controller-for-tv-stb-ac-and-more/com.duokan.phone.remotecontroller) de Xiaomi semble indiquer que oui étant donné les efforts mis en œuvre pour protéger leur base de données.

À la recherche d'une liste complète de codes pour l'application [TVKILL](https://github.com/42SK/TVKILL/) (une version Android du [TV-B-Gone](https://www.adafruit.com/product/73)), je me suis penché sur Mi Remote qui propose de transformer son téléphone en télécommande universelle.

L'effort
est louable (et sans publicité, ça vaut le coup de le mentionner !)
mais les données utilisées sont curieusement inaccessibles. Terminons
donc le travail.

Le monde a besoin de personnes capables de faire
de la rétro-ingénierie. Il s'agit ici de codes infrarouges comme il
pourrait s'agir d'une [application bancaire trop invasive (Crédit Agricole &lt;3)](https://sebsauvage.net/wiki/doku.php?id=apk-hacking), ou d'une [application vérolée imposée aux étudiants français par les CROUS (Izly)](https://remy.grunblatt.org/mais-avec-qui-communique-lapplication-izly.html), ou encore de malwares.

Les exemples sont légion et peu importe leurs origines car : **Si
un utilisateur ne peut bénéficier des libertés fondamentales inhérentes
aux logiciels libres, alors quelqu'un d'autre a le contrôle de son
logiciel. Tôt ou tard la personne qui contrôle le logiciel sera en
désaccord avec celle qui l'utilise ou abusera de son pouvoir.** Ce jour-là l'utilisateur comprendra les conséquences du fait de "nager avec les requins".

Après
tout il faut bien se nourrir mais comprenez qu'en tant que développeur,
si vous participez à des projets verrouillés, alors vous faites partie
du problème. Un problème d'éthique et parfois aussi de sécurité.

Je ne puis que conseiller cet article de Richard Stallman : [The Right to Read (1997)](https://www.gnu.org/philosophy/right-to-read.en.html).

*À
l'heure où cet article est posté, la majorité de la base de données est
publiée, ainsi que le code pour la reproduire et l'exploiter. Ceci
permettra je l'espère la création ou l'amélioration d'alternatives
libres.*

Voir le [dépôt GitHub](https://github.com/ysard/mi_remote_database).

## Sommaire

* [Sommaire](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#sommaire)
* [Avant-propos](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#avant-propos)
  * [Quelques conseils pour la réalisation d&#39;un crack ou la rétro-ingénierie en général](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#quelques-conseils-pour-la-realisation-dun-crack-ou-la-retro-ingenierie-en-general)
  * [Verrous rencontrés dans ce projet](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#verrous-rencontres-dans-ce-projet)
  * [Logiciels utilisés](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#logiciels-utilises)
  * [Objectifs](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#objectifs)
* [Contournement HTTPS - Mitmproxy/addSecurityException](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#contournement-https-mitmproxyaddsecurityexception)
* [À la recherche du parser JSON](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#a-la-recherche-du-parser-json)
* [La transmission du code infrarouge](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#la-transmission-du-code-infrarouge)
* [Analyse des logs Android](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#analyse-des-logs-android)
* [Miir : Moins offusqué qu&#39;il n&#39;y parait](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#miir-moins-offusque-quil-ny-parait)
* [Patch de l&#39;application](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#patch-de-lapplication)
  * [Rappels Smali](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#rappels-smali)
  * [Patch](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#patch)
* [Décompilation de la librairie native et routines de déchiffrement](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#decompilation-de-la-librairie-native-et-routines-de-dechiffrement)
  * [Conversion des valeurs](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#conversion-des-valeurs)
* [Conclusion](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#conclusion)
* [Sources](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-1.html#sources)

## Avant-propos

Je
ne reviens pas ici sur les méthodes de désassemblage/décompilation des
APK déjà abordées dans d'autres articles de ce site (Voir [Exemple de crack et suppression des pubs d&#39;une application Android](https://pro-domo.ddns.net/blog/4images1mot-crack-suppression-pubs-application-android.html)).

Désassemblage vs décompilation

Le désassemblage convertit le bytecode Dalvik en Smali, un langage de bas niveau néanmoins lisible.

La décompilation convertit ou **essaie de convertir**
le bytecode Dalvik en Java, le langage de haut niveau utilisé pour
développer l'application. Il s'agit d'une tentative de restauration du
code source.

Afin d'éviter les prises de tête, gardez à l'esprit que **vous lirez le Java mais modifierez le Smali avant recompilation** .

### Quelques conseils pour la réalisation d'un crack ou la rétro-ingénierie en général

Imprégniez-vous
de l'application cible, testez les fonctionnalités que vous voulez
modifier, regardez les fenêtres avec un regard de développeur. Devinez
ce qui se passe derrière l'interface. Mémorisez les textes, messages de
notifications ou d'erreur.

Une fonctionnalité a l'air d'interroger
un serveur ? Coupez le réseau et observez le message d'erreur. Activez
le debuggage USB pour lire le logcat du téléphone, les développeurs
laissent toujours des routines de debuggage dans leur code. Certains
messages seront forcément utiles.

Ce sont autant de mots et
d'indices que vous pourrez rechercher dans le code et qui vous aideront à
identifier le rôle des routines.

Enfin, si possible, travaillez dans une VM Android si vous testez du code potentiellement dangereux...

### Verrous rencontrés dans ce projet

* Chiffrement des échanges HTTPS.
* Offuscation
  du code par l'éditeur de l'application : Il s'agit de la technique la
  plus ennuyante ; les packages, fonctions, variables sont renommés avec 1
  lettre plus quelques chiffres additionnels.
* Chiffrement des données obtenues depuis une API REST.
* Usage
  de code natif pour brouiller les pistes : Potentiellement un des plus
  ennuyant, sauf si des artefacts de debugging sont oubliés et que le code
  appelle en fait des fonctions Java...
* Protection anti-rejeu de l'API REST.

### Logiciels utilisés


| Outils et liens                                                                     | Remarques                                                                                      |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| [Mitmproxy](https://mitmproxy.org/)                                                 | Détournement du trafic HTTPS                                                                  |
| [jadx-gui](https://github.com/skylot/jadx)                                          | Exploration du code décompilé, coloration syntaxique, recherche des usages et déclarations. |
| [Features overview](https://github.com/skylot/jadx/wiki/jadx-gui-features-overview) |                                                                                                |

Des
logiciels peuvent être utilisés pour décompiler le bytecode Dalvik et
permettre de tracer les usages des fonctions, variables etc. **jadx-gui
sera utilisé car il permet aussi d'explorer le code Smali tout en
renommant en un clic les items dans l'ensemble du projet** . Mieux
que IDA pour le coup, qui ne se base que sur le code Smali ; le
renommage des variables y est complexe car en tant que registres elles
sont réutilisées plusieurs fois dans chaque méthode et contiennent à
tour de rôle des données radicalement différentes.

Il ne manque à jadx-gui que le graphe d'appel des fonctions de IDA (bien que pas très convaincant sur le Java *a priori* ?), et la possibilité d'ajouter des commentaires dans le code. Il **s'agit néanmoins d'un excellent logiciel** .

Vous pouvez aussi tester [jd-gui](https://github.com/java-decompiler/jd-gui) qui fonctionne sur le même principe mais son développement est moins actif. Pensez aussi à [Ghidra (NSA)](https://github.com/NationalSecurityAgency/ghidra/releases) en alternative libre à IDA.

Voici sur stackoverflow, une [liste de décompilateurs/déoffuscateurs](https://reverseengineering.stackexchange.com/questions/1370/what-is-a-good-java-decompiler-and-deobfuscator) récente (08/2020). Citant notamment [CFR](http://www.benf.org/other/cfr/) (support de Java 9, 12 et 14), et [FernFlower](https://github.com/fesh0r/fernflower).

### Objectifs

Captures d'écran des fonctionnalités essentielles de l'application :

[![Capture d'écran Mi Remote de l'écran d'accueil à la validation de la télécommande](https://pro-domo.ddns.net/blog/extra/52/mi_remote_screens_small.png "Capture d'écran Mi Remote de l'écran d'accueil à la validation de la télécommande")](https://pro-domo.ddns.net/blog/extra/52/mi_remote_screens.png)

Que cherche-t-on ?

* Comment les codes infrarouges sont récupérés ?
* Sous quelle forme sont-ils échangés ?
* Quand sont-ils envoyés ?
* Quels traitements subissent t'ils avant leur envoi ?

Que sait-on ?

* Les codes infrarouge sont téléchargés (l'app affiche une erreur en l'absence de réseau).
* L'application va devoir utiliser l'API d'Android pour émettre les codes IR :`android.hardware.ConsumerIrManager` ; c'est une chaine de caractères que l'on peut rechercher dans le projet.

## Contournement HTTPS - Mitmproxy/addSecurityException

L'APK est obtenue sur [Apkpure](https://apkpure.com/fr/mi-remote-controller-for-tv-stb-ac-and-more/com.duokan.phone.remotecontroller).

On utilisera le projet [Mitmproxy](https://mitmproxy.org/) (écrit en Python) afin de s'interposer entre l'application et son serveur (attaque [Man In The Middle](https://en.wikipedia.org/wiki/Man-in-the-middle_attack)).

Depuis
Android 7.0 il faut intégrer une exception de sécurité pour contraindre
une application à accepter un certificat SSL personnalisé.

Je vous invite à suivre l'excellent tuto à ce sujet sur borntocode.fr : [Mitmproxy - Analyser le trafic de vos applications mobiles](https://borntocode.fr/mitmproxy-analyser-le-trafic-de-vos-applications-mobiles/).

Voici le résultat obtenu :

![Requêtes capturées avec mitmproxy](https://pro-domo.ddns.net/blog/extra/52/mi_remote_queries.png "Requêtes capturées avec mitmproxy")

PS : Pour sauvegarder une requête placez-vous dessus, puis appuyez sur 'e' pour spécifier un fichier d'export.

On
identifie clairement les requêtes faites ainsi que de nombreux envois
vers une API de traçage comportemental (pour simplifier, une requête est
faite pour chaque appui sur un bouton de l'application ; étonné ?
Toutes les applications font cela aujourd'hui.).

Fragment de réponse au format JSON :

```
/controller/match/tree/1?version=6034&country=FR&ts=1615096902836&nonce=-1546760834&devid=1&miyk=1&brandid=64&power=1&opaque=c17fd4ce8b4b2d070786448a25344636326efbbc

"ir_zip_key": QJPmll3+SCgpSE73bTO9hni9upbSpKrS73cugR4FZSMT2VGtMTkEIsegm1kjFy3bCLQJsJZKAXxjDF7hGaYIolNzR+qo5f2H3C\/PqsSK2Q8kaQaJAycytxhqhVgnwnOUZ6gj0xXscdkPK3MBzr6HH5yEOGDtocCXKP8qEXZdvctnCmFZaZwubXf1Cscf\/rlVkAz53JacxfUkCiDqw8M27g==
"keysetids":[
    "xm_1_199",   => id interne de la télécommande en bdd
    "xm_1_2425"
],
"children_index":[7,8],
"frequency":37990, => frequence
"level":1,
"parent_index":0,
"index":6,         => position dans la liste des codes proposés
"keyid":"power"    => type de code correspondant à ir_zip_key
```

`ir_zip_key` est vraisemblablement encodé en base64 mais son décodage n'est pas plus informatif :

```
>>> list(base64.b64decode(st))
[64,147,230,150,93,254,72,40,41,72,78,247,109,51,189,134,120,189,186,150,210,164,170,210,239,119,46,129,30,5,101,35,19,217,81,173,49,57,4,34,199,160,155,89,35,23,45,219,8,180,9,176,150,74,1,124,99,12,94,225,25,166,8,162,83,115,71,234,168,229,253,135,220,47,207,170,196,138,217,15,36,105,6,137,3,39,50,183,24,106,133,88,39,194,115,148,103,168,35,211,21,236,113,217,15,43,115,1,206,190,135,31,156,132,56,96,237,161,192,151,40,255,42,17,118,93,189,203,103,10,97,89,105,156,46,109,119,245,10,199,31,254,185,85,144,12,249,220,150,156,197,245,36,10,32,234,195,195,54,238]
```

Il n'y a pas de motif répété dans cette liste,
c'est pourtant ce que l'on observe dans le même code non chiffré
récupéré dans une base de données publique ([irdb.tk](http://irdb.tk/find/)) :

```
347,173,22,22,22,22,22,22,22,22,22,22,22,22,22,65,22,22,22,65,22,65,22,65,22,65,22,65,22,65,22,22,22,65,22,22,22,65,22,22,22,22,22,65,22,22,22,22,22,22,22,65,22,22,22,65,22,65,22,22,22,65,22,65,22,65,22,4892
```

Les valeurs *a priori* aléatoires traduisent une entropie élevée, donc potentiellement du code chiffré.

## À la recherche du parser JSON

Note

À
partir de maintenant j'utilise massivement la recherche récursive de
chaines dans le dossier de l'APK décompilée. Mettre ce genre de fonction
dans votre fichier `.bashrc` vous fera gagner un temps monstrueux.

```
function search() { echo "Recherche de $1 ..."; grep --color=auto -in -R "$1" ./*; }
```

Nous savons que la clé `ir_zip_key`
est forcément présente dans le code de l'application lors de
l'interprétation des données ; on trouve effectivement la fonction
responsable :

```
// ./com/xiaomi/mitv/phone/remotecontroller/ir/dk/model/DKDataParser.java
getMatchTree(..)
    // Accepte un int + JSONObject
    // Retourne un objet de type c.k.i.b.b.b1.p.f (binding objet sur un fabricant de matériel ?) initialisé par les données
    [...]

    if (jSONObject4.has("ir_zip_key")) {
        // Bidouille ir_zip_key avec frequency => Type de retour ??? Probablement un binding objet sur un pattern
        // à quoi sert str ? a priori pas utilisé, initialisé à null ??
        c.k.i.b.b.b1.p.p.e eVar2 = new c.k.i.b.b.b1.p.p.e(
            102,                                                // int encrypt
            new a(str, jSONObject4.getString("ir_zip_key")),    // d   code_ir
            jSONObject4.getInt("frequency")                     // int frequency
        );
        if (jSONObject4.has("ir_zip_key_r")) {       // reverse IR code
            eVar2.a(new a(null, jSONObject4.getString("ir_zip_key_r")));
        }
        if (jSONObject4.has("keyid")) {              // Nom de la commande
            eVar2.a(jSONObject4.getString("keyid")); // set_keyid
        }
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(eVar2);
        eVar.a(arrayList2);
        eVar.c(0);
        gVar.a(eVar);
    }
    [...]
}
```

Au premier coup d'œil on remarque que les packages, classes, fonctions et variables sont renommés. **Le code est offusqué pour ralentir la rétro-ingénierie en réduisant sa lisibilité** . C'est une manœuvre délibérée pour nuire à qui viendrait y mettre son nez.

Certaines fonctions restent néanmoins en clair comme `getMatchTree`, idem pour les slots/callbacks attachés aux signaux (`onFailed, onClick, onClickListener, setPressInterval`,
etc.), tout comme certains packages utilisés par l'application. On voit
que tout n'est pas développé spécifiquement pour ce projet, que tous
les packages ne sont pas conçus par les mêmes personnes et que par
conséquent l'offuscation est inégale.

L'offuscation est une plaie
car tout ce qui guide un développeur se ressemble. Vous ne saurez plus
où vous en êtes quand vous aurez parcouru 3 fichiers sans commentaires
contenant tous une dizaine de variables et fonctions nommées "a" ou "b".

Notez
que de nombreux "développeurs" utilisent déjà "ces astuces" sans le
savoir et par incompétence... Si vous travaillez dans un labo de
recherche ou en SSII ce genre de code vous paraîtra normal. Spoiler : ça
ne l'est pas.

Vous pouvez annoter les fichiers `.java` décompilés comme je l'ai fait dans l'exemple, mais à terme **vous allez devoir utiliser jadx-gui pour gérer le projet dans sa globalité** .
L'APK décompilée éparpille son code sur des centaines de fichiers,
n'espérez pas appréhender cela dans un simple éditeur de texte.

**Quand
vous identifiez clairement une fonction/variable, n'hésitez pas à la
renommer dans le logiciel. Cet outil formidable est fait pour ça !** J'y reviendrai dans la seconde partie de cet article.

## La transmission du code infrarouge

`getMatchTree()` est appelée depuis un objet `MatchIRActivityV52` ; son résultat est placé dans un attribut de cette classe.

```
@Override // c.k.i.b.b.y0.g.w
public void a(JSONObject jSONObject) {
    [...]
    matchIRActivityV52.C = DKDataParser.getMatchTree(this.a, jSONObject);
    [...]
}
```

On sait que l'interface propose quelques boutons : gauche, droite, envoyer le code, oui, non.

L'activité (fenêtre Android) `MatchIRActivityV52`
gère les interactions avec l'utilisateur et décide ultimement de
l'envoi du code. On identifie assez clairement les routines activées
lors d'un clic sur ces boutons :

```
LongPressButtonWidget J;
LongPressButtonWidget K;
LongPressButtonWidget L;
```

Traçons leurs usages :

```
this.L.setLongPressButtonListener(this.j0);
this.J = (LongPressButtonWidget) findViewById(2131296401);
this.K = (LongPressButtonWidget) findViewById(p.i.arrow_right);
```

Seul `L` semble attaché à un callback, il est donc probable qu'il soit le bouton d'envoi du code IR.

Un peu plus bas :

```
private void a(int i) {
    c.a.a.a.a.b("changeState: ", i);
    [...]
    try {
        this.L.setPressInterval(800);
        String d2 = this.C.g().a().d();
        // Test fonction du code à envoyer
        if (d2.equals("power") || d2.equals("off") || d2.equals("on") || d2.equals("poweroff") || d2.equals("poweron")) {
            this.L.setPressInterval(2000); // Désactive le bouton pendant l'envoi du code
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    s();    // Demande d'envoi
    [...]
}
```

Les chaines sont assez explicites : le programme
teste si le code parsé en interne a un rôle acceptable pour le cas
d'usage (envoi d'un code d'extinction/allumage); puis appelle la
fonction `s()` qui à son tour appelle la fonction suivante :

```
public void m() {
    e eVar = this.j;  // notre fameux objet e wrapper JSON...
    if (eVar == null) {
        v.f(o, "sendIr bur mCurMatchData null");
        return;
    }
    try {
        {{ [...]
            } else {
                // Passe l'objet contenant les codes et les envoie
                // Appelle finalement a(eVar, true, false) (send_IR())
                p0.g().a( // send_IR()
                    this.j.a() // c.k.i.b.b.b1.p.e.a(): objet e courant sur l'ui
                );
                return;
            }
        }
        // Passe l'objet contenant les codes et les envoie
        p0.g().a( // send_IR()
            this.j.a(), // c.k.i.b.b.b1.p.e.a(): objet e courant sur l'ui
            true,
            true
        );
    } [...]
}
```

---

`./c/k/i/b/b/b1/g.java` est la classe la plus importante à ce niveau et contient notamment :

* Une méthode utilisant l'API `android.hardware.ConsumerIrManager`; Spoiler : Cette fonction n'est jamais appelée :p
  ```
  public void a(int i, int[] iArr) {
      if (this.a.hasIrEmitter()) {
          this.a.transmit(i, iArr);
      }
  }
  ```
* La méthode `a()` que j'appelle `send_IR()`, citée dans le code du paragraphe précédent :
  ```
  public void a(e eVar, boolean z, boolean z2) {
      // eVar (structure de données parsée depuis le JSON), bool_vibro, ?? (booléen non utilisé)
      String str;
      d dVar;
      c cVar;
      if (eVar != null) {
          StringBuilder b2 = a.b("sendIR:");
          b2.append(eVar.d());            // get_keyid
          Log.e(v0.a, b2.toString());     // log du rôle du code IR traité "miauto  : sendIR:power"
                                          // à ce moment le code est encore chiffré
          if (z) {
              i0.a().a(v0.a());           // Déclenche vibreur téléphone
          }

          if (this.bool_positive_code) {  // Test bool_positive_code
              dVar = eVar.b();            // objet de type c.k.i.b.b.b1.p.p.d
              str = "发正码";              // Envoyer un code positif
          } else {
              dVar = eVar.e();            // objet de type c.k.i.b.b.b1.p.p.d
              if (dVar != null) {
                  str = "发反码";          // Retourne inverted code si présent;
              } else {
                                          // Sinon envoi le code positif
                  dVar = eVar.b();        // objet de type c.k.i.b.b.b1.p.p.d
                  str = "没有反码，发正码"; // Pas de code inverse, envoyer un code positif
              }
          }
          a(str);                         // Fonction de debugging vidée en production
          this.bool_positive_code = !this.bool_positive_code;
          // à la base dVar est de type c.k.i.b.b.b1.p.p.d
          if (dVar instanceof f) {
              // c.k.i.b.b.b1.p.p.f
              // String pulse wrapper: class f extends c
              // public f(String str, String str2) {
              //    super(1001, str, str2); // valeur mystère = 1001
              //}
              cVar = (f) dVar; // cast dvar => f
              if (eVar.a() <= 0) {
                  return;                 // Quitte si frequency négative
              }
          } else if (dVar instanceof c.k.i.b.b.b1.p.p.a) {
              cVar = (c.k.i.b.b.b1.p.p.a) dVar;  // cast dvar => a
          } else if (dVar instanceof b) { // c.k.i.b.b.b1.p.p.b: classe capable de compresser le tableau int[]
              // send_async_clear_pulses
              a(
                  eVar.a(),               // a() = get_frequency
                  ((b) dVar).b(),         // iArr_clear_pulses: int[] c.k.i.b.b.b1.p.p.b.b(): b() = get_int_array()
                  true,                   // bool_dont_process_pulses
                  false                   // bool_vibro
              );
              return;
          } else {
              return;
          }
          // send_async_string_pulses
          // types dvar: f ou a
          c(
              eVar.a(),                   // a() = get_frequency
              cVar.c(),                   // null
              cVar.b()                    // code IR chiffré (string téléchargé)
          );
      }
  }
  ```

Elle contient une chaine explicite `sendIR` ainsi que du debuggage en mandarin qui n'apparait pas lors de l'exécution, mais révèle la nationalité de ses auteurs.

Les mentions d'un code "inversé" font allusion à un 2ième code IR (`ir_zip_key_r`) présent pour certains modèles d'appareils.

Plus important, on découvre que le programme peut traiter 2 types de codes via 2 méthodes à la fin de `send_IR()` :

* `a()/send_async_clear_pulses()` : un non chiffré prêt à l'emploi sous forme de tableau d'entiers (`int[]`),
* `c()/send_async_string_pulses()` : un 2ième code sous forme de`String`.

L'essentiel est de savoir si notre code chiffré a été déchiffré avant cette fonction ou s'il l'est après.

Les logiciels proposant des diagrammes d'appels comme IDA sont utiles
lors de cette étape de recherche. Toutefois IDA se repose sur le
désassemblage en Smali, peu lisible. Dans le cas présent je préfère lire
directement le Java décompilé dans jadx-gui.

[![IDA call graph désassemblage Smali](https://pro-domo.ddns.net/blog/extra/52/IDA_callgraph_small.png "IDA call graph désassemblage Smali")](https://pro-domo.ddns.net/blog/extra/52/IDA_callgraph.png)

Ultimement
les 2 fonctions suivantes seront appelées dans un thread séparé, selon
le type de code (remarquer la surcharge de méthodes) :

```
public void a(int i, int[] iArr) {              // Tableau d'entiers
    // Depuis send_async_clear_pulses()
    if (this.a.hasIrEmitter()) {
        this.a.transmit(i, iArr); // API Android
    }
}

/* renamed from: b */
public void a(int i, String str, String str2) { // Strings
    // Depuis send_async_string_pulses()
    Miir.b(v0.a(), i, str, str2);
}
```

Dans les 2 cas il y a un travail supplémentaire à faire :

* Soit le code est clair et on a raté son déchiffrement
* Soit le code est encore chiffré et on va devoir trouver les routines de déchiffrement dans les méandres de l'objet`Miir`...

## Analyse des logs Android

Il
est plus que temps d'analyser les logs via le logcat d'Android
(activons le debuggage USB dans les options développeur du téléphone),
puis entrons cette commande dans un terminal pour récupérer tous les
logs du système (`adb` est fournit dans le sdk) :

```
./adb logcat > android.log
```

L'activation du bouton "Désactiver" de l'application génère ce texte dans les logs :

```
E IRLongPressWidget: onSingleTapUp
E miauto  : sendIR:power
D miir    : ==============transmitIR================
D miir    : decrypt
D miir    : uncompress
D miir    : uncompress over
D miir    : jsonStringToInts
D miir    : transmit
```

Ce debugging indique que :

* le code est**déchiffré avant chaque envoi** , après l'appel de`send_IR()` (cf. la position de la chaine "sendIR:power")
* la procédure est :*déchiffrement/décompression/cast en int[]/émission* .
  L'étape "uncompress over" est une faute d'anglais pour "uncompress
  done" : il n'y a pas de sur-décompression comme ça le laisse penser...

## Miir : Moins offusqué qu'il n'y parait

Allons voir la méthode `Miir.b()` dans le fichier `./com/xiaomi/mitv/phone/remotecontroller/ir/Miir.java` :

```
public static int b(Context context, int i, String str, String str2) {
    if (str2 == null) {
        return 1;           // Coucou, je suis un code d'erreur jamais testé <3
    }
    a.d("encode: ", str2);  // Debug masqué en release
    try {
        return a().transmitIR(context, i, str, str2); // Envoi IR
    } catch (UnsatisfiedLinkError e) {
        e.printStackTrace();
        return 1;           // Coucou, je suis un code d'erreur jamais testé <3
    } catch (Exception e2) {
        e2.printStackTrace();
        return 1;           // Coucou, je suis un code d'erreur jamais testé <3
    }
}
public native int[] getIRCode(Context context, int i, String str, String str2);
public native String getIRContent(Context context, byte[] bArr);
public native int transmitIR(Context context, int i, String str, String str2);
```

Le mot-clé `"native"` indique que `transmitIR()` ainsi que ces amies toutes aussi intéressantes `getIRCode()` et `getIRContent()`,
sont implémentées et compilées en code natif dans un langage bas niveau
(C), puis importées via la JNI (Java Native Interface).

Note

À
ce stade vous auriez pu/dû vous précipiter sur une recherche de strings
caractéristiques tels que "==============transmitIR================"
sur l'ensemble du projet. Vous auriez vu que du code natif est appelé
puisque ces chaines sont localisées dans une librairie :

```
$ search "==============transmitIR================"
Fichier binaire ./lib/arm64-v8a/libmiir.so correspondant
Fichier binaire ./lib/armeabi-v7a/libmiir.so correspondant
```

Je détaille la procédure complète car c'est celle que j'ai suivie, mais n'oubliez pas que **le but n'est pas de comprendre la moindre ligne de code de ce projet** .
Il faut aller à l'essentiel c.-à-d. découvrir les routines de
déchiffrement. Toutefois, personnellement il n'est pas certain qu'une
fois le nez devant, je les aurais comprises sans connaître leur contexte
d'usage...

## Patch de l'application

### Rappels Smali

À
partir de maintenant (voire même avant selon les besoins) il peut être
intéressant de patcher l'application aux endroits stratégiques.

Les
modifications du code Smali peuvent nécessiter l'usage de variables
(registres) locales supplémentaires. Leur nombre est déclaré au début de
chaque fonction avec la directive `.locals x`. Pour `x` ayant une valeur de 2, vous avez accès aux variables `v0` et `v1`. Les variables nommées `px`
correspondent aux arguments de la fonction ; leur nombre est donc fixe.
Les méthodes de classes reçoivent l'instance sur le registre `p0`, les arguments sont dans les registres à partir de `p1`. Si la méthode est statique, `p0` correspond au premier argument.

Gagnez du temps, au lieu de chercher si une variable est libre, créez-en une nouvelle.

Court exemple de code pour afficher une variable dans le logcat (`Log.e()`) :

```
.locals 2
# PATCH increment 1 to 2 for v1 var
...
# PATCH
const-string v1, "TAG"
# Display p3 variable
invoke-static {v1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
# END PATCH
```

N'hésitez pas à écrire du code Java puis à le convertir en Smali pour l'étudier :

```
public class HelloWorld {
    public static void main(String[] args) {
        int i = 3;

        String str = String.valueOf(res);
        System.out.println(str);
    }
}
```

Compilation :

```
javac  HelloWorld.java
./sdk/build-tools/29.0.2/dx --dex --output=classes.dex HelloWorld.class
baksmali d classes.dex
```

Résultat :

```
const/4 v0, 0x3
invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
move-result-object v0
sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
```

### Patch

* Premier patch : Afficher la fréquence et le code chiffré dans `send_IR()` avant l'appel de l'objet Miir :
  Rappel du code Java :

  ```
  // send_async_string_pulses
  c(
      eVar.a(),                   // a() = get_frequency
      cVar.c(),                   // null
      cVar.b()                    // code IR chiffré (string téléchargé)
  );
  ```

  Code Smali :

  ```
  .method public a(Lc/k/i/b/b/b1/p/p/e;ZZ)V
      .locals 3
      # PATCH 1 => 3 (need v1, v2)
      [...]
      # frequency is in p1
      invoke-virtual {p1}, Lc/k/i/b/b/b1/p/p/e;->a()I
      move-result p1
      # null in p3
      invoke-virtual {p2}, Lc/k/i/b/b/b1/p/p/c;->c()Ljava/lang/String;
      move-result-object p3
      # IR crypted code in p2
      invoke-virtual {p2}, Lc/k/i/b/b/b1/p/p/c;->b()Ljava/lang/String;
      move-result-object p2

      # PATCH
      const-string v1, "TAG string freq"
      # Cast frequency int to String
      invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
      move-result-object v2
      invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

      const-string v1, "TAG string IR code"
      invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
      # END PATCH

      invoke-direct {p0, p1, p3, p2}, Lc/k/i/b/b/b1/g;->c(ILjava/lang/String;Ljava/lang/String;)V
  ```
* Deuxième patch : Forcer le déchiffrement du code par la fonction native non utilisée `getIRCode()` :

  ```
  .method public b(ILjava/lang/String;Ljava/lang/String;)V
      .locals 3
      # PATCH 1 => 3 (need v1, v2)

      invoke-static {}, Lc/k/i/b/b/v0;->a()Landroid/content/Context;
      move-result-object v0
      # Call native transmitIR()
      invoke-static {v0, p1, p2, p3}, Lcom/xiaomi/mitv/phone/remotecontroller/ir/Miir;->b(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)I

      # PATCH
      const-string v1, "TAG"
      const-string v2, "TAG decode int array"
      invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

      # We add a call to the native getIRCode()
      invoke-static {v0, p1, p2, p3}, Lcom/xiaomi/mitv/phone/remotecontroller/ir/Miir;->a(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)[I
      # Put the result of getIRCode in v1
      move-result-object v1

      # Convert int array to String and display it in the logger
      invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;
      move-result-object v2
      const-string v1, "TAG int pulse decoded"
      invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
      # END PATCH

      return-void
  .end method
  ```

Résultat :

```
E IRLongPressWidget: onSingleTapUp
E miauto  : sendIR:power
E TAG    : code positif
E TAG string freq: 37990
E TAG string IR code: QJPmll3+SCgpSE73bTO9h...
D miir    : ==============transmitIR================
D miir    : decrypt
D miir    : uncompress
D miir    : uncompress over
D miir    : jsonStringToInts
D miir    : transmit
E TAG    : test decode int pulse
D miir    : ==============get IR code================
E TAG int pulse decoded: [9042, 4484, 579, 552, 580, 567, 579, 567, 544, 554, ...
```

L'application nous donne elle-même le code. Les valeurs du tableau ne sont pas celles attendues mais j'y reviens à la fin.

## Décompilation de la librairie native et routines de déchiffrement

IDA va de nouveau nous servir, plus efficacement et sur la librairie native cette fois :

Chargez
le fichier, choisissez "ELF for ARM (Shared Object)" comme type de
fichier (si non détecté automatiquement), puis "ARM Little-Endian" en
type de processeur.

![IDA call graph; Décompilation de d'une librairie native Android avec IDA](https://pro-domo.ddns.net/blog/extra/52/call_java_from_native.png "IDA call graph; Décompilation de d'une librairie native Android avec IDA")*Décompilation de ./lib/armeabi-v7a/libmiir.so avec IDA*

On y voit quelques chaines intéressantes car bien connues en Java : `java/lang/String, getBytes, utf-8`. Puis des appels à `JNIEnv::CallObjectMethod`. En effet, notre string est convertit en `byte[]` (grâce à un code du type `str.getBytes("utf-8")`).

Pour rappel voici la structure d'une fonction typique écrite en C et appelant une fonction Java :

```
int my_function() {
    // Get JNI environment
    JNIEnv *env = JniGetEnv();

    // Find the Java class via its package's path
    jclass jniTestClass = env->FindClass("com/example/JNITest");

    // Find the Java method
    // "(Z)I;": Arguments inside (): Java env, and the type of the return value (int here)
    jmethodID myMethod = env->GetStaticMethodID(jniTestClass, "myMethod", "(Z)I;");

    // Call the method
    return (int)env->CallStaticObjectMethod(jniTestClass, myMethod, (jboolean)true);
}
```

Voir les articles à ce sujet :

* [How to call a Java method from native code](https://riptutorial.com/android/example/27060/how-to-call-a-java-method-from-native-code)
* [Stackoverflow: What is the native keyword in Java](https://stackoverflow.com/questions/6101311/what-is-the-native-keyword-in-java-for)
* [Cours Java Native Interface](https://www.jmdoudoux.fr/java/dej/chap-jni.htm)

Extrait du code relatif aux routines de déchiffrement :

```
.rodata:00002C46 aComXiaomiMitvS DCB "com/xiaomi/mitv/socialtv/common/utils/EncryptUtil",0
.rodata:00002C46                                         ; DATA XREF: transmitIR+98o
.rodata:00002C46                                         ; .text:off_E00o ...
.rodata:00002C78 aDecrypt        DCB "decrypt",0         ; DATA XREF: transmitIR+AAo
.rodata:00002C78                                         ; .text:off_E04o ...
.rodata:00002C80 aBBB            DCB "([B[B)[B",0        ; DATA XREF: transmitIR+B2o           2 taleaux de bytes; retourne bytes
.rodata:00002C80                                         ; .text:off_E08o ...
.rodata:00002C89 aUncompress     DCB "uncompress",0      ; DATA XREF: transmitIR+C6o
.rodata:00002C89                                         ; .text:off_E0Co ...
.rodata:00002C94 aBLjavaLangStri DCB "([B)Ljava/lang/String;",0 ; DATA XREF: transmitIR+C8o    1 tableau de bytes; retourne un string
.rodata:00002C94                                         ; .text:off_E10o ...
.rodata:00002CAB aUncompressOver DCB "uncompress over",0 ; DATA XREF: transmitIR+118o
.rodata:00002CAB                                         ; .text:off_E20o ...
.rodata:00002CBB aComXiaomiMit_0 DCB "com/xiaomi/mitv/socialtv/common/utils/IOUtil",0
.rodata:00002CBB                                         ; DATA XREF: transmitIR+126o
.rodata:00002CBB                                         ; .text:off_E24o ...
.rodata:00002CE8 aJsonstringtoin DCB "jsonStringToInts",0 ; DATA XREF: transmitIR+13Ao
.rodata:00002CE8                                         ; .text:off_E28o ...
.rodata:00002CF9 aLjavaLangStr_0 DCB "(Ljava/lang/String;)[I",0 ; DATA XREF: transmitIR+13Co
```

Vous l'avez compris, ce code natif ne fait qu'appeler des fonctions déjà définies dans un module rédigé en Java.

Son
existence n'est là que pour brouiller les pistes. Dommage de s'être
donné autant de mal pour finalement laisser trainer des strings de
debuggage franchement explicites attirant l'attention...

Debugging
actif ou non la découverte de ce code est inévitable ; appels Java ou
non sa décompilation l'est tout autant ; ce n'est qu'une question de
minutes à ce niveau.

Nous avons donc le nom des fonctions appelées, leur localisation (`com/xiaomi/mitv/socialtv/common/utils/EncryptUtil`) et leur contenu :

```
// Variable très secrète bien ortographiée (spoiler : rien à voir avec l'algo DES)
public static final String DESCRYPTED_KEY = "fd7e915003168929c1a9b0ec32a60788";

public static byte[] decrypt(String str, String str2) {
    [...]
    return decrypt(str.getBytes("UTF-8"), str2.getBytes("UTF-8"));
}

public static byte[] decrypt(byte[] bArr, byte[] bArr2) {
    SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "AES");  // Déchiffrement AES avec DESCRYPTED_KEY
    Cipher instance = Cipher.getInstance("AES/ECB/NoPadding");
    instance.init(2, secretKeySpec);
    return instance.doFinal(Base64.decode(bArr, 0));
}

public static String uncompress(byte[] bArr) {                      // Décompression GZip
    GZIPInputStream gZIPInputStream = new GZIPInputStream(new ByteArrayInputStream(bArr));
    [...]
}
```

Vous pouvez vous faire un programme Java en
recopiant ces fonctions afin de tester les entrées/sorties. Ou faire une
implémentation Python quand vous voudrez passer à un langage sérieux
(:p) :

```
import base64
import gzip
from Crypto.Cipher import AES

PATTERN_SECRET_KEY = "fd7e915003168929c1a9b0ec32a60788"

def decrypt_pattern(encoded_pattern):
    """Decrypt base64 string with AES ECB mode and a known "secret key"

    :param encoded_pattern: Encrypted text
    :type encoded_pattern: <str>
    :return: Decrypted bytes
    :rtype: <bytes>
    """
    # Base64 decode
    encoded_pattern = base64.b64decode(encoded_pattern)
    cipher = AES.new(PATTERN_SECRET_KEY.encode(), AES.MODE_ECB)
    # Remove trailing padding spaces
    return cipher.decrypt(encoded_pattern).rstrip()


def process_xiaomi_shit(encoded_pattern):
    """Process encoded IR pattern from the API of Xiaomi

    Operations:
        - Decode base64 string
        - Decrypt pattern (AES ECB mode) with a known "secret key"
        - Uncompress GZIP data to recover the plain text as a JSON array
        - Convert JSON array to Python list

    :param encoded_pattern: Base64 encoded, AES ECB crypted, GZip compressed pattern.
        .. seealso:: :meth:`decrypt_pattern`
    :return: List of raw timmings corresponding to the IR code.
        Each value is the time during the transmitter should be stay ON or OFF
        (It's not based on the number of pulses regarding to the frequency used).
    """
    decrypted_pattern = decrypt_pattern(encoded_pattern)
    plain_text = gzip.decompress(decrypted_pattern)
    return json.loads(plain_text)
```

Idem mais en version "développeur"
"moderne"/"chercheur" (supprimez les commentaires et les sauts de ligne ;
si c'est moins long c'est plus rapide non ?) :

```
json.loads(gzip.decompress(AES.new(PATTERN_SECRET_KEY.encode(), AES.MODE_ECB).decrypt(base64.b64decode(encoded_pattern)).rstrip()))
```

Comparez-les sorties avec celles du logcat suite aux patchs du Smali.

=> c'est bon.

### Conversion des valeurs

On
sait que les valeurs passées à l'API sont des durées en microsecondes.
Ce sont les valeurs que nous venons de déchiffrer. Toutefois certaines
bases de données ou formats encodent ces durées en nombre de pulsations
pour une fréquence donnée (en Hz).

Cela revient au même mais il faut pourvoir convertir ces valeurs. via un simple produit en croix.

Ainsi, pour une durée de 9042µs à 37990Hz :

```
9042 µs      => x pulsations
1s (10^6 µs) => 37990 pulsations

x = (37990 * 9042) / 1 000 000 = 343 pulsations
```

Idem pour `(4484*37990)/1000000 = 170` pulsations.

Ainsi :

```
[9042, 4484, 579, 552, 580, 567, 579, 567, 544, 554, ...
```

devient :

On retrouve ainsi les valeurs obtenues sur irdb.tk (PS: des écarts de 10% sont tolérés par les appareils).

=> Lire l'excellente suite d'articles sur l'encodage des touches de
télécommande dans un signal infrarouge sur remotecentral.com ([Codes infrarouges : Pronto&#39;s IR Code Format](http://www.remotecentral.com/features/irdisp1.htm)).

## Conclusion

Le
HTTPS n'a pas été un problème ; l'offuscation et l'usage de code natif
sont conçus exclusivement pour décourager la rétro-ingénierie en
masquant le détail de la procédure de déchiffrement et de décompression.
Toutefois les méthodes utilisées ont été codées en Java et décompilées
dès le début de l'étude.

Nous maitrisons donc pleinement le déchiffrement des codes infrarouge obtenus auprès de l'API de Xiaomi.

Toutefois
nous souhaiterions dorénavant récupérer les codes sans passer par
l'application... La méthode manuelle de sélection d'un appareil, suivie
de l'envoi d'un code, puis de sa récupération par le logcat est
fastidieuse et irréalisable à plus grande échelle.

Le but est bien entendu de faire un dump complet de la base de données, puis d'en faire un joli projet envoyé sur GitHub...

## Sources

* [Codes infrarouges : Pronto&#39;s IR Code Format](http://www.remotecentral.com/features/irdisp1.htm).
* [Android documentation : Build process](https://developer.android.com/studio/build/index.html).
* [Mitmproxy](https://mitmproxy.org/).
* [Crowd-sourced, manufacturer-independent databases of infrared remote control codes: irdb.tk](http://irdb.tk/find/).
* [Man In The Middle attack](https://en.wikipedia.org/wiki/Man-in-the-middle_attack).
* [Mitmproxy - Analyser le trafic de vos applications mobiles](https://borntocode.fr/mitmproxy-analyser-le-trafic-de-vos-applications-mobiles/).
* [Reversing native libs](https://www.ragingrock.com/AndroidAppRE/reversing_native_libs.html).
* [Reverse engineering and tampering](https://mobile-security.gitbook.io/mobile-security-testing-guide/android-testing-guide/0x05c-reverse-engineering-and-tampering).
* [How to call a Java method from native code](https://riptutorial.com/android/example/27060/how-to-call-a-java-method-from-native-code).
* [Stackoverflow: What is the native keyword in Java](https://stackoverflow.com/questions/6101311/what-is-the-native-keyword-in-java-for).
* [Cours Java Native Interface](https://www.jmdoudoux.fr/java/dej/chap-jni.htm).



[pro-domo.ddns.net](https://pro-domo.ddns.net/blog/hack-application-android-xiaomi-mi-remote-partie-2.html)

# Rétro-ingénierie d'une application Android - Xiaomi Mi Remote - Partie 2

Lex

13-17 minutes
- jeu. 11 mars 2021post n°53

![Mi Remote icone](https://pro-domo.ddns.net/blog/extra/52/mi_remote_icon.webp "Mi Remote icone")

Suite de la [partie 1](https://pro-domo.ddns.net/blog/hack-application-android-xiaomi-mi-remote-partie-1.html)
sur la rétro-ingénierie de l'application Mi Remote, dans laquelle nous
avions trouvé comment retrouver en clair les codes infrarouges provenant
de l'API REST de Xiaomi.

Cette partie traitera de la mise en œuvre d'un procédé de récupération complet de la base de données.

## Sommaire

* [Sommaire](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-2.html#sommaire)
* [Détail d&#39;une requête](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-2.html#detail-dune-requete)
* [Un problème opaque...](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-2.html#un-probleme-opaque)
* [Recherche dans le projet et fausses pistes](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-2.html#recherche-dans-le-projet-et-fausses-pistes)
* [Assemblage de la requête HTTP](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-2.html#assemblage-de-la-requete-http)
* [Patchs](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-2.html#patchs)
* [Implémentation en Python](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-2.html#implementation-en-python)
* [Conclusion](about:reader?url=https%3A%2F%2Fpro-domo.ddns.net%2Fblog%2Fhack-application-android-xiaomi-mi-remote-partie-2.html#conclusion)

## Détail d'une requête

Je
rappelle quelques exemples de requêtes envoyées au serveur par
l'application, selon les choix de l'utilisateur. Nous y voyons la
récupération de la liste des appareils, la liste des marques connues
pour un type d'appareil, puis la liste des modèles connus pour la marque
sélectionnée.

![Requêtes capturées](https://pro-domo.ddns.net/blog/extra/52/mi_remote_queries_2.png "Requêtes capturées")

L'ordre des paramètres est fixe et est important :

* Préfixe de l'url: Chemin vers le controlleur de l'API interrogée :
  * /controller/device/1
  * /controller/brand/list/1
  * /controller/match/tree/1
* Paramètres fixes :
  * version: Version de l'application
  * country: Identifiant de pays (FR, CN, US, etc.)
  * ts: Timestamp en millisecondes
  * nonce: Nombre aléatoire
* Paramètres "utilisateur" variables :
  * devid: Type d'appareil choisi (1: TV, 10: Projecteur, etc.)
  * miyk: ? - Fixé à 1
  * brandid: Identifiant de la marque sélectionnée (64: Toshiba, etc.)
* paramètre fixe de fin :
  * opaque: Chaine hexadécimale

Ces connaissances sont déduites de l'étude des données JSON exportées depuis Mitmproxy.

## Un problème opaque...

Si
vous essayez de réutiliser une requête déjà émise vous obtiendrez de
nouveau la réponse (probablement durant un laps de temps modéré ;
n'espérez pas pouvoir réutiliser une requête datant d'un an).

Si vous essayez de modifier certains paramètres comme `brandid` la réponse du serveur sera vide.

En
effet, une requête est un ensemble fixe non altérable de paramètres. Le
serveur refuse de traiter une requête forgée arbitrairement. Il s'agit à
la fois d'une protection [anti-rejeu](https://fr.wikipedia.org/wiki/Attaque_par_rejeu) et d'une obligation d'authentification auprès du serveur.

En clair votre application montre patte blanche pour que sa demande soit honorée.

La plupart du temps la requête contient un jeton de session obtenu par
concaténation de divers paramètres envoyés dans une fonction de hachage
cryptographique (fonction acceptant une entrée de taille variable et
ayant une sortie de taille fixe, empêchant le re-calcul de la donnée
d'entrée). [SHA-1](https://fr.wikipedia.org/wiki/SHA-1) est
souvent utilisée dans ce contexte. Le jeton est ajouté à la requête
avant son envoi. Vous l'avez compris ce jeton certifiant est nommé `opaque` dans Mi Remote.

Afin
d'éviter que l'url ne puisse être réutilisée, le jeton doit changer à
chaque fois même si les paramètres demandés par l'utilisateur ne
changent pas. Cette notion d'aléatoire est apportée par le timestamp `ts` et par le `nonce`
(une chaine ou un nombre aléatoire). En effet, le timestamp seul ne
suffit pas, car émettre une requête avec une date future assurererait sa
validité.

Il faut également noter que parfois un [sel cryptographique](https://fr.wikipedia.org/wiki/Salage_(cryptographie))
est ajouté aux paramètres avant hachage. Il est en général utilisé pour
que deux informations identiques aboutissent à un résultat différent de
la fonction de hachage (par exemple des mots de passe d'utilisateurs
identiques donneront des hashs différents avec des sels différents avant
stockage en base de données). Le salage n'est évidemment efficace que
si personne ne connait le sel utilisé...

L'intégration d'un sel dans les urls forgées d'une application décompilable est douteux, mais nous avons déjà vu dans la [partie 1](https://pro-domo.ddns.net/blog/hack-application-android-xiaomi-mi-remote-partie-1.html) que les développeurs se donnent du mal pour ralentir l'étude de leur application...

Le but de cet article revient donc à trouver l'algorithme produisant le paramètre `opaque`.

## Recherche dans le projet et fausses pistes

Comme montré dans la [partie 1](https://pro-domo.ddns.net/blog/hack-application-android-xiaomi-mi-remote-partie-1.html), faites une recherche du mot `opaque` dans le projet. Il sera présent dans quelques fichiers.

Exemple :

```
// classes2.dex: ./c/k/i/b/b/b1/r/e.java
public static String a(String str, String str2) {
    [...]
    c2.append(String.format("session_secret=%s", c.k.j.a.c.a.f.a.a.b(encoded_random_str, "UTF-8")));
    c2.append(String.format("&data=%s", c.k.j.a.c.a.f.a.a.b(encoded_url_part2, "UTF-8")));
    // Ajoute opaque et retourne l'url
    c2.append(String.format("&opaque=%s", c.k.j.a.c.a.f.a.a.b(str2, "UTF-8")));
    return c2.toString();
}
```
Fausse alerte : Cette url ne nous concerne pas car elle contient des paramètres inconnus (`session_secret` et `data`).
De même, une autre occurence proposera les bons termes mais dans le
désordre. Le programme a l'air d'être truffé de code ancien.

Nous trouvons enfin:

```
// classes3.dex: c/k/j/a/i/.c.java
// Renommage en str_add_opaque_str2
public static String a(String str, String str2) {
    return str + "&" + "opaque" + "=" + str2;
}
```
---

À partir de maintenant, jadx-gui va amplement
simplifier l'étude en nous permettant de retrouver les fonctions qui
utilisent ce code, tout en renommant des items dans tout le projet en un
clic.

![comparaison jadx-gui vs simple éditeur de texte](https://pro-domo.ddns.net/blog/extra/52/jadx_gui.png "comparaison jadx-gui vs simple éditeur de texte")*Comparaison d'un simple éditeur de texte (à gauche) avec jadx-gui après renommage des items (à droite)*

## Assemblage de la requête HTTP

Quatre fichiers importants sont identifiés grâce à la recherche de chaines et à jadx-gui :

* `com/xiaomi/mitv/phone/remotecontroller/ir/activity/MatchIRActivityV52.java` : Déclenche la requête et récupère les données JSON pour les analyser (cf. Partie 1).
* `./c/k/i/b/b/y0/g.java` : Controleur ; construit l'url en utilisant le préfixe, injecte les paramètres variables.
* `./c/k/j/a/i/c.java` : Construit la liste des paramètres fixes, calcule le paramètre`opaque`, exécute la requête.
* `./c/k/j/a/i/e.java`
  : Objet Query initialisé progressivement avec tous les constituants de
  la requête (méthode (POST/GET), url, chemin, headers, paramètres).

---

L'objet `./c/k/j/a/i/e.java` est aisément compréhensible connu grâce aux messages des exceptions réparties dans les méthodes :

```
throw new IllegalArgumentException("queries == null");
throw new IllegalArgumentException("headers == null");
throw new IllegalArgumentException("method == null");
throw new IllegalArgumentException("queries == null");
throw new IllegalArgumentException("path == null");
throw new IllegalArgumentException("url == null");
throw new IllegalArgumentException("method == null");
```
À partir de cela il est facile d'identifier les
accesseurs/mutateurs (getters/setters) et attributs de l'objet afin de
faire sa rétro-ingénierie complète ; la structure de données est
similaire à n'importe quelle librairie de n'importe quel langage qui
manipule des requêtes.

--

Dans le fichier `./c/k/i/b/b/y0/g.java`,
nous voyons apparaitre, grâce au renommage des méthodes, une fonction
construisant les paramètres d'une de nos requêtes d'intérêt :

```
public QueryObj mo21081a() {
    ArrayList arrayList = new ArrayList();
    arrayList.add(new KeyValuePair(devid_str, String.valueOf(this.devid)));     // devid
    arrayList.add(new KeyValuePair(miyk_str, "1"));                             // miyk
    arrayList.add(new KeyValuePair(brandid_str, String.valueOf(this.brandid))); // brandid
    [...]
    arrayList.add(new KeyValuePair("power", this.power ? "0" : "1"));           // power
    [...]
    return new QueryObj.C6146a()
        .set_path(C5386g.controller_match_tree_str)
        .set_url(get_server_plus_url(C5386g.controller_match_tree_str))         // https://sg-urc.io.mi.com + /controller/match/tree/1
        .set_queries(arrayList)
        .set_method("GET")
        .get_copy_instance();
}
```
L'étape finale consiste à ajouter le paramètre `opaque` à l'url ; ceci est fait dans `./c/k/j/a/i/c.java` (contenant déjà `str_add_opaque_str2()`):

```
// ./c/k/j/a/i/c.java
public static Response execute_query(QueryObj eVar) {
    String str;
    Request.Builder builder = new Request.Builder();

    Headers a = C6163c.m22947a(eVar.get_headers());
    builder.headers(a);

    List<KeyValuePair> a2 = build_first_url_params();
    C5864a a3 = init_hashes(false);
    String a4 = add_query_params_to_url_and_GET_opaque(eVar, C6164d.concat_url_with_params(eVar.get_path(), a2), a3.token, a3.secret_key);
    String a5 = C6164d.concat_url_with_params(eVar.get_url(), a2);
    [...]
    str = C6164d.concat_url_with_params(a5, eVar.get_queries());

    builder.url(str_add_opaque_str2(str, a4));
    [...]
    return m22889b().newCall(builder.build()).execute();
}
```
* ligne 10 : `init_hashes`
  construit un objet avec deux attributs qui une fois identifiés sont un
  token interne (qui est en fait le sel mentionné dans l'introduction) et
  une clé secrète.

  ```
  return C5864a.m21432a("0f9dfa001cba164d7bda671649c50abf", "581582928c881b42eedce96331bff5d3");
  ```
  **Il faut noter que ces 2 chaines sont notées en dur dans le code du projet** .
* ligne 11 : La fonction `add_query_params_to_url_and_GET_opaque()` appelle `compute_opaque()` :

  ```
  /* renamed from: a */
  public static String add_query_params_to_url_and_GET_opaque(QueryObj eVar, String str, String str2, String str3) {
      String str4;
      StringBuilder sb = new StringBuilder();
      if (eVar.get_method().equals("GET")) {
          sb.append(C6164d.concat_url_with_params(str, eVar.get_queries()));
          str4 = sb.toString();

      } [...]
      return compute_opaque(str4, str2, str3);
  }
  ```

`compute_opaque()` obtient donc les arguments suivants :

* str4: Le préfixe + paramètres fixes + paramètres variables
* str2: Le token secret/sel
* str3: La clé secrète

Sa ligne la plus importante insère le token ; **celui-ci ne sert qu'au calcul de la signature. Il n'apparait pas dans l'url finale** .

```
return SignatureUtil.getSignature((str + "&token=" + str2).getBytes(), str3.getBytes());
```
Voici enfin le hachage de nos paramètres :

```
// com.xiaomi.mitv.socialtv.common.utils.SignatureUtil
public static String getSignature(byte[] bArr, byte[] bArr2) {
    SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "HmacSHA1");
    Mac instance = Mac.getInstance("HmacSHA1");
    instance.init(secretKeySpec);
    return IOUtil.byteArray2HexString(instance.doFinal(bArr));
}
```
## Patchs

Essayons de faire en sorte que l'application affiche elle-même dans les logs, les informations que nous recherchons.

* Affichage du contenu de arrayList juste avant le retour de `mo21081a()` ; observez l'usage d'un objet `StringBuilder` pour convertir la variable en String et l'envoyer dans la fonction de debug `Log.e()`:

  ```
  # c/k/i/b/b/y0/g$o.smali
  # g$o: objet companion "o" intégré dans la classe g
  # Signature Java:
  # /* renamed from: c.k.i.b.b.y0.g$o */
  # public static class AsyncTaskC5408o extends AbstractAsyncTaskC5396e {

  # virtual methods
  .method public a()Lc/k/j/a/i/e;
      .locals 6
      # PATCH increment 5 to 6 for v5 var
      [...]
      :cond_3

      # PATCH HERE
      # v0: ArrayList
      # v1, v2, v3 are usable
      # Equivalent to: Log.e("TAG query params", "ArrayList: " + arrayList);
      sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
      new-instance v2, Ljava/lang/StringBuilder;
      invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
      const-string v3, "ArrayList: "
      invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      move-result-object v2
      invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
      move-result-object v5
      invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
      move-result-object v5

      const-string v3, "TAG query params"
      invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
      # END PATCH

      # Code continuation...
      # Equivalent to: QueryObj.C6146a().set_path(C5386g.controller_match_tree_str)...
      new-instance v1, Lc/k/j/a/i/e$a;
      invoke-direct {v1}, Lc/k/j/a/i/e$a;-><init>()V
      const-string v2, "/controller/match/tree/1"
      invoke-virtual {v1, v2}, Lc/k/j/a/i/e$a;->c(Ljava/lang/String;)Lc/k/j/a/i/e$a;
      move-result-object v1
      [...]
  ```
  Résultat :

  ```
  E TAG query params: ArrayList: [devid:10, miyk:1, brandid:1, power:1]
  ```

---

* Affichage des paramètres de compute_opaque() juste avant son appel et de son résultat :

  ```
  .method public static a(Lc/k/j/a/i/e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
      [...]
      # PATCH
      # v1: libre
      # p0: url
      # p2: token
      # p3: private key
      # juste avant concaténation de l'un avec l'autre
      const-string v1, "TAG url"
      invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

      const-string v1, "TAG token"
      invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

      const-string v1, "TAG private key"
      invoke-static {v1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
      # END PATCH

      # Call compute_opaque()
      invoke-static {p0, p2, p3}, Lc/k/j/a/i/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
      move-result-object p0

      # PATCH
      const-string v1, "TAG opaque"
      invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
      # END PATCH
      return-object p0
  .end method
  ```
  Résultat :

  ```
  E TAG url: /controller/device/1?version=6034&country=FR&ts=1615406505554&nonce=1126639370
  E TAG token: 0f9dfa001cba164d7bda671649c50abf
  E TAG private key: 581582928c881b42eedce96331bff5d3
  E TAG opaque: f422f7bdc77403414fdd674758af0b39435bb46e
  ```

## Implémentation en Python

```
from Crypto.Hash import HMAC, SHA1

def get_opaque_http_param(url, token, secret_key):
    """Get the opaque parameter based on the url, an internal token and a
    secret key for the hash algorithm

    :return: "opaque" parameter to be inserted at the end of the url path
    :rtype: <str>
    """
    plain_text = url + "&token=" + token
    # Get signature of this concatenation
    return get_signature(plain_text, secret_key)


def get_signature(plain_text, secret_key):
    """Get signature/hash of the given plain_text with the secret_key

    Use HMAC (Hash-based Message Authentication Code) with SHA1 hash algorithm.

    :param plain_text: Clear text to be signed
    :param secret_key: Secret key
    :type plain_text: <str>
    :type secret_key: <str>
    :return: Hex digest of the signature
    :rtype: <str>
    """
    cipher = HMAC.new(secret_key.encode(), digestmod=SHA1)
    return cipher.update(plain_text.encode()).hexdigest()
```
## Conclusion

Nous sommes
dorénavant capables de forger des requêtes valides auprès de l'API REST
de Mi Remote, et pourquoi pas, de réaliser une copie quasi-complète du
serveur en quelques requêtes.

Le code nécessaire pour ceci est disponible sur [GitHub - Mi ](https://github.com/ysard/mi_remote_database)
