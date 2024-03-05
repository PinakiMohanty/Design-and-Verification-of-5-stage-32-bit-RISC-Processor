`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 19:29:23
// Design Name: 
// Module Name: tb_alu_design
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


module tb_alu_design();

    // IO ports
    logic clk;
    logic reset;
   // logic valid;
    logic [31:0] read_data1;
    logic [31:0] read_data2;
    logic [2:0]  alu_control;
    logic [1:0]  alu_sel;
    logic  [31:0] alu_result;
    logic  zero_flag;
    logic   bt;

ALU_design DUT (.*);
//     .read_data1,
//     .read_data2,
//     .alu_control,
//     .alu_sel,
//     .enable_in,
//     .alu_result,
//     .zero_flag,
//     .bt

    initial
    begin
        {read_data1,read_data2,alu_control,alu_sel,clk,reset} = 'b0;
        #10 reset = 'b1;
        //valid = 'b1;
        alu_control = 3'b000;
        alu_sel = 2'b00;
    end
    
    always #5 clk = ~clk;
    always #10 read_data1   = read_data1 + 1;
    always #10 read_data2   = read_data2 + 1;
    always #100 alu_control = alu_control + 1;
    always #250 alu_sel     = alu_sel + 1;

endmodule
