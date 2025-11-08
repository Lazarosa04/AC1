# converte quantidade introduzida pelo utilizador, em codigo gray para binario 
# gray : $t0
# mask : $t1
# bin : $t2

	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nValor em codigo gray: "
str3:	.asciiz "\nValor em binario: "

	.eqv printString,4
	.eqv readInt,5
	.eqv printInt16,34

	.text
	.globl main
	
main:	li $v0,printString	# função a chamar e printString
	la $a0,str1		# string a imprimir e str1
	syscall			# chamar funcao
	
	li $v0,readInt		# funcao a chamar e readInt
	syscall
	move $t0,$v0		# gray = readInt();
	
	srl $t1,$t0,1		# mask = gray >> 1
	move $t2,$t0		# bin = gray
	
while:	beq $t1,0,endWhile	# se mask == 0 termina o ciclo
	xor $t2,$t2,$t1		# bin = bin ^ mask
	srl $t1,$t1,1		# mask = mask >> 1
	j while
	
endWhile:	
	
	li $v0,printString	# printString
	la $a0,str2		# str2
	syscall
	
	li $v0,printInt16	# printInt16(gray)
	move $a0,$t0
	syscall
	
	li $v0,printString	# printString
	la $a0,str3		# str3
	syscall
	
	li $v0,printInt16	# printInt16(gray)
	move $a0,$t2
	syscall
	
	jr $ra
	
	
