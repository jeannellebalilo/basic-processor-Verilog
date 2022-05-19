// Design Name:    CSE141L
// Module Name:    LUT_dm.sv

// possible lookup table for DataMem target
// leverage a few-bit pointer to a wider number
// Lookup table acts like a function: here Target = f(Addr);
// in general, Output = f(Input)
//
// Lots of potential applications of LUTs!!

// You might consider parameterizing this!
module LUT_dm(
  input        [ 2:0] Addr,            //Immediate to determine entry
  output logic [ 9:0] Target           //DataMem Address we want 
);

always_comb begin

  case(Addr)
    // These are the DataMem addresses we want to store the most
    // used temporary variables
    3'b000: Target = 10'd64;
    3'b001: Target = 10'd65;
    3'b010: Target = 10'd66;
    3'b011: Target = 10'd67;
    3'b100: Target = 10'd68;
    3'b101: Target = 10'd69;
    3'b110: Target = 10'd70;
    3'b111: Target = 10'd71;
  endcase
end

endmodule