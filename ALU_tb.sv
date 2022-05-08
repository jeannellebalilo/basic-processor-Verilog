`timescale 1ns/ 1ps

// Test bench
// Arithmetic Logic Unit

//
// INPUT: A, B
// op: 000, A ADD B
// op: 100, A_AND B
// ...
// Please refer to definitions.sv for support ops (make changes if necessary)
// OUTPUT A op B
// equal: is A == B?
// even: is the output even?
//

module ALU_tb;

// Define signals to interface with the ALU module
logic [ 7:0] INPUTA;  // data inputs
logic [ 7:0] INPUTB;
logic [ 2:0] op;      // ALU opcode, part of microcode
bit SC_IN = 'b0;
wire[ 7:0] OUT;
wire Zero;

// Define a helper wire for comparison
logic [ 7:0] expected;

// Instatiate and connect the Unit Under Test
ALU uut(
  .InputA(INPUTA),
  .InputB(INPUTB),
  .SC_in(SC_IN),
  .OP(op),
  .Out(OUT),
  .Zero(Zero)
);


// The actual testbench logic
initial begin
  INPUTA = 1;
  INPUTB = 1;
  op= 'b000; // ADD
  test_alu_func; // void function call
  #5;

  INPUTA = 4;
  INPUTB = 1;
  op= 'b001; // LSL
  test_alu_func; // void function call
  #5;

  INPUTA = 4;
  INPUTB = 1;
  op= 'b010; // LSR
  test_alu_func;

  INPUTA = 2;
  INPUTB = 6;
  op= 'b011; // XOR
  test_alu_func;

  INPUTA = 0;
  INPUTB = 1;
  op= 'b100; // SNE
  test_alu_func;

  INPUTA = 5;
  INPUTB = 5;
  op= 'b101; // SEQ
  test_alu_func;

  INPUTA = 7;
  INPUTB = 2;
  op= 'b110;  // MSK
  test_alu_func;
end

task test_alu_func;
  case (op)
    0: expected = INPUTA + INPUTB;      // ADD
    1: expected = {INPUTA[6:0], SC_IN}; // LSL
    2: expected = {1'b0, INPUTA[7:1]};  // LSR
    3: expected = INPUTA ^ INPUTB;      // XOR
    4: expected = 1;                     // SNE
    5: expected = 1;                     // SEQ
    6: expected = 4;                     // MSK
  endcase
  #1;
  if(expected == OUT) begin
    $display("%t YAY!! inputs = %h %h, opcode = %b, Zero %b",$time, INPUTA,INPUTB,op, Zero);
  end else begin
    $display("%t FAIL! inputs = %h %h, opcode = %b, zero %b",$time, INPUTA,INPUTB,op, Zero);
  end
endtask

initial begin
  $dumpfile("alu.vcd");
  $dumpvars();
  $dumplimit(104857600); // 2**20*100 = 100 MB, plenty.
end

endmodule
