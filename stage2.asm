org 0x8000
xor ax,ax
mov ds,ax
mov si,msg
loop:
lodsb
or al,al
jz exit
mov ah,0x0e
int 0x10
jmp loop
exit:
cli
hlt
msg db "Hello World", 0
times 510 - ($-$$) db 0
dw 0xaa55
