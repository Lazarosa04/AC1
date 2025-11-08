# multiplicação de inteiros atraves de sucessivas operacoess
# somas e deslocamentos
# res : $t0
# i : $t1
# mdor : $t2
# mdo : $t3

	.data
str1:	.asciiz "Introduza dois numeros: "
str2:	.asciiz "Resultado : "
	
	.eqv readInt,5
	.eqv printString,4
	.eqv printInt,1
	
	.text
	.globl main
	
main:	li $t0,0	# res = 0
	li $t1,0	# i = 0
	
	li $v0,printString	# printString
	la $a0,str1		# da str1
	syscall
	
	li $v0,readInt		# readInt
	syscall
	andi $t2, $v0, 0x0F	# modr = readInt & 0x0F
	
	li $v0,readInt		# readInt
	syscall
	andi $t3, $v0, 0x0F	# mdo = readInt & 0x0F
	
while:	beq $t2,0,endWhile	# se modr == 0 termina o ciclo
	bge $t1,4,endWhile	# mesma coisa se i >=4
	
	andi $t5,$t2,0x00000001
if:	beq $t5,0,endIf		# se modr & 0x00000001 == 1 não entramos no If
	add $t0,$t0,$t3		# res = res + mdo
endIf:	sll $t3,$t3,1		# mdo = mdo << 1
	srl $t2,$t2,1		# mdor = mdor >> 1
	addi $t1,$t1,1		# i++
	
	j while			# repetir ciclo
	
endWhile:	
	li $v0,printString	# printString
	la $a0,str2		# da str2
	syscall
	
	li $v0,printInt		# printInt
	move $a0,$t0		# valor a imprimir é o res
	syscall
	
	jr $ra			# fim da funcao
	