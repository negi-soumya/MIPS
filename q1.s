# Input 5 integers and find their sum.

	.data
prompt:	.asciiz "enter integer "
sum:    .asciiz "sum is "
	.globl main
	.text
main:

	li $t0, 0	     #t0 will hold the integer sum

#reading integer
	li $v0, 4	     #display prompt 'prompt'     
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	add $t0,$t0,$v0      #adding integer to sum
	
#reading integer
	li $v0, 4	     
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	add $t0,$t0,$v0      #adding integer to sum
	
#reading integer
	li $v0, 4	     
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	add $t0,$t0,$v0      #adding integer to sum
	
#reading integer
	li $v0, 4	     
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	add $t0,$t0,$v0      #adding integer to sum
	
#reading integer
	li $v0, 4	     
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	add $t0,$t0,$v0      #adding integer to sum
	
	
	li $v0, 4	     #display prompt 'sum'		
	la $a0, sum
	syscall
	
	move $a0, $t0	     #display integer sum
	li $v0, 1
	syscall
	
