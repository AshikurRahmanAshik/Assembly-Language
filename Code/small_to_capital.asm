.model small
.stack

.code

;Input character

mov ah,07h;
int 21h;

;Capitalize
sub al,32

;print character
mov ah,02h;
mov dl,al;
int 21h;

;Give control back to OS
mov ah,4ch
int 21h

end
