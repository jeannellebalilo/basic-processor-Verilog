// Design Name:    CSE141L
// Module Name:    LUT_dm.sv

// possible lookup table for DataMem target
// leverage a few-bit pointer to a wider number
// Lookup table acts like a function: here Target = f(Addr);
// in general, Output = f(Input)
//
// Lots of potential applications of LUTs!!

// You might consider parameterizing this!
module LUT(
  input        [ 1:0] Addr,
  output logic [ 9:0] Target
);

always_comb begin

  case(Addr)
    // TODO: figure out the DataMem addresses we need!
    2'b00: Target = 8'b0;
    2'b01: Target = 8'b0;
    2'b10: Target = 8'b0;
    2'b11: Target = 8'b0;
  endcase
end

endmodule