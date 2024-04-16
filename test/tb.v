`default_nettype none `timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [3:0] a;
  reg [3:0] b;
  reg [7:0] p;
 
  // Replace tt_um_example with your module name:
  tt_um_array_multiplier_hhrb98 (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .a  (a),    // Dedicated inputs
      .b (b),   // Dedicated outputs
      .p (p),   // IOs: Input path
      .clk    (clk),      // clock
      
  );
endmodule
