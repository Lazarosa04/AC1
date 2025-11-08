# igual ao ex1 mas com recurso a ponteiros
# Mapa de registos
# num : $t0
# p : $t1
# *p : $t2

	.data
	.eqv SIZE,20		# define SIZE 20
	.eqv readString,8	
	.eqv printInt,1
str1:	.space 21		# [SIZE + 1]

	.text
	.globl main
	
main:	li $t0,0		# num = 0
	li $v0,readString	# readString
	la $a0,str1		# str
	li $a1,SIZE		# SIZE
	syscall			# readString(str, SIZE)
	
	la $t1,str1		# p = str
	
while:	lb $t2,0($t1)		# *p
	beq $t2,'\0',endW	# if *p == '\0' termina o ciclo
	
if:	blt $t2,'0',endIf	# se *p < '0' nao e numero
	bgt $t2,'9',endIf	# se * p > '9' nao e numero
	addi $t0,$t0,1		# se for numero entao incrmentamos o contador
	
endIf:	addiu $t1,$t1,1		# p++
	j while			# voltar ao ciclo
	
endW:	li $v0,printInt		# printInt
	move $a0,$t0		# de num
	syscall
	
	jr $ra			# fim do programa