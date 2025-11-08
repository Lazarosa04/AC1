# le da consola uma string com 20 caracteres no maximo
# converte os caracteres correspondentes da letra minusculas a maiusculas
# com tratamento de espaços
# escreve string alterada no ecra

# p : $t0
# *p : $t1

	.data
	.eqv SIZE,20
	.eqv printString,4
	.eqv readString,8
str1:	.space 21
str2:	.asciiz "Introduza uma string: "

	.text
	.globl main
	
main:	li $v0,printString	# printString
	la $a0,str2		# da str2
	syscall
	
	li $v0,readString	# readString
	la $a0,str1		# str
	li $a1,SIZE		# SIZE
	syscall			# readString(str, SIZE)
	
	la $t0,str1		# p = str
	
while:	lb $t1,0($t0)		# *p
	beq $t1,'\0',endW	# se *p == '\0' chegamos ao fim do ciclo
	beq $t1,' ',skip	# se *p for um espaço, ignoramos
	addi $t1,$t1,-0x20	# *p = *p - 'a' + 'A' // 'a'=0x61, 'A'=0x41, 'a'-'A'=0x20 
	sb $t1,0($t0)		# depois de alterar o bit temos de voltar a escreve-lo
skip:	addiu $t0,$t0,1		# p++
	j while
	
endW:	li $v0,printString	# printString
	la $a0,str1		# da str1
	syscall
	
	jr $ra			# fim do programa
	