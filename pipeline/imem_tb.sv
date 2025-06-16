`timescale 1ns/1ps
module imem_tb;
  reg [31:0] a;
  wire [31:0] rd;
  imem uut (.a(a), .rd(rd));
  initial begin
    $dumpfile("imem_tb.vcd");
    $dumpvars(0, imem_tb);
    a = 32'd0; #10; $display("rd[0]=%h", rd);
    a = 32'd4; #10; $display("rd[4]=%h", rd);
    a = 32'd8; #10; $display("rd[8]=%h", rd);
    a = 32'd12; #10; $display("rd[12]=%h", rd);
    a = 32'd16; #10; $display("rd[16]=%h", rd);
    #10 $finish;
  end
endmodule
