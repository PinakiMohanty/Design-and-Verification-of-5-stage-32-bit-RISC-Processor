`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 20:35:27
// Design Name: 
// Module Name: tb_instruction_memory
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


module tb_instruction_memory();

    logic clk;
    logic reset;
    logic [31:0] read_addr;
    logic [31:0] instr_out;
   
    
 instruction_memory DUT(.*);   
    
 initial
    begin
        {clk,read_addr,reset} = 'b0;
        #10 reset = 'b1;
          
    end

    always #5 clk = ~clk;
    always #20 read_addr = $urandom();  
     
endmodule
