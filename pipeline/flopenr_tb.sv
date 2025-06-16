`timescale 1ns/1ps
module flopenr_tb;
  reg clk;
  reg reset;
  reg en;
  reg [31:0] d;
  wire [31:0] q;

  flopenr #(.WIDTH(32)) uut (
    .clk(clk),
    .reset(reset),
    .en(en),
    .d(d),
    .q(q)
  );

  initial begin
    $dumpfile("flopenr_tb.vcd");
    $dumpvars(0, tb_flopenr);

    clk = 0;
    reset = 1;
    en = 0;
    d = 32'h00000000;
    #10 reset = 0;

    // en=0: q should remain 0
    d = 32'hDEADBEEF; en = 0; #10;
    $display("en=0, d=%h -> q=%h", d, q);

    // en=1: q updates to d
    en = 1; #10;
    $display("en=1, d=%h -> q=%h", d, q);

    // change d while en=1
    d = 32'hCAFEBABE; #10;
    $display("en=1, d=%h -> q=%h", d, q);

    // disable and change d: q holds last value
    en = 0; d = 32'h12345678; #10;
    $display("en=0, d=%h -> q=%h", d, q);

    #10 $finish;
  end

  always #5 clk = ~clk;
endmodule
