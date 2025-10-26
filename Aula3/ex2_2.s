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
	srl $t1,$t1,31		# bit = (value & 0x80000000) >> 31
	rem $t3,$t2,4		# guardar o valor de i % 4 para comparações
	
# este label é desnecessário mas ajuda a dividir o código para compreensão
if:	bne $t3,0,endif		# se i % 4 não for igual a 0, prosseguimos como normal
	li $v0,printChar	# se for igual a 0, imprimimos o espaço
	li $a0, ' '
	syscall
	
endif:	addi $t3,$t1,0x30	# 0x30 + bit
	li $v0,printChar	# printChar
	move $a0,$t3		# de 0x30 + bit
	syscall
	
	sll $t0,$t0,1		# value = value << 1
	addi $t2,$t2,1		# i++
	j for			# acabou a verificação e já passamos ao proximo bit, vamos retornar ao ciclo
	
endfor:	jr $ra			# ciclo terminou, terminou o código
	