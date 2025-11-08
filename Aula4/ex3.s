# calcula e imprime a soma dos elementos de um array de 4 inteiros
# Mapa de registos
# p : $t0
# pultimo : $t1
# *p : $t2
# soma : $t3

	.data
	.eqv SIZE,4		# define SIZE 4
array:	.word 7692, 23, 5, 234	# int array[4] = {7692, 23, 5, 234}
	.eqv printInt,1
	
	.text
	.globl main
	
main:	li $t3,0		# soma = 0
	la $t0,array		# p = array
	li $t4,SIZE
	addi $t4,$t4,-1
	sll $t4,$t4,2		# (SIZE -1) * 4 porque cada word ocupa 4
	addu $t1,$t0,$t4	# pultimo = array + (SIZE -1)
	
while:	bgt $t0,$t1,endW	# se p > pultimo é porque chegamos ao fim
	lw $t2,0($t0)		# *p	# load word, por se numero nao char
	add $t3,$t3,$t2		# soma = soma + *p
	addiu $t0,$t0,4		# p++ # aqui sao numeros e nao chars por isso 4
	
	j while
	
endW:	li $v0,printInt		# print
	move $a0,$t3		# da soma
	syscall
	
	jr $ra			# fim do programa