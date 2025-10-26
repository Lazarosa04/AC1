# Código simples apenas para explicar a declaração de strings

	.data
str1:	.asciiz "Uma string qualquer"	# asciiz permite guardar uma string
str2:	.asciiz "AC1 - p"		# str2 agora é equivalente ao que está escrito no asciiz

	.text
	.globl main
	
main:	jr $ra				# fim do programa