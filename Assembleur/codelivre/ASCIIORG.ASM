; Orgue ASCII

        code    segment
        org     100h
        assume  cs:code

timer   equ     42h
speaker equ     61h

start:  call    getkey          ; retour avec frappe en AL
        cmp     al,1bh          ; escape?
        jne     skip
        int     20h
skip:   call    beep            ; sinon, beep selon valeur
        jmp     start           ; dans AL, et retour

getkey: mov     ah,7            ; faire DOS fonction 7
        int     21h             ; retour avec frappe en AL
        ret

beep:   mov     bl,al           ; sauvegarde de la frappe
        mov     al,0b6h         ; preparer rythmeur pour
        out     timer+1,al      ; acceptation nouv. division
        mov     al,0            ; envoyer 0 comme LSB
        out     timer,al        ; du nouveau diviseur
        mov     al,bl           ; et valeur frappe
        out     timer,al        ; comme MSB
        mov     al,4fh          ; d‚marrer son en reliant
        out     speaker,al      ; le haut-parleur au rythmeur
        mov     cx,0ffffh       ; pause
        rep     lodsw           ; pendant que la note est jou‚e
        mov     al,4dh          ; arreter en coupant la
        out     speaker,al      ; connection haut-parleur/rythmeur
        mov     ah,2            ; utiliser la fonction DOS sortie
        mov     dl,0eh          ; caractŠre (OUT) pour envoyer
        int     21h             ; symbole de la note … l'‚cran
        ret

code    ends
        end     start
