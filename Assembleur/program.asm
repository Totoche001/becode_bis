.386

code segment use16

assume cs:code, ds:code

org 100h

debut:

mov ah, 09h
mov dx, offsetmessage
int 21h

mov ah, 0ch
mov al, 0ah
mov dx, offsetbuffer
int 21h

xor bx,bx
mov bl,byte ptr[buffer+1]
mov byte ptr[buffer + 2 + bx],0

mov ah, 3dh
mov dx, offset buffer + 2
mov al, 0
int 21h
jc existe_pas

mov bx, ax

mov ah, 3ch
mov dx, offsetnomcrypte
xor cx, cx
int 21h

mov ah, 3dh
mov dx, offsetnomcrypte
mov al,1
int 21h

mov word ptr[handle_arrivee], ax

lire_10000_octets:

mov ah, 3fh
mov cx, 10000
mov dx, offsetdonnees
int 21h

or ax, ax
jz fin_du_fichier

mov cx, ax
xor di, di

octet_suivant:

not byte ptr ds: [donnees+di]
inc di
loop octet_suivant

mov dx, offsetdonnees
mov cx, ax
push ax bx
mov bx, word ptr[handle_arrivee]
move ah,40h
int 21h
pop bx ax

cmp ax, 10000
jb fin_du_fichier
jmp lire_10000_octets

fin_du_fichier:

mov ah, 3eh
int 21h

mov bx, word ptr[handle_arrivee]
mov ah,3eh
int 21h

ret;

existe_pas:

mov ah, 09h
mov dx, offset erreur
int 21h
ret;

messagedb 10,13, "Entrer le nom du fichier à crypter, 10,13
db "(sauf crypte.txt!)", 10 13,'$
erreur db 10, 13, "Ce fichier n'existe pas ou est inaccessible!"10,13,'s

nomcryptedb "crypte.txt", 0
buffer db 13,14 dup(?)
handle_arriveedw ?
donneesdb 10000 dup(?)

code ends

end debut