`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 20:28:18
// Design Name: 
// Module Name: tb_program_counter
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


module tb_program_counter();

logic clk,reset;
logic [31:0] PC_in;
logic [31:0] PC_out;

    program_counter DUT (.*);

    initial
    begin
        {clk,reset,PC_in} = 'b0;
            #10 reset = 'b1;

    end

    always #5 clk = ~clk;
    //always #5 reset = ~reset;
    always #10 PC_in = PC_in + 1 ;
    
    
endmodule
