# programa para ler um numero introduzido pelo user  devolvê-lo em binário
# adicionar um espaço a cada 4 bits
# não imprimir zeros à esquerda
# value : $t0
# bit : $t1
# i : $t2
# flag : $t5		(endereço arbitrario, podes escolher qualquer um em desuso)

	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binario �: "

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
	li $t5,0		# inicializar flag a 0
	
for:	bge $t2,32,endfor	# vamos traduzir 32 bits, quando i for igual a 32 bits paramos ( i>=32, endfor)
	li $t3,0x80000000	# guardar o valor 0x80000000 para comparações
	
	and $t1,$t0,$t3		# bit ($t1) = value ($t0) & 0x80000000 ($t3)
	srl $t1,$t1,31		# bit = (value & 0x80000000) >> 31
	rem $t3,$t2,4		# guardar o valor de i % 4 para comparações
	
if:	beq $t5,1,space		# se a flag estiver a 1 prosseguimos mesmo que o bit seja 0
	beq $t1,0,endif		# se o bit for 0 passamos ao proximo
	
# este label agora é necessária, para termos um sitio onde saltar caso a flag seja positiva
space:	bne $t3,0,else		# se i % 4 não for igual a 0, prosseguimos como normal
	li $v0,printChar	# se for igual a 0, imprimimos o espaço
	li $a0, ' '
	syscall
	
# esta é que é desnecessária
else:	li $t5,1		# encontramos o primeiro 1, ativamos a flag
	addi $t3,$t1,0x30	# 0x30 + bit
	li $v0,printChar	# printChar
	move $a0,$t3		# de 0x30 + bit
	syscall
	
endif:	sll $t0,$t0,1		# value = value << 1
	addi $t2,$t2,1		# i++
	j for			# acabou a verificação e já passamos ao proximo bit, vamos retornar ao ciclo
	
endfor:	jr $ra			# ciclo terminou, terminou o código
	
