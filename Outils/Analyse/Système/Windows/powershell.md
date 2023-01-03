https://cod-box.net/programmation-pour-les-debutants/apprendre-powershell/article-apprendre-powershel-pour-les-debutante/powershell-navigation-dans-les-repertoires-et-le-fichiers/

1. Get-Alias
2. Syntaxe: Get-Location [l’emplacement ]
Alias :gl, pwd
3. Syntaxe: Get-ChildItem [Lister le contenu d’un répertoire]
Alias :gci, ls, dir
4. Get-ChildItem -Force (Fichier caché)
Alias: dir -Force

dir c:\
dir -Force C:\

5. Voir le contenu: `Get-ChildItem c:\"Program Files"`
6. Syntaxe:cd [répertoire à accéder]
Autres syntaxes:chdir/sl
Voir aussi:dir, mkdir

dossier: mkdir "mondossier"
fichier: `Ni "mon_fichier.txt"` ou `Ni "mon_fichier.txt" -Value 'Hello Word'`