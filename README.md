# CompE-475---Microprocessors

- Single Cycle

We were tasked to design a single-cycle microarchetecture, that can execute one instruction per clock cycle. In this assignment, we observed that the slowest instructions limits the cycle time. The single-cycle consist of parametric modules such as: Program Counter (PC), Adders, Register File (RF), Instruction Memory (IM), etc.. The RF is suppose to be in read-first only mode, and is able to execute a MIPS program that we design. 








# MIPS INSTRUCTIONS 
(a) MIPS program with load word instructions only 
LW $t0 0($0) 
LW $t1 1($0) 
LW $t2 2($0) 
LW $t3 3($0) 
LW $t4 4($0) 
 
(b) MIPS program with load word and store word instructions only  
LW $t0 0($0) 
LW $t1 1($0) 
LW $t2 2($0) 
LW $t3 3($0) 
LW $t4 4($0) 
SW $t0 31($0) 
SW $t1 32($0) 
SW $t2 33($0) 
SW $t3 34($0) 
SW $t4 35($0) 
 
(c) MIPS program with LW, SW and R-Type instructions only 
LW $t0 0($0) 
LW $t1 1($0) 
LW $t2 2($0) 
LW $t3 3($0) 
LW $t4 4($0) 
ADD $s0, $t0, $t4 
SUB $s1, $s0, $t4 
ADD $s2, $t2, $s1 
SLL $s3, $s2, 4 
SW $s0 32($0) 
SW $s1 -1($s3) 

(d) MIPS program with LW, SW, R-Type and I-Type instructions only 
ADDI $t5, $0, 5 
ADDI $t6, $t5, -3 
LW $t0 0($0) 
LW $t1 1($0) 
LW $t2 2($0) 
LW $t3 3($0) 
LW $t4 4($0) 
ADD $s0, $t0, $t4 
SUB $s1, $s0, $t4 
ADD $s2, $t2, $s1 
SLLV $s3, $s2, $t5 
SRAV $s4, $s2, $t6 
SW $s0, 32($0) 
SW $s1, 0($s3) 
SW $s1, 0($s4) 
 
(e) MIPS program with aLL instruction types, including Branch/Jump 
ADDI $s0, $0, 0 
ADDI $s1, $0, 5 
ADDI $s2, $0, 1 
ADD $t3, $0, $0 
loop: BEQ $s0, $s1, done 
LW $t0, 0($s0) 
SLLV $t0, $t0, $s1 
SW $t0, 31($s0) 
ADD $s0, $s2, $s0 
ADD $t3, $t3, $t0 
J loop 
done: NOP 
NOP 

The data memory should be loaded with the following values (for all parts (a)-(e) above): 
17 
31 
-5 
-2 
250 
