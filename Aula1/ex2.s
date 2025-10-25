# Programa que implemente a expressão aritmética y = 2x - 8
# x : $t0
# resultado (y) : $t1

	.data
	.text
	.globl main
	
main:	ori $t0,$0,3		# guardar em x ($t0) resultado da comparação de 3 com 0 ($0)
	ori $t2,$0,8		# mesma coisa mas para guardarmos o 8 em $t2
	add $t1,$t0,$t0		# guardar em y ($t1) soma de x consigo mesmo (2x)
	sub $t1,$t1,$t2 	# subtrair a y o 8 que guardamos há bocado
	jr $ra			# fim do programa