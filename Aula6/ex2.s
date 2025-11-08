# define 3 strings organizadas num array e imprime-as
# mas atrav?s de ponteiros em vez de modo indexado
# p : $t1
# pultimo : $t2

	.data
	.eqv SIZE,3
	.eqv printString,4
	.eqv printChar,11
array:	.word str1,str2,str3		
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"

	.text
	.globl main
	
main:	la $t1,array		# p = array
	li $t0,SIZE		# SIZE
	sll $t0,$t0,2		# SIZE * 4
	addu $t2,$t1,$t0	# pultimo = array + SIZE
	
for:	bge $t1,$t2,endFor	# se p >= pultimo termina o ciclo
	lw $a0,0($t1)		# carregar a word para imprimir
	li $v0,printString	# imprimir a word
	syscall
	li $v0,printChar	#imprimir caracter '\n'
	li $a0,'\n'
	syscall
	addiu $t1,$t1,4		# p++
	j for
	
endFor:	jr $ra			# fim do programa
	