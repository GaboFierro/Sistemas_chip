`timescale 1ns/1ps
module maindec_tb;
  reg [6:0] op;
  wire RegWrite;
  wire [1:0] ImmSrc;
  wire ALUSrc;
  wire MemWrite;
  wire ResultSrc;
  wire [1:0] ALUOp;

  maindec uut(
    .op(op),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .ALUOp(ALUOp)
  );

  initial begin
    $dumpfile("maindec_tb.vcd");
    $dumpvars(0, maindec_tb);
    op = 7'b0000011; #10; $display("Load  %b: RegWrite=%b ImmSrc=%b ALUSrc=%b MemWrite=%b ResultSrc=%b ALUOp=%b", op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, ALUOp);
    op = 7'b0100011; #10; $display("Store %b: RegWrite=%b ImmSrc=%b ALUSrc=%b MemWrite=%b ResultSrc=%b ALUOp=%b", op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, ALUOp);
    op = 7'b1100011; #10; $display("Branch%b: RegWrite=%b ImmSrc=%b ALUSrc=%b MemWrite=%b ResultSrc=%b ALUOp=%b", op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, ALUOp);
    op = 7'b0010011; #10; $display("I-type%b: RegWrite=%b ImmSrc=%b ALUSrc=%b MemWrite=%b ResultSrc=%b ALUOp=%b", op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, ALUOp);
    op = 7'b0110011; #10; $display("R-type%b: RegWrite=%b ImmSrc=%b ALUSrc=%b MemWrite=%b ResultSrc=%b ALUOp=%b", op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, ALUOp);
    op = 7'b1111111; #10; $display("Default%b: RegWrite=%b ImmSrc=%b ALUSrc=%b MemWrite=%b ResultSrc=%b ALUOp=%b", op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, ALUOp);
    #10 $finish;
  end
endmodule
