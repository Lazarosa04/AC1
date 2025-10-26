# ler 2 numeros do user e imprimir o resultado

	.data
str1:	.asciiz "Introduza dois números\n"
str2:	.asciiz "A soma dos dois números é: "
	.eqv printString,4
	.eqv printInt,1
	.eqv readInt,5
	
	.text
	.globl main
	
main:	li $v0,printString	# função a chamar é a printString
	la $a0,str1		# valor a ser passado é str1
	syscall			
	
	li $v0,readInt		# função a chamar é a readInt
	syscall
	move $t0,$v0		# passar o valor lido para $t0
	
	li $v0,readInt		# função a chamar é a readInt
	syscall
	move $t1,$v0		# passar o valor lido para $t1
	
	add $t0,$t0,$t1		# soma dos valores lidos
	
	li $v0,printString	# printString
	la $a0,str2		# str2
	syscall
	
	li $v0,printInt		# printInt
	move $a0,$t0		# passar a soma dos valores lidos
	syscall
	
	jr $ra			# fim do programa
	

