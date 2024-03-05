`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 11:08:51
// Design Name: 
// Module Name: wrapper_risc
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


module wrapper_risc(

    input wire clk,
    input wire btnC,
    //input wire [1:0]sw,
    output wire [7:0]led
    );
    
    
    
    RISCV_TOP Jmd(
        .clk(clk),
        .reset(~btnC),
        .basys_alu_result(led[7:0])
        //.sense(sw[0]),
        //.t_delay(sw[1]),
//        .lmY(led[4]),
//        .lmG(led[3]),
//        .lcR(led[2]),
//        .lcY(led[1]),
//        .lcG(led[0])
    );
endmodule
