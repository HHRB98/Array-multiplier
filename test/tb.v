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
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;
 
// Replace tt_um_example with your module name:
tt_um_array_multiplier_hhrb98 user_project (
    // Include power ports for the Gate Level test:
    .VPWR(1'b1),
    .VGND(1'b0),
    .a(ui_in),    // Connect ui_in directly to module's a
    .b(uio_in),   // Connect uio_in directly to module's b
    .clk(clk),    // Connect clk directly to module's clk
    .ena(ena),    // Connect ena directly to module's ena
    .rst_n(rst_n),// Connect rst_n directly to module's rst_n
    .p(uo_out)    // Connect uo_out directly to module's p
);
endmodule
