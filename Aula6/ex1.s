# define 3 strings organizadas num array e imprime-as
# i : $t0

	.data
	.eqv SIZE,3			#define SIZE 3
	.eqv printString,4
	.eqv printChar,11
array:	.word str1,str2,str3		
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
	
	.text
	.globl main
	
main:	li $t0,0		# i = 0
	la $t1,array		# $t1 = array
	
for:	bge $t0,SIZE,endFor	# se i >= SIZE acaba o ciclo
	sll $t2,$t0,2		# $t2 = 4*i
	addu $t2,$t2,$t1	# endere?o de array + 4*i
	lw $a0,0($t2)		# dar load do que est? no endere?o de array + 4*i |array[i]|
	li $v0,printString	# imprimir a word nessa posicao do array
	syscall
	li $v0,printChar	#imprimir caracter '\n'
	li $a0,'\n'
	syscall
	addi $t0,$t0,1		#i++
	j for
	
endFor:	jr $ra			# fim do programa