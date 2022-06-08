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
                     BOLEn,
                     RegWrEn,  // write to reg_file (common)
                     MemWrEn,  // write to mem (store only)
                     ALUEn,    // using ALU
                     LUTdm,
                     LUT2x,
                     Jump,
                     SetInst,
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

// assign Opcode = {Instruction[8:5]};

// reserve instruction = 9'b111111111; for Ack
assign Ack = &Instruction;

// jump on right shift that generates a zero
// equiv to simply: assign Jump = Instruction[2:0] == RSH;
always_comb begin
  BranchEn = 0;
  BOLEn = 0;
  RegWrEn = 0;
  MemWrEn = 0;
  ALUEn = 0;
  LUTdm = 0;
  LUT2x = 0;
  Jump = 0;
  SetInst = 0;
  case (Instruction[8:5])
    LW: RegWrEn = 1;
    LWL: begin
      RegWrEn = 1;
      LUTdm = 1;
    end
    SW: begin
      MemWrEn = 1;
      LUTdm = 1;
    end
    SWL: MemWrEn = 1;
    XOR: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    ADD: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    LSR: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    LSL: begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    MOV: begin
      RegWrEn = 1;
      ALUEn = 1;
    end
    SNE: begin
      ALUEn = 1;
      RegWrEn = 1;
      Jump = 1;
      SetInst = 1;
    end
    SEQ: begin
      ALUEn = 1;
      RegWrEn = 1;
      Jump = 1;
      SetInst = 1;
    end
    BOO: BranchEn = 1;
    LUT: LUT2x = 1; 
    BOL: begin
      BranchEn = 1;
      BOLEn = 1;
    end
    MSK:begin
      ALUEn = 1;
      RegWrEn = 1;
    end
    default: begin
      BranchEn = 0;
      BOLEn = 0;
      RegWrEn = 0;
      MemWrEn = 0;
      ALUEn = 0;
      LUTdm = 0;
      LUT2x = 0;
      Jump = 0;
      SetInst = 0;
    end
  endcase
end

endmodule
