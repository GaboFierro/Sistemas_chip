`timescale 1ns/1ps
module if_id_tb;
  reg clk;
  reg reset;
  reg [31:0] pc_in;
  reg [31:0] instr_in;
  wire [31:0] pc_out;
  wire [31:0] instr_out;

  if_id uut (
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .instr_in(instr_in),
    .pc_out(pc_out),
    .instr_out(instr_out)
  );

  initial begin
    $dumpfile("if_id_tb.vcd");
    $dumpvars(0, if_id_tb);
    clk = 0;
    reset = 1;
    pc_in = 0;
    instr_in = 0;
    #10 reset = 0;
    pc_in = 32'h00000004;
    instr_in = 32'hDEADBEEF;
    #10 $display("pc_out=%h instr_out=%h", pc_out, instr_out);
    pc_in = 32'h00000008;
    instr_in = 32'h12345678;
    #10 $display("pc_out=%h instr_out=%h", pc_out, instr_out);
    #10 $finish;
  end

  always #5 clk = ~clk;
endmodule
