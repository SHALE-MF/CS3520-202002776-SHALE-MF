
#reversing number

li $a1, 1234       # $a1 contains input number

     xor $a2, $a2, $a2  # $a2 will hold reverse integer
     li $t1, 10
     beqz $a1, end
loop:
     divu $a1, $t1      # Divide number by 10
     mflo $a1           # $a1 = quotient
     mfhi $t2           # $t2 = reminder
     mul $a2, $a2, $t1  # reverse=reverse*10
     addu $a2, $a2, $t2 #         + reminder    
     bgtz $a1, loop
end: 
     j end              # Here $a2 contains the reversed integer
	 

#prime number checker	 
	 
.data 
    userInput: .asciiz "give an integer to check if prime: "
    prime: .asciiz "Prime"
    notPrime: .asciiz "No prime"
.text
    main:
        li $v0, 4
        la $a0, userInput
        syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    addi $t1, $t1, 1
    addi $t2, $t2, 2
    ble $t0, $t1, no
    beq $t0, $t2, yes
    div $t0, $t2
    mflo $s0
    mfhi $s1
    bgt $s1, $zero, yes
yes:
    li $v0, 4
    la $a0, prime
    syscall
    j exit
no:
    li $v0, 4
    la $a0, notPrime
    syscall
    j exit
exit:
    li $v0, 10
    syscall
	
#palindrome checker
	
	.data

org_str: .space 256
rev_str: .space 256
str: .asciiz "Enter the Line: "
pal: .asciiz "palindrome"
not_pali: .asciiz "Not palindrome"

.text 
.globl main
main:
    
    
    li $v0, 4
    la $a0, str
    syscall
    
    # Taking String from the user
    li $v0, 8
    la $a0, org_str
    li $a1, 256
    syscall
    
    # Initilize $t0 and $t2
    li  $t0, 0
    li  $t1, 0
    
loop_len:
    add $t1, $a0, $t0
    lb  $t2, 0($t1) # Load the data in the byte in $t2
    beqz    $t2, len_exit   # Loop till $t2 reaches zero
    addiu   $t0, $t0, 1 # increment of the counter
    j   loop_len
len_exit:

    #Return $t0 to the last Charater
    subi $t0, $t0, 1
    li $s0, 0   # Initialize variable
    addi $s0, $t0, 0    # Save the length of the String
    
    # Load the original string in $t2
    la $t2, org_str
    
    # Intialize i and j
    li $t1, 0   # i 
    li $t3, 0   # j
    
reverse_loop:
    add $t3, $t2, $t0   # $t2 is the base address
    lb $t4, 0($t3)      # load a byte
    beqz $t4, exit      # go to the exit if null was found
    sb $t4, rev_str($t1)    # Overwrite the byte
    addi $t0, $t0, -1   # decrement of j by 1 (j--)
    addi $t1, $t1, 1    # increment of i by one (i++)
    j reverse_loop      # Loop until we reach the length of the String
exit:
    
    li $t0, 0
    li $t4, 0
    li $t7, 0
    
CheckChar_loop:
    
    lb $t4, org_str($t0)
    lb $t7, rev_str($t0)
    
    beq $t4, $zero, exit_1  # go to the exit if null was found
    bne $t4, $t7, not_pal   # if $t7 and $t4 not equal
    addi $t0, $t0, 1    # increment of i by 1 (i++)
    j CheckChar_loop
exit_1:

    #li $v0, 1
    #addi $a0, $t0, 0
    #syscall

    li $v0, 4
    la $a0, pal
    syscall

    #Exit the program
    li $v0, 10
    syscall
    
not_pal:
    
    #li $v0, 1
    #addi $a0, $t0, 0
    #syscall
    
    li $v0, 4
    la $a0, not_pali
    syscall
    
    
    #Exit the program
    li $v0, 10
    syscall
    
.end main

	
	
	
	
	
	
	