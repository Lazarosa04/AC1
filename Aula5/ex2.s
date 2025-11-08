# envia para o ecra o conteudo de um array de 10 inteiros previamente inicializado
# Mapa de registos
# p : $t0
# *p : $t1
# lista + size : $t2

	.data
	.eqv SIZE,10				# define SIZE 10
lista:	.word 8,-4,3,5,124,-15,87,9,27,15	#lista[]={8, -4, 3, 5, 124, -15, 87, 9, 27, 15}
	.eqv printInt,1
	.eqv printString,4
str1:	.asciiz "\nconteudo do array: \n"
str2:	.asciiz "; "

	.text
	.globl main
	
main:	li $v0,printString		# printString
	la $a0,str1			# da str1
	syscall
	
	la $t0,lista			# p = list
	li $t2,SIZE			# size
	sll $t2,$t2,2			# size * 4
	addu $t2,$t0,$t2		# lista + size(*4)
	
for:	bge $t0,$t2,endFor		# se p >= lista + SIZE acaba o ciclo
	lw $t1,0($t0)			# * p
	li $v0,printInt			# printInt
	move $a0,$t1			# de *p
	syscall
	li $v0,printString		# printString
	la $a0,str2			# da str2
	syscall
	addiu $t0,$t0,4			# p++ (passar ao proximo numero implica somar mais 4
	j for				# repetir o ciclo
	
endFor:	jr $ra				# fim do programa