
# Display all prime numbers from 1 to 20

	.data
a:	.word 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20		    #stores 2 to 21 in sequential memory location(like array)	
prompt:	.asciiz "prime are "
endl:	.asciiz " "

	.globl main
	.text
main:
	li $v0, 4		#disp prompt
	la $a0, prompt
	syscall
	
	li $t5, 20		#t5=20, for further comparison
	la $t8, a		#t8=&a, array address
	lw $t0,0($t8)		#t0=a[0], array element
	move $t1, $t0		#t1=t0
	li $t7, 1		#register for comparision to 1

prime:
	addi $t1,$t1,-1		#t1=t1-1, decrement t1 and divide t0 by it
	beq $t1,$t7,disp	#if t1==1, send to disp 

	div $t0,$t1		#code for division
	mfhi $t2		#t2 is remainder
	
	bne $t2,$0,prime	#remainder not zero(check for next divisor)
	beq $t2,$0,next		#remainder zero(not prime go to next)
	
disp:
	li $v0, 1		#disp t0
	move $a0, $t0
	syscall
	
	li $v0, 4		#disp " "
	la $a0, endl	
	syscall
	
	j next	

next:
	beq $t0,$t5,exit	#if(t0==20) then exit
	addi $t8,$t8,4
	lw $t0,0($t8)		#go to next array element a[i+1] 
	move $t1, $t0		#set t1=t0
	j prime			#return to prime(and check for prime)
exit:
	li $v0, 10		#program end
	syscall
	
