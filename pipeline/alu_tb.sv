`timescale 1ns/1ps

module tb_alu;
  reg [31:0] a;
  reg [31:0] b;
  reg [2:0] alucontrol;
  wire [31:0] result;

  alu uut (
    .a(a),
    .b(b),
    .alucontrol(alucontrol),
    .result(result)
  );

  initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, tb_alu);

    a = 32'hA5A5A5A5; b = 32'h5A5A5A5A; alucontrol = 3'b000; #10;
    $display("AND  : a=%h, b=%h -> result=%h", a, b, result);

    a = 32'h12345678; b = 32'h87654321; alucontrol = 3'b001; #10;
    $display("OR   : a=%h, b=%h -> result=%h", a, b, result);

    a = 32'd100; b = 32'd23; alucontrol = 3'b010; #10;
    $display("ADD  : a=%d, b=%d -> result=%d", a, b, result);

    a = 32'd50; b = 32'd75; alucontrol = 3'b110; #10;
    $display("SUB  : a=%d, b=%d -> result=%d", a, b, result);

    a = 32'd5; b = 32'd10; alucontrol = 3'b111; #10;
    $display("SLT  : a=%d, b=%d -> result=%d", a, b, result);

    a = 32'd20; b = 32'd10; alucontrol = 3'b111; #10;
    $display("SLT  : a=%d, b=%d -> result=%d", a, b, result);

    a = 32'hFFFF_FFFF; b = 32'h0000_0000; alucontrol = 3'b011; #10;
    $display("DEF  : alucontrol=3'b011 -> result=%b", result);

    #10 $finish;
  end
endmodule
