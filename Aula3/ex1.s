# lê 5 valores inteiros do teclado e apresenta a soma dos valores positivos
# soma : $t0
# value : $t1
# i : $t2

	.data
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos valores positivos é: "

	.eqv readInt,5
	.eqv printString,4
	.eqv printInt,1
	
	.text
	.globl main
	
main:	li $t0,0		# inicializar soma a 0
	li $t2,0		# inicializar i a 0

# começa o ciclo for, usamos a label "for" para poder voltar para aqui com a instrução jump (j) mais tarde
for:	bge $t2,5,endfor	# nós queremos o caso de exceção para i<5, logo fazemos a comparação inversa i>=5
	
	li $v0,printString	# printString
	la $a0,str1		# da string 1
	syscall
	
	li $v0,readInt		# readInt
	syscall
	move $t1,$v0		# value = readInt()

# agora fazemos o if para a verificar se o valor é positivo
if:	ble $t1,0,endif		# caso o valor for menor ou igual a 0 temos de imprimir a string e passar ao proximo valor
	
	# caso contrário somamos o valor à soma
	add $t0,$t0,$t1		# soma
	
	addi $t2,$t2,1		# i++
	j for			# acabou a verificação, voltamos ao ciclo for

# vamos imprimir a string de valor ignorado e retornar ao ciclo aqui	
endif:	li $v0,printString	# printString
	la $a0,str2		# da string 2
	syscall
	
	addi $t2,$t2,1		# i++
	j for			# terminou o if, voltamos ao ciclo
	
# quando o ciclo terminar ( i>=5 ) que em prática vai acontecer quando i = 5 ( já lemos 5 valores) imprimimos a soma
endfor:	li $v0,printString	# prinString
	la $a0,str3		# da string 3
	syscall

	li $v0,printInt		# printInt
	move $a0,$t0		# da soma ($t0)
	syscall
	
	jr $ra			# fim do programa
	

	