// Create Date:   2017.01.25
// Design Name:   TopLevel Test Bench
// Module Name:   TopLevel_tb.v
// CSE141L

// This is NOT synthesizable; use for logic simulation only
// Verilog Test Fixture created for module: TopLevel

module TopLevel_tb;

// This defines what `#1` means, so later, when the clock is
// up wait `#5` then down wait `#5` we make a 100 MHz clock.
timeunit 1ns;
// This defines the precision of delays in the simulation.
// Convention is for this to be three orders of magnitude
// more precise unless you have a reason for it to be
// something else.
timeprecision 1ps;

// To DUT Inputs
bit Reset = 1'b1;
bit Req;
bit Clk;

// From DUT Outputs
wire Ack;              // done flag

// Instantiate the Device Under Test (DUT)
TopLevel DUT (
  .Reset  (Reset),
  .Start  (Req ),
  .Clk    (Clk ),
  .Ack    (Ack )
);

// This is the important part of the testbench, where logic might be added
initial begin
  #10 $displayh(DUT.DM1.Core[0],
                DUT.DM1.Core[1],"_",
                DUT.DM1.Core[2],
                DUT.DM1.Core[3]);
  #10 Reset = 'b0;
  #10 Req   = 'b1;

  // TODO: fill in the memory locations here
  //DUT.DM1.Core[64] = '1;
  //DUT.DM1.Core[0] = 8'b1000;
  DUT.DM1.Core[4] = 'b11011001;
  DUT.DM1.Core[5] = 'b00000101;
  DUT.DM1.Core[2] = 'b10011111;
  DUT.DM1.Core[3] = 'b00000111;
  DUT.DM1.Core[0] = 'b11010000;
  DUT.DM1.Core[1] = 'b00000101;
  
  /*DUT.DM1.Core[2] = 'b01010101;
  DUT.DM1.Core[3] = 'b00000101;
  DUT.DM1.Core[4] = 'b01010101;
  DUT.DM1.Core[5] = 'b00000101;
  DUT.DM1.Core[6] = 'b01010101;
  DUT.DM1.Core[7] = 'b00000101;
  DUT.DM1.Core[8] = 'b01010101;
  DUT.DM1.Core[9] = 'b00000101;
  DUT.DM1.Core[10] = 'b01010101;
  DUT.DM1.Core[11] = 'b00000101;
  DUT.DM1.Core[12] = 'b01010101;
  DUT.DM1.Core[13] = 'b00000101;
  DUT.DM1.Core[14] = 'b01010101;
  DUT.DM1.Core[15] = 'b00000101;
  DUT.DM1.Core[16] = 'b01010101;
  DUT.DM1.Core[17] = 'b00000101;
  DUT.DM1.Core[18] = 'b01010101;
  DUT.DM1.Core[19] = 'b00000101;
  DUT.DM1.Core[20] = 'b01010101;
  DUT.DM1.Core[21] = 'b00000101;
  DUT.DM1.Core[22] = 'b01010101;
  DUT.DM1.Core[23] = 'b00000101;
  DUT.DM1.Core[24] = 'b01010101;
  DUT.DM1.Core[25] = 'b00000101;
  DUT.DM1.Core[26] = 'b01010101;
  DUT.DM1.Core[27] = 'b00000101;
  DUT.DM1.Core[28] = 'b01010101;
  DUT.DM1.Core[29] = 'b00000101;*/
  // launch program in DUT
  #10 Req = 0;

  // Wait for done flag, then display results
  wait (Ack);
  #10 $display("------------------------------------------");

  if (DUT.DM1.Core[59] != 'b10101010) begin
    $display("ERROR, mem[59] should be %b", 'b10101010);
  end

  #10 $displayh(DUT.DM1.Core[0],
                DUT.DM1.Core[1],"_",
                DUT.DM1.Core[2],
                DUT.DM1.Core[3]);
      $display("last instruction = %d || sim time %t",DUT.PC1.ProgCtr,$time);

  // Note: $stop acts like a breakpoint, pausing the simulation
  // and allowing certain tools to interact with it more, in
  // contrast to $finish, which ends the simulation.

  #10 $stop;
end

// This generates the system clock
always begin   // clock period = 10 Verilog time units
  #5 Clk = 1'b1;
  #5 Clk = 1'b0;
end



endmodule

