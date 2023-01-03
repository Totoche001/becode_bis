; Orgue ASCII II (Version 2: countourne le DOS)

timer   equ     42h
speaker equ     61h
sponmsk equ     4fh
spofmsk equ     4ch
settim  equ     0b6h
termkey equ     1
keyport equ     60h

doscall macro   x
        mov     ah,x
        int     21h
        endm

pout    macro   x,y
        mov     al,y
        out     x,al
        endm

code    segment
        org     100h
        assume  cs:code

start:  jmp     begin           ; contourne variable de stockage

;---- Variable de Stockage ----

msg     db      'Attention ca va barder - <ESC> pour Quitter!$'

oldvect dd      0               ; definir double mot (4 octets) de
                                ; stockage...
; Start of Program

begin:  mov     dx,offset msg
        doscall 9
        sub     ax,ax           ; ‚tablir addressage zone
        mov     ds,ax           ; vecteur d'interruption
        mov     si,9*4          ; idem … mov  si,36
        mov     cx,4            ; 2.0 fait un CALL ici
        mov     di,offset oldvect
        cld                     ; et par prudence
        rep     movsb
        push    cs              ; faire DS = CS
        pop     ds
        mov     dx,offset kbdintarget
        mov     al,9             ; faire que l'interruption 9 pointe
        doscall 25h              ; sur l'‚tiquette kbdintarget
        mov     dx,offset lastin + 5
        int     27h             ; fin, rendre r‚sident

; Ceci sera ex‚cut‚ … chaque frappe d'une touche quelconque!

kbdintarget:
        sti                     ; interruption du rythmeur
        push    ax              ; sauvegarde d'AX
        in      al,keyport      ; lire frappe clavier
        cmp     al,80h          ; combination BREAK ?
        jnb     exit            ; si oui, saut...
        cmp     al,termkey      ; touche fin du programme ?
        je      lastime         ; si oui, saut...
        push    ax              ; sauvegarde valeur touche frapp‚e
        pout    timer+1,settim
        sub     al,al           ; z‚ro en AL
        out     timer,al        ; envoyer diviseur, LSB d'abord
        pop     ax              ; MSB du diviseur = valeur frappe
        out     timer,al        ; rythmeur joue la musique
        pout    speaker,sponmsk

        mov     ax,2000h        ; boucle d'attente
repeat: dec     ax
        jne     repeat

        pout    speaker,spofmsk
        jmp     exit

lastime:                        ; reprendre vecteur clavier
        push    ds              ; sauvegarde dans la pile
        push    es              ; de tous les registres
        push    si              ; utilis‚s par cette routine
        push    di
        push    cx
        push    cs
        pop     ds              ; faire DS = CS
        sub     ax,ax           ; ‚tablir adressage zone
        mov     es,ax           ; vecteur d'interruption
        mov     di,9*4          ; Cette fois, d‚placer stockage du prog
        mov     si,offset oldvect ; dans zone du vecteur d'interruption.
        mov     cx,4
        cld                     ; ne rien pr‚sum‚ au sujet du pointeur D
        rep     movsb           ; retour ancien vecteur d'int. de clavier
        pop     cx
        pop     di              ; restaurer registres
        pop     si              ; en ordre contraire du push...
        pop     es              ; restaurer les registres
        pop     ds              ; en ordre contraire du push...

exit:   pop     ax
lastin: jmp     [oldvect]       ; saut … ancienne rout. int. de clavier

code    ends
        end     start
