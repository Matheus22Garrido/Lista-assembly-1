.data
    msg1: .asciiz "\nDigite o primeiro número: "
    msg2: .asciiz "\nDigite o segundo número: "
    msg3: .asciiz "\nO resto da divisão do maior pelo menor é: "
    msg4: .asciiz "\nOs números são iguais, o resto é sempre 0"
    msg5: .asciiz "\nNão pode dividir por 0"
.text
main:
    # recebe n1
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t9, $v0, 0

    # recebe n2
    li  $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    add $t8, $v0, 0

    # decisão
    bgt $t9, $t8, maior
    blt $t9, $t8, menor
    beq $t9, $t8, iguais

maior:
    # $t9 ($s0) = maior, $t8 ($s1) = menor
    add $s0, $t9, 0
    add $s1, $t8, 0
    beq $s0, 0, zero
    beq $s1, 0, zero
    j aritmetica

menor:
    # $t9 ($s1) = menor, $t8 ($s0) = maior
    add $s0, $t8, 0
    add $s1, $t9, 0
    beq $s0, 0, zero
    beq $s1, 0, zero
    j aritmetica

iguais:
    li $v0, 4
    la $a0, msg4
    syscall
    j fim

aritmetica:
    # faz as contas  //  $s7 = resto da divisao  //  $t4 = contador
    add $t4, $t4, 1

if:
    beq $t4, 1, parte1
    j parte2

parte1:
    # quando contador é 1
    sub $s7, $s0, $s1
    j verifica

parte2:
    # quando contador n é mais 1
    sub $s7, $s7, $s1
    j verifica

verifica:
    # verifica
    bge $s7, $s1, aritmetica
    j resultado

resultado:
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $s7, 0
    syscall
    j fim

zero:
    li $v0, 4
    la $a0, msg5
    syscall
    j main
fim:

