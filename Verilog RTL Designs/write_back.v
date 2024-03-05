`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 09:07:54
// Design Name: 
// Module Name: write_back
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


module write_back(

      input [31:0]alu_result,
      input [31:0]MemoryData,
      input wb_en,
      input clk,
      input reset,
      output reg [31:0] RegWriteData
    );
    
      always @(posedge clk or negedge reset) 
      begin
        if (~reset) 
              RegWriteData <= 32'h0;
        else 
        begin
            if (wb_en)        
               RegWriteData <= alu_result;
            else 
               RegWriteData <= MemoryData;
          end
        end
endmodule
