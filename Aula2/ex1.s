# Programa que determine o resultado das operações lógicas bit a bit
# AND : $t2
# OR  : $t3
# NOR : $t4
# XOR : $t5
# Operandos: $t0 e $t1

	.data
	.text
	.globl main
	
main:	li $t0,0x1234		# load dos operandos
	li $t1,0x000F
	
	and $t2,$t0,$t1 	# and
	or  $t3,$t0,$t1		# or
	nor $t4,$t0,$t1		# nor	
	xor $t5,$t0,$t1		# xor
	
	jr $ra			# fim do programa
	
	