
; B = 0x09 / C = 0x12
; Simple program to compare between register(s) B , C values 
; then store the greater number into memory location `0x0003`

jmp init


; init stage
init:
  lxi h , 0x0003 ; insert a '0x0003' value into hl registers (hl pointer)
  mvi b , 0x09 ; insert a '0x09'value into b register
  mvi c , 0x12 ; insert a '0x12'value into c register
  mov a , b ; insert b register value into a register for compare usage 
            ; so a register value now is a '0x09' 

; compare stage
compare:
  cmp c ; compare a register (b register value) with c register value | a - b
        ; a register value is '0x09' and c register value is '0x12'
        ; So a - b = negative

; check stage 
check:
  jz equal ; if b = c then jump to `equal` label and execute it 
  jp great ; if b > c then jump to `geart` label and execute it  
  jm less ; if b < c then jump to `less` label and execute it 
  jmp error ; if there is an error execute `error` label

; if they are with same value then store one of them in memory location
equal:
  mov m , a ; store one of them into memory
  jmp exit ; end program

; if a register value greater than b register value 
; then store a register value in memory location
great:
  mov m , a ; store a register value into memory
  jmp exit ; end program

; if b register value greater than a register value 
; then store a register value in memory location
less:
  mov m , b ; store b register value into memory
  jmp exit ; end program

; error stage
error:
  jmp exit ; end program


exit: 
  hlt ; hlt the program








