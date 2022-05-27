// Module Name:    ALU
// Project Name:   CSE141L
//
// Additional Comments:
//   combinational (unclocked) ALU

// includes package "Definitions"
import Definitions::*;

module ALU #(parameter W=8, Ops=4)(
  input        [W-1:0]   InputA,       // data inputs
                         InputB,
  input        [4:0]     Immediate,    // 5-bit immediate
  input        [Ops-1:0] OP,           // ALU opcode, part of microcode
  input                  SC_in,        // shift or carry in
  output logic [W-1:0]   Out,          // data output
  output logic           Zero,         // output = zero flag    !(Out)
                         Parity,       // outparity flag        ^(Out)
                         Odd           // output odd flag        (Out[0])
                         // you may provide additional status flags, if desired
);

// type enum: used for convenient waveform viewing
op_mne op_mnemonic;
assign difference = InputA - Immediate;
assign mask = 8'b1;
assign loop = Immediate[2:0];   // 3-bit immediate
always_comb begin
  // No Op = default
  Out = 0;

  case(OP)
    ADD : Out = InputA + loop;        // add with 3-bit immediate

    // lsl will loop, inserting 0's on the right for '3-bit immediate' amount of times
    LSL : begin
      Out = InputA;
      repeat (loop) begin
        Out = {Out[6:0], 1'b0};
      end
    end

    // lsr will loop, inserting 0's on the left for '3-bit immediate' amount of times
    LSR : begin
      Out = InputA;
      repeat (loop) begin
        Out = {1'b0, Out[7:1]};
      end
    end
    XOR : Out = InputA ^ InputB;        // bitwise exclusive OR

    SNE : begin
      if (difference != 0) begin
        Out = 1'b1;
      end
      else begin
        Out = 1'b0;
      end
    end
    MOV : Out = InputB;
    SEQ : begin
      if (difference == 0) begin
        Out = 1'b1;
      end
      else begin
        Out = 1'b0;
      end
    end

    MSK : begin
      // if InputB = 6, we want the output to look like 0X00_0000
      Out = mask;
      repeat (InputB) begin
        Out = {Out[6:0], 1'b0};
      end
    end
    default : Out = 8'bxxxx_xxxx;       // Quickly flag illegal ALU
  endcase
end

assign Zero   = ~|Out;                  // reduction NOR
assign Parity = ^Out;                   // reduction XOR
assign Odd    = Out[0];                 // odd/even -- just the value of the LSB

// Toolchain guard: icarus verilog doesn't support this debug feature.
`ifndef __ICARUS__
always_comb
  op_mnemonic = op_mne'(OP);            // displays operation name in waveform viewer
`endif

endmodule
