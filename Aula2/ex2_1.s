# Tradução da expressão "gray = bin ^ (bin >> 1);" para assembly
# bin: $t0
# gray : $t1

	.data
	.text
	.globl main
	
main:	li $t0,7		# load do valor binário
	srl $t2,$t0,1		# guardar o valor da expressão (bin >> 1) numa variável 
	xor $t1,$t0,$t2		# gray = binário ^ (xor) bin >> 1
	
	jr $ra			# fim do programa