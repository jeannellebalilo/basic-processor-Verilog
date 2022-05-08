// Project Name:   CSE141L
// Module Name:    Ctrl
// Create Date:    ?
// Last Update:    2022.01.13

// control decoder (combinational, not clocked)
// inputs from ... [instrROM, ALU flags, ?]
// outputs to ...  [program_counter (fetch unit), ?]
import Definitions::*;

// n.b. This is an example / starter block
//      Your processor **will be different**!
module Ctrl (
  input  [8:0] Instruction,    // machine code
                               // some designs use ALU inputs here
  output logic       BranchEn, // branch at all?
                     RegWrEn,  // write to reg_file (common)
                     MemWrEn,  // write to mem (store only)
                     ALUEn,    // using ALU
                     Ack      // "done with program"
);

// What follows is instruction decoding.
// This codifies much of your ISA definition!
//
// Note: This **starter code** is not a complete ISA!

/*
OPCODES
lw -  0000  lwl - 0001
sw -  0010  swl - 0011
xor - 0100  add - 0101
lsr - 0110  lsl - 0111
mov - 1000
sne - 1001  seq - 1010
boo - 1011  lut - 1100
bol - 1101  msk - 1110
*/

assign Opcode = Instruction[8:5];

// reserve instruction = 9'b111111111; for Ack
assign Ack = &Instruction;

// jump on right shift that generates a zero
// equiv to simply: assign Jump = Instruction[2:0] == RSH;
always_comb begin
  BranchEn = 0;
  RegWrEn = 0;
  MemWrEn = 0;
  ALUEn = 0;
  case (Opcode)
    0000: RegWrEn = 1;
    0001: RegWrEn = 1;
    0010: MemWrEn = 1;
    0011: MemWrEn = 1;
    0100: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    0101: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    0110: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    0111: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    1000: RegWrEn = 1;
    1001: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    1010: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    1011: BranchEn = 1;
    // 1100: 
    1101: BranchEn = 1;
    1110:begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    default: begin
      RegWrEn = 0;
      BranchEn = 0;
      ALUEn = 0;
      MemWrEn = 0;
    end
  endcase
end

endmodule
