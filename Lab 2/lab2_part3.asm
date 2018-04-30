	.data
Z: 	.word 2			#int Z
i: 	.word 0			#int i
	.text

main:
    	la a2, Z		#set Z	
    	la a3, i		#set i	
    	lw s0, 0(a2)		#load Z
    	lw s1, 0(a3)		#load i
    	li t0, 22	
    	li t1, 100
    	li t2, 0
    	li t3, 1
    
for: 
	beq s1, t0, SetB	#if i = 22, branch to dowhile loop, if not, doing following commands
    	addi s0, s0, 1		#Z++
    	addi s1, s1, 2		#i++
    	j for			#keep doing for loop
   
SetB:	#do-while loop
	beq s0, t1, SetC	#if Z = 100, branch to while loop, if not, doing following commands
    	addi s0, s0, 1		#Z++
    	j SetB			#keep doing do-white loop
    
SetC:	#while loop
	beq s1, t2, EXIT	#if i = 0, branch to exit, if not, doing following commands
    	sub s0, s0, t3		#Z--
    	sub s1, s1, t3		#i--
    	sw s0, 0(a2)		#store back to Z
    	sw s1, 0(a3)		#store back to i
    	j SetC			#keep doing white loop
    
    
EXIT:
	li a7,1			# system call code for print_int
	lw a0,i			# print i
	ecall			# print it
	
	li a7,1			# system call code for print_int
	lw a0,Z			# print Z
	ecall			# print it
	
        li a7,10      		#system call for an exit
    	ecall
	
# END
