// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//這個程序整體是一個循環，循環中首先判斷當前鍵盤有沒有輸入值，根據輸入值的情況運行填充屏幕還是清空屏幕的代碼。

@0
D=A
@R2
M=D 

@R0
D=M
@exit1
D; JLE


@R1
D=M 
@R2
M=D+M

@R0
M=M-1

@loop
0;JMP

@exit1
0;JMP