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

  @last // the last colour filled
  M=0

  @next // the color to be filled next
  M=0

(MAIN_LOOP)

  @KBD
  D=M // D = value at keyboard in memory

  @KEYDOWN // go to keydown handler
  D;JNE

  @KEYUP // go to keyup handler
  D;JEQ

  (KEYDOWN)
    @next
    M=-1 // set next color to black
    @CHECK_FOR_CHANGE
    0;JMP

  (KEYUP)
    @next
    M=0 // set next color to white
    @CHECK_FOR_CHANGE
    0;JMP

  (CHECK_FOR_CHANGE)
    @next
    D=M // D = next color
    @last
    D=M-D // D = last color - next color
    @MAIN_LOOP
    D;JEQ // color hasn't changed: do nothing
    @FILL
    D;JNE // color has changed: fill screen
  
(FILL) 
  // init i to address of first word of pixels
  @SCREEN
  D=A
  @i
  M=D

  (FILL_LOOP)
    @next
    D=M // d = color to paint
  
    @i
    A=M // set A to address of current word
    M=D // paint that word

    @i
    M=M+1 // increment i
    
    D=M // D = i
    // check condition: i < 24576
    @24576
    D=D-A
    @FILL_LOOP
    D;JLT // continue if i >= 24576

    @next
    D=M
    @last
    M=D
    
    @MAIN_LOOP
    0;JMP
