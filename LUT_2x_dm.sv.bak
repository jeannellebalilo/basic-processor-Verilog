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
  output logic [W-1:0] Target           //DataMem Address we want 
);

always_comb begin

  case(MuxReg)
    // The MuxReg is 0
    8'b00000000: begin
      case(EntryReg)
        // These are the DataMem addresses we want to save variables that require
        // more information to map (such as parity bit combinations)
        8'b00000000: Target = 8'b0; //The case where all are correct
        8'b00000001: Target = 8'b1101; //The rest are the case we can't correct the bits
        8'b00000010: Target = 8'b1101;
        8'b00000011: Target = 8'b1101;
        8'b00000100: Target = 8'b1101;
        8'b00000101: Target = 8'b1101;
        8'b00000110: Target = 8'b1101;
        8'b00000111: Target = 8'b1101;
        8'b00001000: Target = 8'b1101;
        8'b00001001: Target = 8'b1101;
        8'b00001010: Target = 8'b1101;
        8'b00001011: Target = 8'b1101;
        8'b00001100: Target = 8'b1101;
        8'b00001101: Target = 8'b1101;
        8'b00001110: Target = 8'b1101;
        8'b00001111: Target = 8'b1101;
      endcase
    end
    // The MuxReg is 1
    8'b00000001: begin
      case(EntryReg)
        8'b00000000: Target = 8'b1100; //The case where there is a parity error only
        8'b00000001: Target = 8'b1100; //The case where there is a parity error only
        8'b00000010: Target = 8'b1100; //The case where there is a parity error only
        8'b00000011: Target = 8'b1; //The case where bit 1 is wrong
        8'b00000100: Target = 8'b1100; //The case where there is a parity error only
        8'b00000101: Target = 8'b10; //The case where bit 2 is wrong
        8'b00000110: Target = 8'b11; //The case where bit 3 is wrong
        8'b00000111: Target = 8'b100; //The case where bit 4 is wrong
        8'b00001000: Target = 8'b1100; //The case where there is a parity error only
        8'b00001001: Target = 8'b101; //The case where bit 5 is wrong
        8'b00001010: Target = 8'b110; //The case where bit 6 is wrong
        8'b00001011: Target = 8'b111; //The case where bit 7 is wrong
        8'b00001100: Target = 8'b1000; //The case where bit 8 is wrong
        8'b00001101: Target = 8'b1001; //The case where bit 9 is wrong
        8'b00001110: Target = 8'b1010; //The case where bit 10 is wrong
        8'b00001111: Target = 8'b1011; //The case where bit 11 is wrong
      endcase
    end
  endcase
end

endmodule