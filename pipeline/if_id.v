module if_id(input         clk, reset,
             input  [31:0] pc_in, instr_in,
             output reg [31:0] pc_out, instr_out);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      pc_out <= 0;
      instr_out <= 0;
    end else begin
      pc_out <= pc_in;
      instr_out <= instr_in;
    end
  end
endmodule
