# Programa que implemente a expressão aritmética y = 2x - 8
# Usar system calls para pedir valor ao user e para imprimir o resultado

# x : $t0
# resultado (y) : $t1

	.data
	# função .eqv permite guardar valores
	.eqv printInt,1		# string "printInt" passa a ser equivalente a 1
	.eqv readInt,5		# string "readInt" passa a ser equivalente a 5
	
	.text
	.globl main
	
main:	li $v0,readInt		# operação li (load immediate) de readInt (5)
	syscall			# chamada ao syscall
				# resultado da syscall é guardado em $v0
	move $t0,$v0		# mover o conteudo do resultado para $t0
	li $t2,8		# load do 8 em $t2
	add $t1,$t0,$t0		# guardar em y ($t1) a soma de x consigo mesmo (2x)
	sub $t1,$t1,$t2		# subtrair a y ($t1) 8 ($t2)
				# contas feitas, agora vamos dar print do resultado
	li $v0,printInt		# função a chamar é a readInt($v0)
	move $a0,$t1		# o valor a imprimir ($a0) é o y ($t1)
	syscall			# chamada ao syscall
	
	jr $ra			# fim do programa