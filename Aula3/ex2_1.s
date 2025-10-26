# programa para ler um numero introduzido pelo user  devolvê-lo em binário
# adicionar um espaço a cada 4 bits
# value : $t0
# bit : $t1
# i : $t2

	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binario é: "

	.eqv printString,4
	.eqv printChar,11
	.eqv readInt,5
	
	.text
	.globl main
	
main:	li $v0,printString	# printString
	la $a0,str1		# da string 1
	syscall
	
	li $v0,readInt		# readInt
	syscall
	move $t0,$v0		# value = readInt()
	
	li $v0,printString	# printString
	la $a0,str2		# da string 2
	syscall
	
	li $t2,0		# inicializar i a 0
	
for:	bge $t2,32,endfor	# vamos traduzir 32 bits, quando i for igual a 32 bits paramos ( i>=32, endfor)
	li $t3,0x80000000	# guardar o valor 0x80000000 para comparações
	
	and $t1,$t0,$t3		# bit ($t1) = value ($t0) & 0x80000000 ($t3)
	rem $t3,$t2,4		# guardar o valor de i % 4 para comparações
	
# este label é desnecessário mas ajuda a dividir o código para compreensão
space:	bne $t3,0,if		# se i % 4 não for igual a 0, prosseguimos como normal
	li $v0,printChar	# se for igual a 0, imprimimos o espaço
	li $a0, ' '
	syscall
	
if:	beq $t1,0,else		# se o bit for igual a 0 passamos ao else
	
	# caso contrario imprimimos '1'
	li $v0,printChar	# printChar
	li $a0,'1'		# de '1'
	syscall
	
	j endif			# já foi feita a verificação e a ação, passamos ao endif (fazer as ações do endif aqui também serve)
	
else:	# se estamos no else é porque o bit é '0', então imprimimos '0'
	li $v0,printChar	# printChar
	li $a0,'0'		# de '0'
	syscall
	
	j endif			# desnecessário porque ele salta para o endif a seguir de qualquer maneira mas acho que o código fica mais legível assim
	
endif:	sll $t0,$t0,1		# value = value << 1
	addi $t2,$t2,1		# i++
	j for			# acabou a verificação e já passamos ao proximo bit, vamos retornar ao ciclo
	
endfor:	jr $ra			# ciclo terminou, terminou o código
	