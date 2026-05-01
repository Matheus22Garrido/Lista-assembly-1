.data
    msg1: .asciiz "\nDigite seu primeiro número: "
    msg2: .asciiz "\nDigite seu segundo número (deve ser diferente de zero): "
    msg3: .asciiz "\nEu disse >DIFERENTE DE ZERO<"
    msg4: .asciiz "\nO resultado da divisão é: "
.text
main:
    # recebe n1
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall 
    add $t9, $v0, 0

n2:
    # recebe n2
    li $v0, 4
    la  $a0, msg2
    syscall
    li $v0, 5
    syscall
    add $t8, $v0, 0

    # ve se é zero
    beq $t8, 0, seZero
    j aritmetica

seZero:
    # fala que nao pode ser zero
    li $v0, 4
    la $a0, msg3
    syscall
    j n2

aritmetica:
    # aritmetica
    div $s0, $t9, $t8

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    add $a0, $s0, 0
    syscall