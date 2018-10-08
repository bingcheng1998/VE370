# p1.s
# Wrote by Bingcheng, SJTU, 2018, 10, 07
	.text
	.globl __start
__start:
# Start
#----------------- Main -----------------
	
# 1. ajust stack (for `int A[]` and `string output`) and
#		generate `int numElement`, `int cntType`.

	addi $sp, $sp, -204 # adjust stack for 50*4+12 items
    addi $s0, $0, 60 	# int size = 60
    addu $s1, $0, $0 	# int PassCnt = 0
    addu $s2, $0, $0 	# int FailCnt = 0
    addu $s3, $0, $sp 	# String with length 4-1 = 3
    addiu $s4, $s3, 4	# int A[size]

# 2. copy and past `generated_array.s` below

	addi $t0, $0, 48  	# $t0 = 48
	sw $t0, 0($s4)  	# A[0] = $t0
	addi $t0, $0, 134  	# $t0 = 134
	sw $t0, 4($s4)  	# A[1] = $t0
	addi $t0, $0, 128  	# $t0 = 128
	sw $t0, 8($s4)  	# A[2] = $t0
	addi $t0, $0, 83  	# $t0 = 83
	sw $t0, 12($s4)  	# A[3] = $t0
	addi $t0, $0, 65  	# $t0 = 65
	sw $t0, 16($s4)  	# A[4] = $t0
	addi $t0, $0, 111  	# $t0 = 111
	sw $t0, 20($s4)  	# A[5] = $t0
	addi $t0, $0, 92  	# $t0 = 92
	sw $t0, 24($s4)  	# A[6] = $t0
	addi $t0, $0, 41  	# $t0 = 41
	sw $t0, 28($s4)  	# A[7] = $t0
	addi $t0, $0, 113  	# $t0 = 113
	sw $t0, 32($s4)  	# A[8] = $t0
	addi $t0, $0, 79  	# $t0 = 79
	sw $t0, 36($s4)  	# A[9] = $t0
	addi $t0, $0, 60  	# $t0 = 60
	sw $t0, 40($s4)  	# A[10] = $t0
	addi $t0, $0, 57  	# $t0 = 57
	sw $t0, 44($s4)  	# A[11] = $t0
	addi $t0, $0, 66  	# $t0 = 66
	sw $t0, 48($s4)  	# A[12] = $t0
	addi $t0, $0, 93  	# $t0 = 93
	sw $t0, 52($s4)  	# A[13] = $t0
	addi $t0, $0, 136  	# $t0 = 136
	sw $t0, 56($s4)  	# A[14] = $t0
	addi $t0, $0, 58  	# $t0 = 58
	sw $t0, 60($s4)  	# A[15] = $t0
	addi $t0, $0, 57  	# $t0 = 57
	sw $t0, 64($s4)  	# A[16] = $t0
	addi $t0, $0, 132  	# $t0 = 132
	sw $t0, 68($s4)  	# A[17] = $t0
	addi $t0, $0, 134  	# $t0 = 134
	sw $t0, 72($s4)  	# A[18] = $t0
	addi $t0, $0, 118  	# $t0 = 118
	sw $t0, 76($s4)  	# A[19] = $t0
	addi $t0, $0, 129  	# $t0 = 129
	sw $t0, 80($s4)  	# A[20] = $t0
	addi $t0, $0, 34  	# $t0 = 34
	sw $t0, 84($s4)  	# A[21] = $t0
	addi $t0, $0, 55  	# $t0 = 55
	sw $t0, 88($s4)  	# A[22] = $t0
	addi $t0, $0, 120  	# $t0 = 120
	sw $t0, 92($s4)  	# A[23] = $t0
	addi $t0, $0, 117  	# $t0 = 117
	sw $t0, 96($s4)  	# A[24] = $t0
	addi $t0, $0, 42  	# $t0 = 42
	sw $t0, 100($s4)  	# A[25] = $t0
	addi $t0, $0, 110  	# $t0 = 110
	sw $t0, 104($s4)  	# A[26] = $t0
	addi $t0, $0, 81  	# $t0 = 81
	sw $t0, 108($s4)  	# A[27] = $t0
	addi $t0, $0, 132  	# $t0 = 132
	sw $t0, 112($s4)  	# A[28] = $t0
	addi $t0, $0, 46  	# $t0 = 46
	sw $t0, 116($s4)  	# A[29] = $t0
	addi $t0, $0, 102  	# $t0 = 102
	sw $t0, 120($s4)  	# A[30] = $t0
	addi $t0, $0, 47  	# $t0 = 47
	sw $t0, 124($s4)  	# A[31] = $t0
	addi $t0, $0, 117  	# $t0 = 117
	sw $t0, 128($s4)  	# A[32] = $t0
	addi $t0, $0, 76  	# $t0 = 76
	sw $t0, 132($s4)  	# A[33] = $t0
	addi $t0, $0, 56  	# $t0 = 56
	sw $t0, 136($s4)  	# A[34] = $t0
	addi $t0, $0, 60  	# $t0 = 60
	sw $t0, 140($s4)  	# A[35] = $t0
	addi $t0, $0, 106  	# $t0 = 106
	sw $t0, 144($s4)  	# A[36] = $t0
	addi $t0, $0, 143  	# $t0 = 143
	sw $t0, 148($s4)  	# A[37] = $t0
	addi $t0, $0, 50  	# $t0 = 50
	sw $t0, 152($s4)  	# A[38] = $t0
	addi $t0, $0, 50  	# $t0 = 50
	sw $t0, 156($s4)  	# A[39] = $t0
	addi $t0, $0, 145  	# $t0 = 145
	sw $t0, 160($s4)  	# A[40] = $t0
	addi $t0, $0, 47  	# $t0 = 47
	sw $t0, 164($s4)  	# A[41] = $t0
	addi $t0, $0, 115  	# $t0 = 115
	sw $t0, 168($s4)  	# A[42] = $t0
	addi $t0, $0, 49  	# $t0 = 49
	sw $t0, 172($s4)  	# A[43] = $t0
	addi $t0, $0, 90  	# $t0 = 90
	sw $t0, 176($s4)  	# A[44] = $t0
	addi $t0, $0, 118  	# $t0 = 118
	sw $t0, 180($s4)  	# A[45] = $t0
	addi $t0, $0, 70  	# $t0 = 70
	sw $t0, 184($s4)  	# A[46] = $t0
	addi $t0, $0, 111  	# $t0 = 111
	sw $t0, 188($s4)  	# A[47] = $t0
	addi $t0, $0, 64  	# $t0 = 64
	sw $t0, 192($s4)  	# A[48] = $t0
	addi $t0, $0, 34  	# $t0 = 34
	sw $t0, 196($s4)  	# A[49] = $t0
	addi $t0, $0, 95  	# $t0 = 95
	sw $t0, 200($s4)  	# A[50] = $t0
	addi $t0, $0, 49  	# $t0 = 49
	sw $t0, 204($s4)  	# A[51] = $t0
	addi $t0, $0, 112  	# $t0 = 112
	sw $t0, 208($s4)  	# A[52] = $t0
	addi $t0, $0, 91  	# $t0 = 91
	sw $t0, 212($s4)  	# A[53] = $t0
	addi $t0, $0, 98  	# $t0 = 98
	sw $t0, 216($s4)  	# A[54] = $t0
	addi $t0, $0, 107  	# $t0 = 107
	sw $t0, 220($s4)  	# A[55] = $t0
	addi $t0, $0, 106  	# $t0 = 106
	sw $t0, 224($s4)  	# A[56] = $t0
	addi $t0, $0, 58  	# $t0 = 58
	sw $t0, 228($s4)  	# A[57] = $t0
	addi $t0, $0, 140  	# $t0 = 140
	sw $t0, 232($s4)  	# A[58] = $t0
	addi $t0, $0, 136  	# $t0 = 136
	sw $t0, 236($s4)  	# A[59] = $t0

# 3. generate ARGUIMENT for `countArray()`
#		with `cntType = 1`

	addu $a0, $0, $s4	# $a0 = A[]
	addu $a1, $0, $s0	# $a1 = size
	addi $a2, $0, 1 	# $a2 = 1
	
# 4. $v0 = countArray(A[], size, 1)
#		count the elements greater than or equal to 60; 
	jal countArray   
	addi $t1, $0, 1  
	add $s1, $0, $v0 

# 5. generate ARGUIMENT for `countArray()`
#		with `cntType = -1`
	addu $a0, $0, $s4  	# $a0 = A[]
	addu $a1, $0, $s0	# $a1 = size
	addi $a2, $0, -1	# $a2 = -1
	
# 6. $v0 = countArray(A[], size, -1)
#		count the elements less than 60; 
	jal countArray		
	addi $t1, $0, 1		
	add $s2, $0, $v0 	

# 7. println(PassNum) like `P: 10`
	# Init the string "P: \0"
	addi $t0, $0, 80  	# 'P'
	sb $t0, 0($s3)
	addi $t0, $0, 58	# ':'
	sb $t0, 1($s3)
	addi $t0, $0, 32	# ' '
	sb $t0, 2($s3)
	addi $t0, $0, 0		# '\0' the end of a string
	sb $t0, 3($s3)
	addiu $a0, $s3, 0	# $a0 = $s3 ("P: \0")
	addi $v0, $0, 4 	# string output (system call 4)
	syscall        		# print("P: ");

	add $a0, $0, $s1 	# $a0 = $s4
	addi $v0, $0, 1 	# int output (system call 1)
	syscall         	# print(a0);
# print a blank
	addi $t0, $0, 32	# ' '
	sb $t0, 0($s3)
	addi $t0, $0, 0		# '\0' the end of a string
	sb $t0, 1($s3)
	addiu $a0, $s3, 0	# $a0 = $s3 (" ")
	addi $v0, $0, 4 	# string output (system call 4)
	syscall        		# print(" ");

# 8. println(FailNum) like `F: 10`
	# Init the string "F: \0"
	addi $t0, $0, 70  	# 'F'
	sb $t0, 0($s3)
	addi $t0, $0, 58	# ':'
	sb $t0, 1($s3)
	addi $t0, $0, 32	# ' '
	sb $t0, 2($s3)
	addi $t0, $0, 0		# '\0' the end of a string
	sb $t0, 3($s3)
	addiu $a0, $s3, 0	# $a0 = $s3 ("F: \0")
	addi $v0, $0, 4 	# string output (system call 4)
	syscall        		# print("F: ");

	add $a0, $0, $s2 	# $a0 = $s5
	addi $v0, $0, 1 	# int output (system call 1)
	syscall         	# print(a0);

# 9. exit
	jal exit
    addi $t0, $0, 0

# ----------- Functions (Procedures) ------------

# 1. int countArray(int A[], int numElements, int cntType)
countArray:
	addi $sp, $sp, -24  # adjust stack for 6 items
    sw $s0, 0($sp) 
    sw $s1, 4($sp) 	
    sw $s2, 8($sp) 
    sw $s3, 12($sp)
    sw $s4, 16($sp)
    sw $ra, 20($sp)  

    addu $s0, $0, $a0   
    addu $s1, $0, $a1  
    add $s2, $0, $a2    

    addi $s3, $s1, -1   
    addi $s4, $0, 0     
    addi $v0, $0, 0     

Loop:
	addi $t0, $0, 0         # delay to wait for previous progress
	slt $t0, $s3, $0        # $t0 = i < 0
	bne $t0, $0, breakHere
	
	sll $t0, $s3 ,2         # $t0 = i * 4
	add $t0, $s0, $t0       # $t0 = A + $t0
	lw $a0, 0($t0)          # $a0 = $t0 = A[]
	addi $t1, $0, 1         # $t1 = 1
	addi $t1, $0, 1         # delay to wait for previous progress
	beq $s2, $t1, JalToPass	# if (cntType == 1) JalToPass
	addi $t0, $0, 0         # delay to wait for previous progress

JalToFail:
	jal Fail                # $v0 = Fail(A[i])
	addi $t0, $0, 0         # delay to wait for previous progress
	add $s4, $s4, $v0      	# cnt += $v0
    addi $s3, $s3, -1       # i--
    j Loop         			# jump to Loop
    addi $t0, $0, 0         # delay to wait for previous progress

JalToPass:
    jal Pass                # $v0 = Pass(A[i])
    addi $t1, $0, 0         # delay to wait for previous progress
    add $s4, $s4, $v0      	# cnt += $v0
    addi $s3, $s3, -1       # i--
    j Loop         			# jump to Loop
    addi $t0, $0, 0         # delay to wait for previous progress



breakHere:
	addi $t0, $0, 0         # delay to wait for previous progress
	add $v0, $0, $s4        
    lw $s0, 0($sp)          
    lw $s1, 4($sp)          
    lw $s2, 8($sp)          
    lw $s3, 12($sp)         
    lw $s4, 16($sp)         
    lw $ra, 20($sp)         
    addi $sp, $sp, 24       

    addi $t0, $0, 0         # delay to wait for previous progress
    jr $ra                  # return
    addi $t0, $0, 0         # delay to wait for previous progress

# 2. int Pass(int x)
Pass:
	addi $t0, $0, 60        # $t0 = 60
    slt $t1, $a0, $t0       # $t1 = x < 60
    beq $t1, $0, PassCntPP  # if ($t1 == 1) goto PassCntPP
    addi $v0, $0, 0         # $v0 = 0
    jr $ra                  # return
    addi $t0, $0, 0         # delay to wait for previous progress

PassCntPP:
	addi $v0, $0, 1         # $v0 = 1
    jr $ra                  # return
    addi $t0, $0, 0         # delay to wait for previous progress

# 3. int Fail(int x)
Fail:
	addi $t0, $0, 60        # $t0 = 60
    slt $t1, $a0, $t0       # $t1 = x < 60
    bne $t1, $0, FailCntPP  # if ($t1 != 1) goto FailCntPP
    addi $v0, $0, 0         # $v0 = 0
    jr $ra                  # return
    addi $t0, $0, 0         # delay to wait for previous progress

FailCntPP:
    addi $v0, $0, 1         # $v0 = 1
    jr $ra                  # return
    addi $t0, $0, 0         # delay to wait for previous progress


# ----------------- Exit() --------------------
exit:
	addi $v0, $0, 10
	syscall














