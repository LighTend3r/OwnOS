global loader                        ; the entry symbol for ELF

MAGIC_NUMBER equ 0x1BADB002          ; define the magic number constant
FLAGS        equ 0x0                 ; multiboot flags
CHECKSUM     equ -MAGIC_NUMBER       ; calculate the checksum
                                     ; (magic number + checksum + flags should equal 0)
KERNEL_STACK_SIZE equ 4096      ; size of stack in bytes

section .bss
align 4                         ; align at 4 bytes
kernel_stack:                   ; label points to beginning of memory
    resb KERNEL_STACK_SIZE      ; reserve stack for the kernel

section .text:                       ; start of the text (code) section
align 4                              ; the code must be 4 byte aligned
    dd MAGIC_NUMBER                  ; write the magic number to the machine code,
    dd FLAGS                         ; the flags,
    dd CHECKSUM                      ; and the checksum
    myString db 'Hello, World!', 0 ;

loader:                              ; the loader label (defined as entry point in linker script)
    mov esp, kernel_stack + KERNEL_STACK_SIZE       ; point esp to the start of the

    ; The assembly code
    ;extern sum_of_three   ; the function sum_of_three is defined elsewhere
    ;push dword 3            ; arg3
    ;push dword 2            ; arg2
    ;push dword 1            ; arg1
    ;call sum_of_three       ; call the function, the result will be in eax
    ;mov eax, 0xCAFEBABE              ; place the number 0xCAFEBABE in the register eax
    ;mov word [0x000B8000], 0x4128    ; Display the letter "A" with green foreground and darkgrey background


    extern write
    push dword 13
    push dword myString
    call write
    add esp, 8

    ;extern fb_write_cell
    ;
    ;push dword 2;
    ;push dword 8;
    ;push dword 0x41;
    ;push dword 0;
    ;call fb_write_cell
    ;
    ;extern fb_move_cursor
    ;
    ;push 1;
    ;call fb_move_cursor




.loop:
    jmp .loop                        ; loop forever
