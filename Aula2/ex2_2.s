# Conversão de codigo Gray para binário natural
# gray : $t0
# num : $t1
# bin : $t2

	.data
	.text
	.globl main
	
main:	li $t0,7		# load do valor em codigo de gray
	move $t1,$t0		# num = gray
	srl $t3,$t1,4		# guardar o valor da expressão (num >> 4) numa variável
	xor $t1,$t1,$t3		# num = num ^ (num >> 4)
	srl $t3,$t1,2		# guardar o valor da expressão (num >> 2) numa variável
	xor $t1,$t1,$t3		# num = num ^ (num >> 2)
	srl $t3,$t1,1		# guardar o valor da expressão (num >> 1) numa variável
	xor $t1,$t1,$t3		# num = num ^ (num >> 1)
	move $t2,$t1		# bin = num; 	
	
	jr $ra			# fim do programa