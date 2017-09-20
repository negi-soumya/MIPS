
# Input string from userand display it.


.data 
prompt:	.asciiz "Enter name :  " 
p:	.asciiz "You are: " 
str:	.space 20 			#this allocates 20 bytes in memory and can be accessed by name str

	.globl main 
	.text 
main: 
	 
	li $v0, 4	     		#display 'prompt'
	la $a0, prompt 
	syscall 
	 
	li $v0, 8 
	la $a0, str 			# a0 register stores inputed string; we are loading space address in a0, so space also holds string
	li $a1, 3 			# a1 arguement specifies maximum characters user can enter in string
	syscall 
	 
	li $v0, 4	     		#display 'p'
	la $a0, p 
	syscall 
	 
	li $v0, 4 			#display str
	la $a0, str 
	syscall


