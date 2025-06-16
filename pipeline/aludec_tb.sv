`timescale 1ns/1ps
module tb_aludec;
 reg [1:0] ALUOp;
 reg funct7b5;
 reg [2:0] funct3;
 wire [2:0] ALUControl;
 aludec uut (.ALUOp(ALUOp), .funct7b5(funct7b5), .funct3(funct3), .ALUControl(ALUControl));
 initial begin
  $dumpfile("aludec_tb.vcd");
  $dumpvars(0, tb_aludec);

  ALUOp=2'b00; funct7b5=0; funct3=3'b000; #10; $display("ALUOp=00 -> %b", ALUControl);
  ALUOp=2'b01; funct7b5=0; funct3=3'b000; #10; $display("ALUOp=01 -> %b", ALUControl);
  ALUOp=2'b10; funct7b5=0; funct3=3'b000; #10; $display("funct3=000,7b5=0 -> %b", ALUControl);
  ALUOp=2'b10; funct7b5=1; funct3=3'b000; #10; $display("funct3=000,7b5=1 -> %b", ALUControl);
  ALUOp=2'b10; funct7b5=0; funct3=3'b010; #10; $display("funct3=010 -> %b", ALUControl);
  ALUOp=2'b10; funct7b5=0; funct3=3'b110; #10; $display("funct3=110 -> %b", ALUControl);
  ALUOp=2'b10; funct7b5=0; funct3=3'b111; #10; $display("funct3=111 -> %b", ALUControl);
  ALUOp=2'b10; funct7b5=0; funct3=3'b001; #10; $display("funct3=001(def) -> %b", ALUControl);
  #10 $finish;
 end
endmodule
