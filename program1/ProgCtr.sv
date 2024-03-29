// Project Name:   CSE141L
// Module Name:    ProgCtr
// Description:    instruction fetch (pgm ctr) for processor
//
// Revision:       2019.01.27
// Last Update:    2022.01.13

// These are **examples** of signals in some processor designs.
// In particular, your branch and target logic may vary.
//
// Parameters:
//  A: Number of address bits in instruction memory
module ProgCtr #(parameter A=10)(
  input                Reset,       // reset, init, etc. -- force PC to 0
                       Start,       // begin next program in series (request issued by test bench)
                       Clk,         // PC can change on pos. edges only
                       Branch,
                       Bol,
  input        [7:0]   SET_flag,    // flag from ALU, e.g. Zero, Carry, Overflow, Negative (from ARM)
  input        [A-1:0] Target,      // jump ... "how high?"
  input        [4:0]   Immediate, 
  output logic [A-1:0] ProgCtr      // the program counter register itself
);


logic [1:0] StartCount;
logic start_r;

// program counter can clear to 0, increment, or jump
always_ff @(posedge Clk) begin
  if(Reset)
    ProgCtr <= 0;                  // for first program; want different value for 2nd or 3rd
  else if(Branch & (SET_flag == 1)) begin
    if (Bol)
      ProgCtr <= Target;
    else
      ProgCtr <= ProgCtr + (Immediate+1);
  end else
    ProgCtr <= ProgCtr+'b1;        // default increment (no need for ARM/MIPS +4 -- why?)

  // Note about Start:
  //
  // If your programs are spread out, with a gap in your machine code listing,
  // you will want to make Start cause an appropriate jump.
  //
  // If your programs are packed sequentially, such that program 2 begins right
  // after Program 1 ends, then you won't need to do anything special here.

  // Handle the Start signal by overriding normal behavior
  if (Reset) begin
    StartCount <= '0;
    start_r <= '0;
  end else begin
    start_r <= Start;
    // Detect rising edge of Start
    if ((start_r == '0) && (Start == '1)) begin
      StartCount <= StartCount + 1'b1;
    end
    // Detect falling edge of Start
    if ((start_r == '1) && (Start == '0)) begin
      case (StartCount)
        1: ProgCtr <= 'd000;
        2: ProgCtr <= 'd100;
        3: ProgCtr <= 'd200;
        default: ProgCtr <= ProgCtr;
      endcase
    end
    // And generally, don't let things go anywhere until first Start
    if (StartCount == '0)
      ProgCtr <= ProgCtr;
  end
end

endmodule
