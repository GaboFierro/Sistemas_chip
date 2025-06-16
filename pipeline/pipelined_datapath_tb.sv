`timescale 1ns/1ps
module pipelined_datapath_tb;
  reg clk;
  reg reset;
  reg [31:0] instrF;
  reg [31:0] readdataM;
  reg pcsrcD;
  reg branchD;
  reg jumpD;
  reg memtoregE;
  reg memtoregM;
  reg memtoregW;
  reg alusrcE;
  reg regdstE;
  reg regwriteD;
  reg regwriteE;
  reg regwriteM;
  reg regwriteW;
  reg [2:0] alucontrolE;
  reg [4:0] rs1D;
  reg [4:0] rs2D;
  reg [4:0] rs1E;
  reg [4:0] rs2E;
  reg [1:0] forwardAE;
  reg [1:0] forwardBE;
  wire [31:0] pcF;
  wire [31:0] aluoutM;
  wire [31:0] writedataM;
  wire [4:0] writeregW;
  wire [31:0] resultW;

  pipelined_datapath uut(
    .clk(clk),
    .reset(reset),
    .instrF(instrF),
    .readdataM(readdataM),
    .pcsrcD(pcsrcD),
    .branchD(branchD),
    .jumpD(jumpD),
    .memtoregE(memtoregE),
    .memtoregM(memtoregM),
    .memtoregW(memtoregW),
    .alusrcE(alusrcE),
    .regdstE(regdstE),
    .regwriteD(regwriteD),
    .regwriteE(regwriteE),
    .regwriteM(regwriteM),
    .regwriteW(regwriteW),
    .alucontrolE(alucontrolE),
    .rs1D(rs1D),
    .rs2D(rs2D),
    .rs1E(rs1E),
    .rs2E(rs2E),
    .forwardAE(forwardAE),
    .forwardBE(forwardBE),
    .pcF(pcF),
    .aluoutM(aluoutM),
    .writedataM(writedataM),
    .writeregW(writeregW),
    .resultW(resultW)
  );

  initial begin
    $dumpfile("pipelined_datapath_tb.vcd");
    $dumpvars(0, pipelined_datapath_tb);
    clk = 0;
    reset = 1;
    instrF = 32'h00000000;
    readdataM = 32'h00000000;
    pcsrcD = 0;
    branchD = 0;
    jumpD = 0;
    memtoregE = 0;
    memtoregM = 0;
    memtoregW = 0;
    alusrcE = 0;
    regdstE = 0;
    regwriteD = 0;
    regwriteE = 0;
    regwriteM = 0;
    regwriteW = 0;
    alucontrolE = 3'b000;
    rs1D = 5'd0;
    rs2D = 5'd0;
    rs1E = 5'd0;
    rs2E = 5'd0;
    forwardAE = 2'b00;
    forwardBE = 2'b00;
    #10 reset = 0;
    instrF = 32'hFFFFFFFF;
    readdataM = 32'hDEADBEEF;
    pcsrcD = 1;
    branchD = 1;
    jumpD = 0;
    memtoregE = 1;
    memtoregM = 1;
    memtoregW = 1;
    alusrcE = 1;
    regdstE = 1;
    regwriteD = 1;
    regwriteE = 1;
    regwriteM = 1;
    regwriteW = 1;
    alucontrolE = 3'b010;
    rs1D = 5'd1;
    rs2D = 5'd2;
    rs1E = 5'd3;
    rs2E = 5'd4;
    forwardAE = 2'b10;
    forwardBE = 2'b01;
    #20;
    $display("pcF=%h aluoutM=%h writedataM=%h writeregW=%d resultW=%h", pcF, aluoutM, writedataM, writeregW, resultW);
    #10 $finish;
  end

  always #5 clk = ~clk;
endmodule
