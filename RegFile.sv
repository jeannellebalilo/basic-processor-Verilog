// Create Date:    2019.01.25
// Last Update:    2022.01.13
// Design Name:    CSE141L
// Module Name:    reg_file 
//
// Additional Comments: 					  $clog2

// n.b. parameters are compile time directives this can be an any-width,
// any-depth `reg_file`: just override the params!
//   W = data path width          <-- [WI22 Requirement: max(W)=8]
//   A = address pointer width    <-- [WI22 Requirement: max(A)=4]
module RegFile #(parameter W=8, A=2)(
  input                Clk,
  input                Reset,
  input                WriteEn,
  input        [A-1:0] RaddrA,    // address pointers
  input        [A-1:0] RaddrB,    // address pointers
  input        [A-1:0] Waddr,     // address pointers
  input        [W-1:0] DataIn,    // data for registers
  output       [W-1:0] DataOutA,  //   showing two different ways to handle
  output logic [W-1:0] DataOutB   //   DataOutX, for pedagogic reasons only
);


// W bits wide [W-1:0] and 2**A registers deep
// NOTE: we have 4 registers
//   When W=8 bit wide registers and A=4 to address 16 registers
//   then this could be written `logic [7:0] registers[16]`
logic [W-1:0] Registers[2**A];


// combinational reads
//
// This is ARM-style registers (i.e. r0 is general purpose)
assign      DataOutA = Registers[RaddrA];
assign      DataOutB = Registers[RaddrB];

// sequential (clocked) writes
//
// Works just like data_memory writes
always_ff @ (posedge Clk) begin
  integer i;
  if (Reset) begin
    for (i=0; i<2**A; i=i+1) begin
      Registers[i] <= '0;
    end
  end else if (WriteEn) begin
    Registers[Waddr] <= DataIn;
  end
end


endmodule
