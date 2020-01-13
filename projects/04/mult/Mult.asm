// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

  @i
  M=0 // i=0
  @R2
  M=0 // R2=0

(LOOP)

  @R1
  D=M // D=R1
  @i
  D=D-M // D = D-i = R1-i

  @END
  D;JLE // end loop if i >= R1

  @R0
  D=M // D=R0
  @R2
  M=D+M // R2 = R2+D = R2+R0

  @i
  M=M+1 // i++

  @LOOP
  0;JMP

(END)
  @END
  0;JMP