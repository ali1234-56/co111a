// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//一個乘數用來做加法，另一個乘數用來做循環

//16384到24575 為螢幕
//24576為鍵盤

	@8192 
	D=A
	@0
	M=D  //R20存入控制螢幕初始值
	@24576
	D=M 
	@18
	D;JNE 
	@0 
	D=M 
	M=M-1 //反黑指令
	@0
	D;JEQ 
	@16383
	A=D+A 
	M=0 
	@8
	0;JMP 
	@0 
	D=M
	M=M-1
	@0
	D;JEQ
	@24576
	A=A-D 
	M=-1 
	@18
	0;JMP //回到主迴圈指令1
	