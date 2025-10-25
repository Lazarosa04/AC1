# Programa que efetue as 3 operações de deslocamento
# shift left : $t2
# shift right logical  : $t3
# shift right arithmetic : $t4
# valor : $t0
# bits a deslocar (Imm) : $t1

	.data
	.text
	.globl main
	
main:	li $t0, 0x12345678	# load do valor 
	sll $t2,$t0,1		# shift left de 1 bit
	srl $t3,$t0,1		# shift right logic de 1 bit
	sra $t4,$t0,1		# shift right aritmetico de 1 bit
	
	jr $ra			# fim de programa