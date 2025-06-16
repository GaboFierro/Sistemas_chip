`timescale 1ns/1ps
module dmem_tb;
reg clk, we;
reg [31:0] a, wd;
wire [31:0] rd;

dmem uut(.clk(clk), .we(we), .a(a), .wd(wd), .rd(rd));

initial begin
  $dumpfile("dmem_tb.vcd");
  $dumpvars(0, tb_dmem);
  clk=0;
  we=0;
  a=0;
  wd=0;
  #10 we=1; a=32'd4; wd=32'hAA55AA55;
  #10 we=1; a=32'd8; wd=32'h12345678;
  #10 we=0;
  #10 a=32'd4;
  #10 $display("rd@4=%h", rd);
  #10 a=32'd8;
  #10 $display("rd@8=%h", rd);
  #10 a=32'd0;
  #10 $display("rd@0=%h", rd);
  #10 $finish;
end

always #5 clk = ~clk;

endmodule
