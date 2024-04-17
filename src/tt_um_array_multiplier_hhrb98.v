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
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input wire        clk,
    //input  wire       ena,      /* verilator lint_off UNUSEDSIGNAL */
    input  wire       rst_n     
  );
  // Wires
 
// Wires for other signals
wire [7:0] uio_out_wire;

// Assign uio_out_wire to uio_out
assign uio_out = uio_out_wire;

// Always block to control uio_out_wire
always @(posedge clk or negedge rst_n) begin  
    if (~rst_n) begin
        // Reset condition: set uio_out_wire to 0
        uio_out_wire <= 8'b0;
    end else begin
        // Update uio_out_wire with uio_in value
        uio_out_wire <= uio_in;
    end
end

  assign uio_oe =8'b0;
  wire [39:0] w;
  // AND gate instantiations
  and a1(w[0], ui_in[0], ui_in[4]);
  and a2(w[1], ui_in[1], ui_in[4]);
  and a3(w[2], ui_in[2], ui_in[4]);
  and a4(w[3], ui_in[3], ui_in[4]);

  and a5(w[4], ui_in[0], ui_in[5]);
  and a6(w[5], ui_in[1], ui_in[5]);
  and a7(w[6], ui_in[2], ui_in[5]);
  and a8(w[7], ui_in[3], ui_in[5]);

  and a9(w[8], ui_in[0], ui_in[6]);
  and a10(w[9], ui_in[1], ui_in[6]);
  and a11(w[10], ui_in[2], ui_in[6]);
  and a12(w[11], ui_in[3], ui_in[6]);

  and a13(w[12], ui_in[0], ui_in[7]);
  and a14(w[13], ui_in[1], ui_in[7]);
  and a15(w[14], ui_in[2], ui_in[7]);
  and a16(w[15], ui_in[3], ui_in[7]);

  assign uo_out[0] = w[0];

  // Full adders instantiations
  FA a17(1'b0, w[1], w[4], w[16], w[17]);
  FA a18(1'b0, w[2], w[5], w[18], w[19]);
  FA a19(1'b0, w[3], w[6], w[20], w[21]);

  FA a20(w[8], w[17], w[18], w[22], w[23]);
  FA a21(w[9], w[19], w[20], w[24], w[25]);
  FA a22(w[10], w[7], w[21], w[26], w[27]);

  FA a23(w[12], w[23], w[24], w[28], w[29]);
  FA a24(w[13], w[25], w[26], w[30], w[31]);
  FA a25(w[14], w[11], w[27], w[32], w[33]);

  FA a26(1'b0, w[29], w[30], w[34], w[35]);
  FA a27(w[31], w[32], w[35], w[36], w[37]);
  FA a28(w[15], w[33], w[37], w[38], w[39]);

  // Output assignments
  assign uo_out[1] = w[16];
  assign uo_out[2] = w[22];
  assign uo_out[3] = w[28];
  assign uo_out[4] = w[34];
  assign uo_out[5] = w[36];
  assign uo_out[6] = w[38];
  assign uo_out[7] = w[39];

endmodule
