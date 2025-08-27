org 0x7C00
cli
xor ax,ax
mov ss,ax
mov sp,0x7C00
sti
mov [BootDrive],dl
mov word [DAP+0], 0x10
mov word [DAP+2], 4
mov word [DAP+4], 0x8000
mov word [DAP+6], 0x0000
mov dword [DAP+8], 1
mov dword [DAP+12], 0
mov dl,[BootDrive]
mov ah,0x42
mov si,DAP
int 0x13
jc error
jmp success

success:

jmp 0x0000:0x8000

error:
mov si,error_msg
loop:

lodsb
or al,al
jz exit
mov ah,0x0e
int 0x10
jmp loop


exit:

hlt
jmp exit

error_msg db 'Error loading kernel', 0

BootDrive    db 0
DAP          times 16 db 0


times 510-($-$$) db 0
dw 0xAA55
