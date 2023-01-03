En ligne de commande
Pour la session active

Dans le cas où vous vous retrouveriez avec un agencement actif de type américain (us) QWERTY au lieu de celui correspondant au marquage de votre clavier (souvent de type français (fr) AZERTY ) :
S'il s'agit de l' environnement de console, tel que le recovery mode, saisir la commande suivante:

`sudo loadkeys fr `

Se traduira par la frappe de :
sudo loqdkeys fr , si votre clavier est marqué AZERTY,
uvil rlaisp^u eo , si votre clavier est marqué BÉPO,
une autre combinaison à adapter à la disposition des touches de votre clavier. Pour vous y aider, appuyez-vous sur l'image de la page QWERTY.

ATTENTION, pour les dernières versions y compris la LTS, il y a un gros bug qui déprogramme constamment le clavier azerty en qwerty.

S'il s'agit de l' environnement graphique, saisir dans un terminal la commande suivante:

`setxkbmap fr`

Se traduira par la frappe de :
setxkb,qp fr , si votre clavier est marqué AZERTY,
upèyskùqj eo, si votre clavier est marqué BÉPO,
une autre combinaison à adapter à la disposition des touches de votre clavier. Pour vous y aider, appuyez-vous sur l'image de la page QWERTY.
