`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 19:28:42
// Design Name: 
// Module Name: tb_control_unit
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


module tb_control_unit( );

    logic [31:0]pc_reg;
    logic [1:0]alu_sel;
    logic [2:0]alu_control;
    logic wb_mux;

    control_unit DUT (.*);
    //.pc_reg,
    //.alu_sel,
    //.alu_control,
    //.wb_mux
    
    initial
    begin
        {pc_reg} = 'b0;
        #50;
        pc_reg[6:0] = 7'b0010011;
        #50;
        pc_reg[6:0] = 7'b0110011;
        #50;
        pc_reg[6:0] = 7'b1100011;
        #50;
        pc_reg[6:0] = 7'b0010011;
        #50;
        pc_reg[6:0] = 7'b0110011;
        #50;
        pc_reg[6:0] = 7'b1100011;
        #50;
        pc_reg[6:0] = 7'b0010011;
        #50;
        pc_reg[6:0] = 7'b0110011;
        #50;
        pc_reg[6:0] = 7'b1100011;
        #50;
        pc_reg[6:0] = 7'b0010011;
        #50;
        pc_reg[6:0] = 7'b0110011;
        #50;
        pc_reg[6:0] = 7'b1100011;
        #50;
        pc_reg[6:0] = 7'b0010011;
        #50;
        pc_reg[6:0] = 7'b0110011;
        #50;
        pc_reg[6:0] = 7'b1100011;
        
    end
    
    always #10 pc_reg[14:12] = pc_reg[14:12] + 1;


endmodule  