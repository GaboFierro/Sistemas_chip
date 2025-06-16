`timescale 1ns/1ps
module mem_wb_tb;
  reg clk;
  reg reset;
  reg [31:0] aluout_in;
  reg [31:0] readdata_in;
  reg [4:0] writereg_in;
  wire [31:0] aluout_out;
  wire [31:0] readdata_out;
  wire [4:0] writereg_out;

  mem_wb uut (
    .clk(clk),
    .reset(reset),
    .aluout_in(aluout_in),
    .readdata_in(readdata_in),
    .writereg_in(writereg_in),
    .aluout_out(aluout_out),
    .readdata_out(readdata_out),
    .writereg_out(writereg_out)
  );

  initial begin
    $dumpfile("mem_wb_tb.vcd");
    $dumpvars(0, mem_wb_tb);
    clk = 0;
    reset = 1;
    aluout_in = 0;
    readdata_in = 0;
    writereg_in = 0;
    #10 reset = 0;
    aluout_in = 32'hAAAAAAAA;
    readdata_in = 32'h55555555;
    writereg_in = 5'd10;
    #10;
    aluout_in = 32'h12345678;
    readdata_in = 32'h87654321;
    writereg_in = 5'd20;
    #10 $display("aluout_out=%h readdata_out=%h writereg_out=%d", aluout_out, readdata_out, writereg_out);
    #10 $finish;
  end

  always #5 clk = ~clk;
endmodule
