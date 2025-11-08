# le uma string do teclado, conta o numero de caracteres numericos
# imprime o resultado
# Mapa de registos
# num : $t0
# i : $t1
# str : $t2
# str+i : $t3
# str[i] : $t4

	.data
	.eqv readString,8
	.eqv printInt,1
	.eqv SIZE,20		# define SIZE 20
str:	.space 21		# reserva espaço para um array de SIZE+1
	
	.text
	.globl main
	
main:	li $v0,readString	# funcao readString
	# $a0 = address of input buffer 
	# $a1 = maximum number of characters to read
	la $a0,str		# str[SIZE+1]
	li $a1,SIZE		# SIZE
	syscall			# readString(str, SIZE)
	
	li $t0,0		# num = 0
	li $t1,0		# i = 0
	
while:	la $t2, str		# str
	addu $t3,$t2,$t1	# str + i
	lb $t4,0($t3)		# str[i]
	beq $t4,'\0',endWhile	# se str[i] for terminal acaba o ciclo
	
if:	blt $t4,'0',endIf	# se str[i] < '0' não é numero
	bgt $t4,'9',endIf	# mesma coisa se str[i] > '9'
	addi $t0,$t0,1		# num++
	
endIf:	addi $t1,$t1,1		# i++
	
	j while			# volta ao ciclo
	
endWhile:	# quando o ciclo terminar
	li $v0,printInt		# printInt
	move $a0,$t0		# de num
	syscall
	
	jr $ra			# fim do programa