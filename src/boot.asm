bits 16

org 0x7C00

start:
    ; Intialise data segment
    xor ax, ax
    mov ds, ax

    ; Put text adress in SI
    mov si, message

print_loop:
    ; Character reader
    mov al, [si]

    cmp al, 0
    je done

    mov ah, 0x0E
    int 0x10

    ; Next character
    inc si
    jmp print_loop

done:
    cli
hang:
    hlt
    jmp hang

message:
    db "Edenn loaded successfully!", 0

; Fill until 512o (read README.md)
times 510-($-$$) db 0
dw 0xAA55