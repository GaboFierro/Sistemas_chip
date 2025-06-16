`timescale 1ns/1ps
module forwarding_unit_tb;
  reg [4:0] rs1E, rs2E;
  reg [4:0] rdM, rdW;
  reg regwriteM, regwriteW;
  wire [1:0] forwardAE, forwardBE;

  forwarding_unit uut (
    .rs1E(rs1E),
    .rs2E(rs2E),
    .rdM(rdM),
    .rdW(rdW),
    .regwriteM(regwriteM),
    .regwriteW(regwriteW),
    .forwardAE(forwardAE),
    .forwardBE(forwardBE)
  );

  initial begin
    $dumpfile("forwarding_unit_tb.vcd");
    $dumpvars(0, forwarding_unit_tb);

    // No forwarding
    rs1E=5'd1; rs2E=5'd2; rdM=5'd0; rdW=5'd0; regwriteM=0; regwriteW=0; #10;
    $display("NoFwd: AE=%b BE=%b", forwardAE, forwardBE);

    // Forward from M to A
    rs1E=5'd3; rs2E=5'd4; rdM=5'd3; rdW=5'd0; regwriteM=1; regwriteW=0; #10;
    $display("FwdM_A: AE=%b BE=%b", forwardAE, forwardBE);

    // Forward from W to A
    rs1E=5'd5; rs2E=5'd6; rdM=5'd0; rdW=5'd5; regwriteM=0; regwriteW=1; #10;
    $display("FwdW_A: AE=%b BE=%b", forwardAE, forwardBE);

    // Forward from M to B
    rs1E=5'd7; rs2E=5'd8; rdM=5'd8; rdW=5'd0; regwriteM=1; regwriteW=0; #10;
    $display("FwdM_B: AE=%b BE=%b", forwardAE, forwardBE);

    // Forward from W to B
    rs1E=5'd9; rs2E=5'd10; rdM=5'd0; rdW=5'd10; regwriteM=0; regwriteW=1; #10;
    $display("FwdW_B: AE=%b BE=%b", forwardAE, forwardBE);

    // Priority: M over W
    rs1E=5'd11; rs2E=5'd12; rdM=5'd11; rdW=5'd11; regwriteM=1; regwriteW=1; #10;
    $display("PriorityA: AE=%b", forwardAE);

    #10 $finish;
  end
endmodule
