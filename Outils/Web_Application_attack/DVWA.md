81.241.151.110:8082/DVWA

https://github.com/Totoche001/DVWA_on_Raspberry-Pi

https://braincoke.fr/write-up/dvwa/dvwa-java-script/

https://www.cerberussentinel.com/blog-posts/brute-forcing-login-burp/
https://himalfrom2061.medium.com/brute-force-in-dvwa-low-security-9e171b89d91e
https://www.comparitech.com/net-admin/burp-suite-cheat-sheet/
https://programmer.ink/think/dvwa-sql-injection-blind-full-level.html
https://www.hackingarticles.in/beginners-guide-burpsuite-payloads-part-2/
https://ensurtec.com/dvwa-part-2-exploiting-cross-site-scripting-xss-vulnerabilities/
https://systemweakness.com/hackerman-sergio-csrf-tutorial-dvwa-high-security-level-4cba47f2d695
https://www.hackingarticles.in/understanding-the-csrf-vulnerability-a-beginners-guide/
https://codebase.city/samples/csrf-vulnerability-recurrence-in-dvwa-shooting-range.html

## CSRF
**Low:**
Ce guide explique comment contourner le faible niveau de sécurité pour CSRF (Cross Site Request Forgery) dans la DVWA (Damn Vulnerable Web Application).

Cross-Site Request Forgery (CSRF) est une attaque qui force un utilisateur final à exécuter des actions non désirées sur une application Web dans laquelle il est actuellement authentifié. Cela peut se traduire par un changement d'adresse e-mail ou un vol d'argent. Dans ce scénario, nous allons changer le mot de passe de l'utilisateur.

Allons droit au but. La première chose que j'ai faite a été de vérifier le code source. Vous pouvez simplement faire cela dans DVWA en cliquant sur view source en bas à droite.

Ok c'est assez simple, le script prend l'entrée de l'utilisateur et vérifie si les deux mots de passe correspondent, si c'est le cas le mot de passe est mis à jour, sinon le mot de passe n'est pas mis à jour. Ce que nous pouvons voir ici est qu'il n'y a pas de protection contre CSRF, comme un jeton Anti-CSRF.

Ouvrons Burp Suite et voyons ce qui se passe lorsque nous essayons d'envoyer une requête légitime depuis le DVWA.

Ce que j'ai fait, c'est changer le mot de passe depuis l'intérieur du DVWA et ensuite intercepter la requête en utilisant Burp. De cette façon, nous pouvons avoir un regard approfondi sur la requête. Ce que nous pouvons voir, c'est qu'il s'agit d'une requête GET et vous pouvez voir que la valeur du nouveau mot de passe a été changée en 1234 (super sécurisé). Vous pouvez également voir l'ID de session de l'utilisateur dans les cookies.

L'étape suivante consiste à afficher le code source html de la page. Il y a un formulaire qui fait une requête GET. Il ressemble à ceci.

```
<form action=”#” method=”GET”>
 New password:<br />
 <input type=”password” AUTOCOMPLETE=”off” name=”password_new”><br />
 Confirm new password:<br />
 <input type=”password” AUTOCOMPLETE=”off” name=”password_conf”><br />
 <br />
 <input type=”submit” value=”Change” name=”Change”></form>
 ```

C'est le formulaire que vous voyez lorsque vous changez le mot de passe ; il prend l'entrée de l'utilisateur pour un nouveau mot de passe et un mot de passe de confirmation. J'ai pris ce bout de code et je l'ai placé dans un fichier html. J'ai fait quelques changements comme vous pouvez le voir ci-dessous.

```<form action=”http://localhost/DVWA-master/vulnerabilities/csrf/?" method=”GET”>
 <h1>Click Me</h1>
 <input type=”hidden” AUTOCOMPLETE=”off” name=”password_new” value=”hacked”>
 <input type=”hidden” AUTOCOMPLETE=”off” name=”password_conf” value=”hacked”>
 <input type=”submit” value=”Change” name=”Change”></form>
 ```

Comme vous pouvez le voir, je fais une demande GET à http://localhost/DVWA-master/vulnerabilities/csrf/. J'ai créé un en-tête qui dit "Cliquez-moi" et je cache les formulaires de saisie du mot de passe, mais j'ai déjà prédéfini les valeurs avec le nouveau mot de passe, "piraté". Tout ce que l'utilisateur voit sur la page est l'en-tête et le bouton. Voyons voir.

Une fois que l'utilisateur aura cliqué sur le bouton "Changer", une demande sera envoyée pour changer le mot de passe de l'utilisateur. Voyons cela dans Burp.

La demande a été capturée dans Burp et nous pouvons voir qu'une demande GET a été faite pour changer le mot de passe. Regardez l'ID de la session dans le cookie. Cela vous semble familier ? C'est le même identifiant de session que lorsque nous avons fait la demande légitime. La demande provient du même navigateur que celui sur lequel l'utilisateur est déjà authentifié auprès de DVWA, la demande est donc autorisée.

Ce scénario n'est pas très sophistiqué, il montre comment l'attaque pourrait être menée. Un scénario réel peut impliquer de l'ingénierie sociale : un e-mail de phishing est envoyé et l'utilisateur est redirigé vers une page web qui lui semble légitime. À son insu, quelqu'un pourrait être en train de voler sa session. Une attaque CSRF réussie peut forcer l'utilisateur à effectuer des demandes de changement d'état, comme un transfert de fonds ou un changement de mot de passe. Une façon de se protéger contre ce type d'attaque est d'utiliser un jeton Anti-CSRF. Il s'agit d'une énorme chaîne aléatoire, impossible ou peu pratique à deviner et à forcer. Chaque fois que l'utilisateur fait une demande, ce jeton doit être vérifié.

**medium:**
Au niveau moyen, l'attaque précédente ne fonctionnera pas. Lorsque nous analysons les différences entre la requête envoyée par une demande légitime et celle envoyée par notre attaque, nous pouvons voir que la demande légitime contient l'en-tête referer (pas dans notre attaque).

Pour que notre attaque fonctionne, nous devons trouver un moyen d'ajouter cette option Referer. Pour ce faire, nous créons un site web http://mysite.com où nous plaçons notre page HTML malveillante préalablement créée. Nous soupçonnons le serveur de vérifier que le referer provient du même site avec une regex très simple ou une fonction contains telle que :

`if GET["REFERER"] contains GET["SERVER_NAME"] then {`

Pour tester notre théorie, nous hébergeons notre code sur http://mysite.com/localhost/index.html car le DVWA fonctionne localement et le nom d'hôte est localhost. Lorsque l'utilisateur clique sur la page du lien, le mot de passe est automatiquement modifié ! Cela a fonctionné !
-------------------------------
Mettre un nouveau mot de passe et enregistrer la barre d'adresse, se mettre en sécurity low et aller dans xss(Stored) ajouter
`<img src="/DVWA/vulnerabilities/csrf/?password_new=123&password_conf=123&Change=Change">` (les mots de passe doivent être différents de ceux envoyer précédemment)
et envoyer
se remettre en medium aller dans CSRF, faire le test credential et mettre admin/123 et normalement ca marche


**High:**



## DVWA XSS DOM
Low:
Appuyez sur le bouton "Select" et regardez l'URL. Elle a pris le paramètre "default=English". En changeant la boîte de sélection, on définit le paramètre par défaut. Que se passe-t-il si nous définissons manuellement le paramètre par défaut sur quelque chose d'autre comme "test" ?

Maintenant, insérons notre propre Javascript dans le paramètre, quelque chose de simple, comme une alerte "<script>alert("Houston, nous avons un problème !!")</script>":c

Nous avons déterminé que le site est vulnérable au XSS. Récupérons le cookie avec ce script "<script>alert(document.cookie)</script>" :

Medium:
Visuellement, il n'y a pas de différence entre la sécurité faible et la sécurité moyenne. En changeant le paramètre de l'URL en test, le texte s'affiche dans la boîte de sélection, comme avant :

Essayons un script d'alerte... et rien ne se passe. Il semble qu'il y ait une sorte de filtrage en cours. Nous ne sommes pas encore à court d'options. Ouvrez les outils du développeur et jetez un coup d'oeil au html :

Nous pouvons essayer plusieurs valeurs pour notre paramètre par défaut et voir comment la page réagit.
Nous cherchons à casser la logique de la page et à insérer une balise artisanale.
Après quelques essais et erreurs, j'ai réussi à insérer la valeur suivante " <</select><img src='#' onclick=alert 'Gotcha!!!'> " :
Maintenant, changez-le pour obtenir le cookie :<</select><img src='#' onclick=alert (document.cookie)>

High:
Si ce n'est pour la balise en bas de la page, je n'aurais aucune idée du niveau de sécurité. Ok, essayons de pirater le niveau de sécurité élevé. Je commence par "test"... Rien. On dirait que chaque tentative est filtrée par le serveur.

Il est temps d'essayer quelque chose de différent en utilisant un nouveau paramètre/valeur (plus d'informations sur les paramètres avec les méthodes GET et POST [ici](https://www.w3schools.com/tags/ref_httpmethods.asp)) "default=English&test" :

L'URL personnalisée semble contourner le filtre. Obtenons le cookie avec "default=English&<script>alert(document.cookie)</script>" :



