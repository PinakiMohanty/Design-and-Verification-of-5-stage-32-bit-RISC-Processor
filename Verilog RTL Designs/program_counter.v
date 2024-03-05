`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 23:07:58
// Design Name: 
// Module Name: program_counter
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
module program_counter(
input clk,reset,
input [31:0] PC_in,
output reg [31:0] PC_out
    );
    always @(posedge clk , negedge reset)
    begin
    if(!reset)
    PC_out <= 32'h0;
    else
    PC_out <= PC_in;
    end
    initial
    begin
     //$display("........................................");
     $display("..................Program_Counter is executed.............................");
     
    // $monitor("@time=%0t,clk = %0h,reset=%0h,PC_in=%0h,PC_out=%0h",$time,clk,reset,PC_in,PC_out,);
    end
    
//    initial 
//    begin 
//    #50    PC_in = 32'b0000_0000_1010_0000_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0000_1000_0101_0001_0011;
//    #50    PC_in = 32'b0000_0000_1010_0001_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0001_1000_0101_0001_0011;      
//    #50    PC_in = 32'b0000_0000_1010_0010_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0010_1000_0101_0001_0011;  
//    #50    PC_in = 32'b0000_0000_1010_0011_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0011_1000_0101_0001_0011;  
//    #50    PC_in = 32'b0000_0000_1010_0100_0000_0101_0001_0011; 
//    end
endmodule
