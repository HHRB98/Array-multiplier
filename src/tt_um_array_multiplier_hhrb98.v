module FA(a, b, c, s, ca);
  // Inputs
  input a, b, c;
  // Outputs
  output s, ca;

  // Full adder assignments
  assign s = (a ^ b ^ c);
  assign ca = ((a & b) | (b & c) | (c & a));
endmodule

module tt_um_array_multiplier_hhrb98 (
    input  wire [7:0] ui_in,     // Dedicated inputs
    output wire [7:0] uo_out,    // Dedicated outputs
    input  wire [7:0] uio_in,    // IOs: Input path
    output wire [7:0] uio_out,   // IOs: Output path
    output wire [7:0] uio_oe,    // IOs: Enable path (active high: 0=input, 1=output)
    input wire        clk,
    input  wire       ena,       // will go high when the design is enabled
    input  wire       rst_n      // reset_n - low to reset
);

  // Inputs wire
  wire [3:0] a, b;
  // Outputs wire
  wire [7:0] p;

  // Extracting bits from input
  assign a = ui_in[3:0];
  assign b = ui_in[7:4];

  // Intermediate wires
  wire [7:0] p0, p1, p2, p3;

  // Partial product calculation
  assign p0 = a[0] & b;
  assign p1 = a[1] & b;
  assign p2 = a[2] & b;
  assign p3 = a[3] & b;

  // Full adders for summing partial products
  FA fa0(.a(p0), .b(0), .c(0), .s(p[0]), .ca(p0));
  FA fa1(.a(p1), .b(p0), .c(0), .s(p[1]), .ca(p1));
  FA fa2(.a(p2), .b(p1), .c(0), .s(p[2]), .ca(p2));
  FA fa3(.a(p3), .b(p2), .c(0), .s(p[3]), .ca(p3));

  // Assigning the remaining bits of the product
  assign p[4:7] = 0;

  // Assigning the output
  assign uo_out = p;

  // Assigning the output enable
  assign uio_oe = 1;

  // Assigning the input/output path
  assign uio_out = uio_in;

endmodule
