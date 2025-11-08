# le da consola 5 valores inteiros e armaza na num array
# i: $t0
# lista : $t1
# lista + 1 : $t2
# a declaracao do array tem de vir antes da da str
# ou entao usamos .align 2 para garantir que o endereco do array e multiplo de 4

	.data
	.eqv SIZE,5
lista:	.space 20		# SIZE * 4
	.eqv printString,4
	.eqv readInt,5
str1:	.asciiz "\nIntroduza um numero: "
	
	.text
	.globl main
	
main:	li $t0,0		# i = 0
	
for:	bge $t0,SIZE,endFor	# se i >= SIZE acaba o ciclo
	li $v0,printString	# printString
	la $a0,str1		# da string1
	syscall
	
	li $v0,readInt		# $v0 = readInt
	syscall
	
	la $t1,lista		# $t1 = lista
	sll $t2,$t0,2		# sll ? multiplicar por 2, fazemos dois para multiplicar por 4
				# ent?o estamos a fazer 4 * i para chegar ao endere?o correto
	addu $t2,$t2,$t1	# $t2 = lista[i] // o endere?o de lista[i] vai ser 4*i + endere?o da lista
	sw $v0,0($t2)		# readInt = lista[i] // agora que temos o endere?o correto vamos guardar o valor lido l?	
		
	addi $t0,$t0,1		# i++
	
	j for

endFor:	jr $ra			# fim programa