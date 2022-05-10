// Design Name:    CSE141L
// Module Name:    LUT_2x_dm.sv

// 2 LUTs to access data memory 
// NOTE: LUTS can also hold the values we want themselves, instead
// of the addresses where we save the values we want, if we populate them
// with a text file specific to each program
//
// leverage a few-bit pointer to a wider number
// Lookup table acts like a function: here Target = f(Addr);
// in general, Output = f(Input)

//   W = data path width   
module LUT_2x_dm #(parameter W=8)(
  input        [W-1:0] EntryReg,       //Register holding a value 0-15
  input        [W-1:0] MuxReg,         //Register acting as mux
  output logic [ 9:0] Target           //DataMem Address we want 
);

always_comb begin

  case(MuxReg)
    // The MuxReg is 0
    8'b00000000: begin
      case(EntryReg)
        // These are the DataMem addresses we want to save variables that require
        // more information to map (such as parity bit combinations)
        8'b00000000: Target = 10'd72;
        8'b00000001: Target = 10'd73;
        8'b00000010: Target = 10'd74;
        8'b00000011: Target = 10'd75;
        8'b00000100: Target = 10'd76;
        8'b00000101: Target = 10'd77;
        8'b00000110: Target = 10'd78;
        8'b00000111: Target = 10'd79;
        8'b00001000: Target = 10'd80;
        8'b00001001: Target = 10'd81;
        8'b00001010: Target = 10'd82;
        8'b00001011: Target = 10'd83;
        8'b00001100: Target = 10'd84;
        8'b00001101: Target = 10'd85;
        8'b00001110: Target = 10'd86;
        8'b00001111: Target = 10'd87;
      endcase
    end
    // The MuxReg is 1
    8'b00000001: begin
      case(EntryReg)
        8'b00000000: Target = 10'd88;
        8'b00000001: Target = 10'd89;
        8'b00000010: Target = 10'd90;
        8'b00000011: Target = 10'd91;
        8'b00000100: Target = 10'd92;
        8'b00000101: Target = 10'd93;
        8'b00000110: Target = 10'd94;
        8'b00000111: Target = 10'd95;
        8'b00001000: Target = 10'd96;
        8'b00001001: Target = 10'd97;
        8'b00001010: Target = 10'd98;
        8'b00001011: Target = 10'd99;
        8'b00001100: Target = 10'd100;
        8'b00001101: Target = 10'd101;
        8'b00001110: Target = 10'd102;
        8'b00001111: Target = 10'd103;
      endcase
    end
  endcase
end

endmodule