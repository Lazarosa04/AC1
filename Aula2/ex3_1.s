# Impressão de string no ecrã através de syscall

	.data
str1:	.asciiz "Uma string qualquer"	# asciiz permite guardar uma string
str2:	.asciiz "AC1 - p"		# str2 agora é equivalente ao que está escrito no asciiz
	.eqv printString,4

	.text
	.globl main
	
main:	li $v0,printString		# syscall a fazer é o printString
	la $a0,str2			# valor a imprimir é o da str2
	syscall
	
	jr $ra				# fim do programa