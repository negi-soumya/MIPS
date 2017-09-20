
# Input string from user and reverse it.
# The program is storing inputed in 'space' and reversed string in 'str'
# Code is not simply displaying string in reverse order(all though that is much simpler) 

	.data
prompt:	.asciiz "Enter name :  "
p1:	.asciiz "You are: "
p2:	.asciiz "Reversed: "

space:	.space 20
str:	.space 20

	.globl main
	.text
main:
	
	li $v0, 4		#disp prompt     
	la $a0, prompt
	syscall
	
	#code for reading name from user
	li $v0, 8		
	la $a0, space		#name will be stored in space
	li $a1, 20
	syscall
	
	li $v0, 4		#disp p1	     
	la $a0, p1
	syscall
	
	li $v0, 4		#disp space
	la $a0, space
	syscall

	la $t0, space		#t0=&space
	la $t2, str		#t2=&str
	li $t5, 0
loop:
	lb $t1,0($t0)
	beqz $t1, cont		#if t1==0 ,go to disp;strings are 0 terminated in MIPS
	addi $t0,$t0,1		#next element
	addi $t5,$t5,1		#t5++, for size
	j loop

cont:
	addi $t5,$t5,-1		#size is t5-1
			
	#t0-address of space
	#t2-address of str
		
	li $t4, 0		#counter
	move $t1, $t5		 
	addi $t1,$t1,-1		#t1=sizeof(space)-1
	la $t7, space
	add $t7,$t7,$t1
rev:
	addi $t4,$t4,1
	
	lb $t6,0($t7)
	addi $t7,$t7,-1
	
		
	sb $t6,0($t2)
	addi $t2,$t2,1	
	beq $t4,$t5,disp
	j rev
	
disp:
	sb $0,0($t2)		#appending 0 at end of str;strings are 0 terminated in MIPS
		
	li $v0, 4		#disp p2	     
	la $a0, p2
	syscall
	

	li $v0, 4		#disp str
	la $a0, str
	syscall
