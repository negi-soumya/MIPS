
# Input 2 integers from user, find and display their product.
# YOu can also use the instruction 'mul $t2,$t0,$t1' and display t2. You won't have to use 'hi' and 'lo' special registers.  

	.data
prompt:	.asciiz "enter integer "
p:      .asciiz "product is "
	.globl main
	.text
main:

#reading integer
	li $v0, 4	     
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall	
	move $t0, $v0
	
#reading integer
	li $v0, 4	     
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall	
	move $t1, $v0
	
	
# mult instruction store the lesser significant 32 bits of product in 'lo' and more significant 32 bits in 'hi'
# usually, product is not large enough to require storage in 'hi'. If product exceeds 32 bits, display product using both 'hi' & 'lo'


#finding and displaying product
	mult $t0,$t1			
#	mfhi $t1			#use for product greater than 32-bits
	mflo $t2
	
	
	
	li $v0, 4	     		#display 'p'
	la $a0, p
	syscall
	
	move $a0, $t2			#display product(only 'lo' value is displayed)
	li $v0, 1
	syscall
