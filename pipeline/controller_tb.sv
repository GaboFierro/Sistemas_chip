`timescale 1ns/1ps
module tb_controller;
  reg [6:0] op;
  reg [2:0] funct3;
  reg funct7b5, Zero;
  wire [1:0] ResultSrc;
  wire MemWrite, PCSrc, ALUSrc, RegWrite, Jump;
  wire [1:0] ImmSrc;
  wire [2:0] ALUControl;

  controller uut(
    .op(op),
    .funct3(funct3),
    .funct7b5(funct7b5),
    .Zero(Zero),
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .PCSrc(PCSrc),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .Jump(Jump),
    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl)
  );

  initial begin
    $dumpfile("controller_tb.vcd");
    $dumpvars(0, tb_controller);

    op=7'b0110011; funct3=3'b000; funct7b5=0; Zero=0; #10;
    $display("R-type add: RegWrite=%b ALUSrc=%b MemWrite=%b ResultSrc=%b ALUControl=%b PCSrc=%b ImmSrc=%b", RegWrite, ALUSrc, MemWrite, ResultSrc, ALUControl, PCSrc, ImmSrc);

    op=7'b0000011; funct3=3'b010; funct7b5=0; Zero=0; #10;
    $display("Load: RegWrite=%b ALUSrc=%b MemWrite=%b ResultSrc=%b ImmSrc=%b", RegWrite, ALUSrc, MemWrite, ResultSrc, ImmSrc);

    op=7'b0100011; funct3=3'b010; funct7b5=0; Zero=0; #10;
    $display("Store: RegWrite=%b ALUSrc=%b MemWrite=%b ImmSrc=%b", RegWrite, ALUSrc, MemWrite, ImmSrc);

    op=7'b1100011; funct3=3'b000; funct7b5=0; Zero=1; #10;
    $display("Branch taken: PCSrc=%b Zero=%b ImmSrc=%b", PCSrc, Zero, ImmSrc);

    op=7'b1100011; funct3=3'b000; funct7b5=0; Zero=0; #10;
    $display("Branch not taken: PCSrc=%b Zero=%b", PCSrc, Zero);

    #10 $finish;
  end
endmodule
