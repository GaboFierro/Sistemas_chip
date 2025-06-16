`timescale 1ns/1ps
module hazard_unit_tb;
  reg [4:0] rs1D, rs2D, rdE;
  reg memreadE;
  wire stallF, stallD, flushE;

  hazard_unit uut (
    .rs1D(rs1D),
    .rs2D(rs2D),
    .rdE(rdE),
    .memreadE(memreadE),
    .stallF(stallF),
    .stallD(stallD),
    .flushE(flushE)
  );

  initial begin
    $dumpfile("hazard_unit_tb.vcd");
    $dumpvars(0, hazard_unit_tb);

    rs1D=5'd1; rs2D=5'd2; rdE=5'd0; memreadE=0; #10; $display("No hazard: stallF=%b stallD=%b flushE=%b", stallF, stallD, flushE);
    rs1D=5'd3; rs2D=5'd4; rdE=5'd3; memreadE=1; #10; $display("Hazard on rs1: stallF=%b stallD=%b flushE=%b", stallF, stallD, flushE);
    rs1D=5'd5; rs2D=5'd6; rdE=5'd6; memreadE=1; #10; $display("Hazard on rs2: stallF=%b stallD=%b flushE=%b", stallF, stallD, flushE);
    rs1D=5'd7; rs2D=5'd8; rdE=5'd9; memreadE=1; #10; $display("No match: stallF=%b stallD=%b flushE=%b", stallF, stallD, flushE);

    #10 $finish;
  end
endmodule

