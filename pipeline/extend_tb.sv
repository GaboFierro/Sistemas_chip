`timescale 1ns/1ps
module extend_tb;
  reg [31:0] full_instr;
  reg [1:0] immsrc;
  wire [31:0] immext;

  extend uut (
    .instr(full_instr[31:7]),
    .immsrc(immsrc),
    .immext(immext)
  );

  initial begin
    $dumpfile("extend_tb.vcd");
    $dumpvars(0, tb_extend);

    full_instr = {1'b0, 6'b000000, 5'b10101, 20'b0}; immsrc = 2'b00; #10; $display("imm_i = %h", immext);
    full_instr = {1'b0, 6'b010101, 5'b00110, 20'b0}; immsrc = 2'b01; #10; $display("imm_s = %h", immext);
    full_instr = 32'hF1234F80;         immsrc = 2'b10; #10; $display("imm_b = %h", immext);
    full_instr = 32'h00000000;         immsrc = 2'b11; #10; $display("default = %h", immext);
    #10 $finish;
  end
endmodule
