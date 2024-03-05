`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 19:40:05
// Design Name: 
// Module Name: tb_write_back
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_write_back();

      logic [31:0]alu_result;
      logic [31:0]MemoryData;
      logic wb_en;
      logic clk;
      logic reset;
      logic [31:0] RegWriteData;

  // Instantiate the module under test
  write_back dut (
    .clk(clk),
    .reset(reset),
    .wb_en(wb_en),
    .alu_result(alu_result),
    .MemoryData(MemoryData),
    .RegWriteData(RegWriteData)
  );
  
  // Reset generation
  initial begin
    // Initialize signals
    {clk ,reset,alu_result,MemoryData, wb_en} = 'b0;   
    #20;
    reset = 'b1;
    end
  
    always #5 clk = ~clk;
    always #20 alu_result = alu_result + 1;
    //always #5 MemoryData  = MemoryData + 1;
    always #30 MemoryData  = MemoryData + 1;    
    always #200 wb_en = ~wb_en;

  
endmodule
