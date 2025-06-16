`timescale 1ns/1ps
module id_ex_tb;
  reg clk;
  reg reset;
  reg [31:0] pc_in, rd1_in, rd2_in, immext_in;
  reg [4:0] rs1_in, rs2_in, rd_in;
  reg [2:0] alucontrol_in;
  reg alusrc_in, regwrite_in, memwrite_in;
  reg [1:0] resultsrc_in;
  wire [31:0] pc_out, rd1_out, rd2_out, immext_out;
  wire [4:0] rs1_out, rs2_out, rd_out;
  wire [2:0] alucontrol_out;
  wire alusrc_out, regwrite_out, memwrite_out;
  wire [1:0] resultsrc_out;

  id_ex uut(
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .rd1_in(rd1_in),
    .rd2_in(rd2_in),
    .immext_in(immext_in),
    .rs1_in(rs1_in),
    .rs2_in(rs2_in),
    .rd_in(rd_in),
    .alucontrol_in(alucontrol_in),
    .alusrc_in(alusrc_in),
    .regwrite_in(regwrite_in),
    .memwrite_in(memwrite_in),
    .resultsrc_in(resultsrc_in),
    .pc_out(pc_out),
    .rd1_out(rd1_out),
    .rd2_out(rd2_out),
    .immext_out(immext_out),
    .rs1_out(rs1_out),
    .rs2_out(rs2_out),
    .rd_out(rd_out),
    .alucontrol_out(alucontrol_out),
    .alusrc_out(alusrc_out),
    .regwrite_out(regwrite_out),
    .memwrite_out(memwrite_out),
    .resultsrc_out(resultsrc_out)
  );

  initial begin
    $dumpfile("id_ex_tb.vcd");
    $dumpvars(0, id_ex_tb);
    clk = 0;
    reset = 1;
    pc_in = 0;
    rd1_in = 0;
    rd2_in = 0;
    immext_in = 0;
    rs1_in = 0;
    rs2_in = 0;
    rd_in = 0;
    alucontrol_in = 0;
    alusrc_in = 0;
    regwrite_in = 0;
    memwrite_in = 0;
    resultsrc_in = 0;
    #10;
    reset = 0;
    pc_in = 32'h00000010;
    rd1_in = 32'hAAAAAAAA;
    rd2_in = 32'h55555555;
    immext_in = 32'h0000FFFF;
    rs1_in = 5'd1;
    rs2_in = 5'd2;
    rd_in = 5'd3;
    alucontrol_in = 3'b101;
    alusrc_in = 1;
    regwrite_in = 1;
    memwrite_in = 0;
    resultsrc_in = 2'b01;
    #10;
    $display("pc_out=%h rd1_out=%h rd2_out=%h immext_out=%h rs1_out=%d rs2_out=%d rd_out=%d alucontrol_out=%b alusrc_out=%b regwrite_out=%b memwrite_out=%b resultsrc_out=%b", pc_out, rd1_out, rd2_out, immext_out, rs1_out, rs2_out, rd_out, alucontrol_out, alusrc_out, regwrite_out, memwrite_out, resultsrc_out);
    #10 $finish;
  end

  always #5 clk = ~clk;
endmodule
