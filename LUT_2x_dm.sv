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
        8'b00000000: Target = 10'd0; //The case where all are correct
        8'b00000001: Target = 10'd13; //The rest are the case we can't correct the bits
        8'b00000010: Target = 10'd13;
        8'b00000011: Target = 10'd13;
        8'b00000100: Target = 10'd13;
        8'b00000101: Target = 10'd13;
        8'b00000110: Target = 10'd13;
        8'b00000111: Target = 10'd13;
        8'b00001000: Target = 10'd13;
        8'b00001001: Target = 10'd13;
        8'b00001010: Target = 10'd13;
        8'b00001011: Target = 10'd13;
        8'b00001100: Target = 10'd13;
        8'b00001101: Target = 10'd13;
        8'b00001110: Target = 10'd13;
        8'b00001111: Target = 10'd13;
      endcase
    end
    // The MuxReg is 1
    8'b00000001: begin
      case(EntryReg)
        8'b00000000: Target = 10'd12; //The case where there is a parity error only
        8'b00000001: Target = 10'd12; //The case where there is a parity error only
        8'b00000010: Target = 10'd12; //The case where there is a parity error only
        8'b00000011: Target = 10'd1; //The case where bit 1 is wrong
        8'b00000100: Target = 10'd12; //The case where there is a parity error only
        8'b00000101: Target = 10'd2; //The case where bit 2 is wrong
        8'b00000110: Target = 10'd3; //The case where bit 3 is wrong
        8'b00000111: Target = 10'd4; //The case where bit 4 is wrong
        8'b00001000: Target = 10'd12; //The case where there is a parity error only
        8'b00001001: Target = 10'd5; //The case where bit 5 is wrong
        8'b00001010: Target = 10'd6; //The case where bit 6 is wrong
        8'b00001011: Target = 10'd7; //The case where bit 7 is wrong
        8'b00001100: Target = 10'd8; //The case where bit 8 is wrong
        8'b00001101: Target = 10'd9; //The case where bit 9 is wrong
        8'b00001110: Target = 10'd10; //The case where bit 10 is wrong
        8'b00001111: Target = 10'd11; //The case where bit 11 is wrong
      endcase
    end
  endcase
end

endmodule