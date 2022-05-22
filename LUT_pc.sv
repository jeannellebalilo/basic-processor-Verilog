// Design Name:    CSE141L
// Module Name:    LUT_pc

// Lookup table for PC target
// leverage a few-bit pointer to a wider number
// Lookup table acts like a function: here Target = f(Addr);
// in general, Output = f(Input)

module LUT_pc(
  input        [ 3:0] Addr,            //Immediate to determine entry
  output logic [ 9:0] Target           //InstMem Address we want 
);

always_comb begin

  case(Addr)
    // These PC addresses depend on the program being run and are 
    // absolute jumps in Instruction Memory, not relative to curr PC
    4'b0000: Target = 10'd15; // #0 landing in the assembly (Program 1)
    4'b0001: Target = 10'd15; // #1 landing in the assembly (Program 2)
    4'b0010: Target = 10'd; // #2 landing in the assembly (Program 3)
    4'b0011: Target = 10'd19; // #3 landing in the assembly (Program 3)
    4'b0100: Target = 10'd; // #4 landing in the assembly (Program 2)
    4'b0101: Target = 10'h005; //The rest are unused in the three programs
    4'b0110: Target = 10'h006; 
    4'b0111: Target = 10'h007; 
    4'b1000: Target = 10'h008;
    4'b1001: Target = 10'h009;
    4'b1010: Target = 10'h00A;
    4'b1011: Target = 10'h00B; 
    4'b1100: Target = 10'h00C; 
    4'b1101: Target = 10'h00D; 
    4'b1110: Target = 10'h00E; 
    4'b1111: Target = 10'h00F; //These are temp Instr addresses
  endcase
end

endmodule
