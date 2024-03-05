`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 19:30:07
// Design Name: 
// Module Name: tb_instruction_decoder
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


module tb_instruction_decoder();

    logic [31:0]pc_reg;
    logic [31:0] read_data1;
    logic [31:0] read_data2;
    logic [4:0] write_reg;
    logic clk;
    logic reset;

instruction_decoder DUT (.*);

initial
begin
    {pc_reg,clk,reset} = 'b0;
    #10 reset = 'b1;
end
    
    always #5 clk = ~clk;
    //always #500 reset = ~reset;
    always #20 pc_reg[19:15] = pc_reg[19:15] + 1;
    always #20 pc_reg[24:20] = pc_reg[24:20] + 1;
    always #20 pc_reg[11:7]  = pc_reg[11:7] + 1;
    

endmodule
