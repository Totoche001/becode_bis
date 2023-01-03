; DUMP.ASM: Utilitaire Dump

; ------Macros--------------------------

doscall macro   x
        mov     ah,x
        int     21h
        endm

outchar macro   x
        mov     dl,x
        doscall 2
        endm

code    segment
        org     100h
        assume  cs:code,ds:code
start:  jmp     begin

; ------Variables----------------------

fcount  dw      0
eofflag db      0
fnfmsg  db      'Fichier Absent$'
hexchar db      '0123456789ABCDEF'

; ----- Boucle Principale -------------

begin:  mov     dx,5ch          ; fcb prepar‚ par DOS
        doscall 0fh             ; ouvrir fichier
        cmp     al,0ffh         ; retour de ff
        jne     d1              ; = fichier introuvable
        mov     dx,offset fnfmsg
        doscall 9               ; envoyer message et
        jmp     exit            ; terminer

; Si vous ˆtes arriv‚ ici, le fichier est inexistant: commencer
; une lecture des donn‚es dans DTA … l'offset 80h

d1:     mov     dx,5ch
        doscall 14h             ; lire enregistr (128 octets par defaut)
        cmp     al,1            ; retour 1 signifie enregistrement
        je      exit            ; vide -- donc fin
        cmp     al,3            ; retour 3 signifie enregistrement
        jne     d2              ; partiellement vide --fin aprŠs
        inc     eofflag         ; sorti de l'enregistrement
d2:     call    outrec          ; sortir des 128 octets du DTA
        cmp     eofflag,1       ; dernier 128 octets ?
        jne     d1              ; sinon saut au sommet
exit:   int     20h

outrec  proc    near
        mov     bp,80h          ; bp pointe au bas du DTA
or1:    call    outcnt
        call    outhex
        call    outasci
        outchar 13
        outchar 10
        add     bp,16           ; ajuster pointeur de base
        add     fcount,16       ; et comptage des fichiers
        cmp     bp,100h         ; fini aprŠs 128 octets (8 lignes)
        jne     or1
        outchar 13
        outchar 10
        ret
outrec  endp

outcnt  proc    near
        mov     ax,fcount       ; d'abord, sortie caract fichier
        mov     al,ah           ; coumpte comme 2 octets, MSB premiers
        call    outbyte         ; octets de sortie envoient caractŠres
        mov     ax,fcount       ; ASCII, representant AL
        call    outbyte
        outchar ':'             ; separer du contenu dump
        outchar ' '
        ret
outcnt  endp

outhex  proc    near
        mov     si,0            ; commencer par premier octet dans ligne
oh1:    mov     al,[bp+si]      ; lire cette octet
        call    outbyte         ; envoyer … l'‚cran
        outchar ' '
        inc     si
        cmp     si,8            ; ajouter un espace entre les
        jne     oh2             ; octets 7 et 8 pour la clart‚
        outchar ' '
oh2:    cmp     si,16           ; lorsque SI=16, c'est fini
        jne     oh1
        outchar ' '             ; separer dump des ‚quivalents ASCII
        ret
outhex  endp

outasci proc    near
        mov     si,0            ; faire une boucle avec SI (0-15)
oa1:    mov     dl,[bp+si]      ; l'octet que nous venons de lire
        and     dl,7fh          ; d‚sactiver octet de poids fort
        cmp     dl,20h          ; caractŠre imprimable ?
        jae     oa2             ; si oui, saut … la prochaine ‚tape
        mov     dl,'.'
oa2:    doscall 2               ; impression du caractŠre dans DL
        inc     si              ; fin aprŠs 16 passages
        cmp     si,16
        jne     oa1
        ret
outasci endp

outbyte proc    near
        mov     bx,offset hexchar
        push    ax              ; sauvegarde quartet de poids faible
        and     al,0f0h         ; avant de l'envoyer dans l'‚ther
        mov     cl,4            ; rotation de quartet de poids faible AL
        rol     al,cl           ; dans 4 bits inf‚rieurs
        xlat                    ; traduire en ‚quivalent h‚xa
        mov     dl,al           ; et envoyer en sortie
        doscall 2
        pop     ax              ; idem pour quartet de poids faible
        and     al,0fh
        xlat
        mov     dl,al
        doscall 2
        ret
outbyte endp

code    ends
        end     start
