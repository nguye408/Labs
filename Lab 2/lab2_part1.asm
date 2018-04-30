	.data
Z: 	.word 0	#int z
	.text

main:
    	la s1, Z		#Load Z
    	li a1, 15		#A=15
    	li a2, 10		#B=10
    	li a3, 5		#C=5
    	li a4, 2		#D=2
    	li a5, 18		#E=18
    	li a6, -3		#F=-3
    	#li s0, 0
    	SUB t0, a1, a2		#A-B
    	MUL t1, a3, a4		#C*D
    	SUB t2, a5, a6		#E-F
    	DIV t3, a1, a3		#A/C
    	ADD t0, t0, t1		#(A-B)+(C*D)
    	ADD t0, t0, t2		#(A-B)+(C*D)+(E-F)
    	SUB t0, t0, t3		#(A-B)+(C*D)+(E-F)-(A/C)
    
    	sw t0, 0(s1)		#store t0=(A-B)+(C*D)+(E-F)-(A/C) back to z
        			#with z stored in memory

	li a7,1			# system call code for print_int
	lw a0,Z			# print Z
	ecall			# print it
	
        li a7,10      		#system call for an exit
    	ecall
    	
#END OF PROGRAM
