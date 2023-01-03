; Orgue ASCII III

timer   equ     42h
speaker equ     61h
sponmsk equ     4fh
spofmsk equ     4ch
settim  equ     0b6h
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
        assume  cs:code,ds:code

start:  jmp     begin           ; contourner variable de stockage

;----- Donn‚es musique -----

song    db      17,4,16,4,15,4,16,4,17,4,17,4,17,8
        db      16,4,16,4,16,8,17,4,19,4,19,8
        db      17,4,16,4,15,4,16,4,17,4,17,4,17,4
        db      17,4,16,4,16,4,17,4,16,4,15,4

;----- Donn‚es diviseur rythmeur (Pitch) ------

;               C-1  D-2  E-3  F-4  G-5  A-6  B-7  C-8  D-9  E-10 F-11
divsors dw 0000,9121,8126,7239,6833,6088,5423,4832,4560,4063,3620,3417
;               G-12 A-13 B-14 C-15 D-16 E-17 F-18 G-19 A-20 B-21 C-22
        dw      3044,2712,2416,2280,2031,1810,1708,1522,1356,1208,1140
;               D-23 E-24 F-25 G-26 A-27 B-28
        dw      1016, 905, 854, 761, 678, 604

;----- Variables ------

notecnt dw      0                               ; notes jou‚s jusqu'ici
beatcnt dw      0                               ; battements
tbtn    dw      0                               ; total battements,

;----- Initialisation du Programme ------

begin:  mov     al, [song+1]                    ; dur‚e de la premiŠre note
        cbw
        mov     tbtn,ax
        call    playnot                         ; commencer premiŠre note
        mov     dx,offset target1c
        mov     al,1ch                          ; accroche interr rythmeur
        doscall 25h
        mov     dx,offset lbyte+1
        int     27h                             ; FIN, rendre r‚sident

;----- Cible pour l'interruption 1Ch ------

target1c:
        push    cs                      ; rendre temps d'ex‚cution synchro
        pop     ds                      ; avec temps pr‚sum‚ en assemblage
        inc     beatcnt                 ;
        mov     ax,tbtn                 ;
        cmp     ax,beatcnt              ; fin de la note ?
        je      in2                     ; oui, saut note suivante
        iret                            ; non...
in2:    cmp     notecnt,(offset divsors - offset song) / 2
        jne     in3                  ; si pas ‚gal, pas fini
        mov     byte ptr target1c,0cfh
        iret

; Jouer note suivante

in3:    push    si                      ;sauveg unique de ds,dx,ax
        inc     notecnt                 ;avancer … note suivante
        mov     beatcnt,0               ;relancer compteur battements
        mov     si,notecnt
        shl     si,1                    ;2 ‚l‚ments pour chaque note
        mov     al,[si+offset song+1]   ;dur‚e de cette note
        cbw
        mov     tbtn,ax
        call    playnot
        pop     si
        iret

playnot: mov     si,notecnt
        shl     si,1
        mov     al,[si+offset song]     ;AL = maintenant un num‚ro de note
        or      al,al                   ;forcer les pointeurs
        jnz     pn1                     ;note 0 est une pause (fermer haut-parl)
        pout    speaker,spofmsk
        ret
pn1:    cbw                             ; AH dans une octet (1 enregistrement)
        mov     si,ax
        shl     si,1                    ;table de diviseur
        pout    timer+1,settim
        mov     ax,[si+offset divsors]
        out     timer,al
        mov     al,ah
        out     timer,al
        pout    speaker,sponmsk
lbyte:  ret

code    ends
        end     start
