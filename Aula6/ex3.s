# imprime as 3 strings mas caracter a caracter e seguidos do caracter '-'
# i : $t0
# j : $t1
# array[i][j] : $t3

	.data
	.eqv SIZE,3			#define SIZE 3
	.eqv printInt,1
	.eqv printString,4
	.eqv printChar,11
array:	.word str1,str2,str3		
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
str4:	.asciiz "\nString #"
str5:	.asciiz ": "
	
	.text
	.globl main
	
main:	li $t0,0			# i = 0

for:	bge $t0,SIZE,endFor		# se i >= SIZE o ciclo termina
	li $v0,printString		# print String
	la $a0,str4			# da str4
	syscall
	li $v0,printInt			# printInt
	move $a0,$t0			# de i
	syscall
	li $v0,printString		# print String
	la $a0,str5			# da str5
	syscall
	li $t1,0			# j = 0
	
while:	la $t3,array			# $t3 = endereco de array[0]
	sll $t2,$t0,2			# 4 * i
	addu $t3,$t3,$t2		# array[i]
	lw $t3,0($t3)			# estamos a dar load da primeira palavra do array
	addu $t3,$t3,$t1		# agora somamos j, ou seja estamos no endereco de array[i][j]
	lb $t3,0($t3)			# damos load de array[i][j]
	beq $t3,'\0',endWhile		# se o caracter for '\0' termina a string
	li $v0,printChar		# printChar
	move $a0,$t3			# de array[i][j]
	syscall
	li $v0,printChar		# printChar
	li $a0,'-'			# de '-'
	syscall
	addi $t1,$t1,1			# incrementar j em 1 para passar ao proximo caracter
	j while				# repetir ate terminar a string
	
endWhile:	
	addi $t0,$t0,1			# i++
	j for				# quando o ciclo while termina voltamos ao for para passar a proxima palavra
	
endFor:	jr $ra				# quando o ciclo for termina, acaba o programa
	
	