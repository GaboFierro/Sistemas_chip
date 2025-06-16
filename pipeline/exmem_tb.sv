`timescale 1ns/1ps
module ex_mem_tb;
  reg clk;
  reg reset;
  reg [31:0] aluout_in;
  reg [31:0] writedata_in;
  reg [4:0] writereg_in;
  wire [31:0] aluout_out;
  wire [31:0] writedata_out;
  wire [4:0] writereg_out;

  ex_mem uut(
    .clk(clk),
    .reset(reset),
    .aluout_in(aluout_in),
    .writedata_in(writedata_in),
    .writereg_in(writereg_in),
    .aluout_out(aluout_out),
    .writedata_out(writedata_out),
    .writereg_out(writereg_out)
  );

  initial begin
    $dumpfile("ex_mem_tb.vcd");
    $dumpvars(0, tb_ex_mem);
    clk = 0;
    reset = 1;
    aluout_in = 0;
    writedata_in = 0;
    writereg_in = 0;
    #10;
    reset = 0;
    aluout_in = 32'hDEADBEEF;
    writedata_in = 32'hCAFEBABE;
    writereg_in = 5'd31;
    #10;
    aluout_in = 32'h12345678;
    writedata_in = 32'h87654321;
    writereg_in = 5'd15;
    #10;
    $display("aluout_out=%h writedata_out=%h writereg_out=%d",
             aluout_out, writedata_out, writereg_out);
    #10 $finish;
  end

  always #5 clk = ~clk;
endmodule

