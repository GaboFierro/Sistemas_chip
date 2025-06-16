`timescale 1ns/1ps
module regfile_tb;
  reg clk;
  reg we3;
  reg [4:0] ra1, ra2, wa3;
  reg [31:0] wd3;
  wire [31:0] rd1, rd2;

  regfile uut (
    .clk(clk),
    .we3(we3),
    .ra1(ra1),
    .ra2(ra2),
    .wa3(wa3),
    .wd3(wd3),
    .rd1(rd1),
    .rd2(rd2)
  );

  initial begin
    $dumpfile("regfile_tb.vcd");
    $dumpvars(0, regfile_tb);
    clk = 0;
    we3 = 0;
    ra1 = 0;
    ra2 = 0;
    wa3 = 0;
    wd3 = 0;
    #10;
    we3 = 1; wa3 = 5; wd3 = 32'hAAAAAAAA; #10;
    we3 = 1; wa3 = 0; wd3 = 32'hBBBBBBBB; #10;
    we3 = 0; #10;
    ra1 = 5; ra2 = 0; #10; $display("Read: rd1(5)=%h rd2(0)=%h", rd1, rd2);
    ra1 = 0; ra2 = 5; #10; $display("Read: rd1(0)=%h rd2(5)=%h", rd1, rd2);
    ra1 = 5; ra2 = 5; #10; $display("Read: rd1(5)=%h rd2(5)=%h", rd1, rd2);
    #10 $finish;
  end

  always #5 clk = ~clk;
endmodule
