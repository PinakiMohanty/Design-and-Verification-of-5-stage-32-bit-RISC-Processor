`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 00:08:39
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input  clk,
    input  reset,
    input  [31:0]addr,
    input  [31:0]write_data,    
    input  wr_en,//rd_en,
    output [31:0]read_data
    );
    
    reg [31:0]memory[0:31];
    reg [31:0]tmp;
    
    always @(posedge clk, negedge reset)
    begin
        if(!reset)
             memory[addr] = 'b0;
        else 
             memory[addr] = write_data;
    end
    
    always @(posedge clk, negedge reset)
    begin
        if(!reset)
             tmp = 'b0;
        else 
             tmp = memory[addr];
    end
    
   // assign tmp = memory[addr];
    assign read_data = ~wr_en ? memory[addr]: 'b0;
    
     initial
     begin
    // $monitor("@time=%0t,addr=%0h,write_data=%0h,read_data=%0h",$time,addr,write_data,read_data);
     $display("..................Data_Memory is executed.............................");
     $monitor("@%0t,......................ALU Result is stored in data memory..............",$time);

     end
//        always @(posedge clk, negedge reset)
//    begin
//     if(!reset)
//             tmp = 'b0;
//        else if(rd_en)
//             tmp = memory[addr];
//    end    
    
//    assign read_data = tmp;
    //assign read_data = rd_en ? memory[addr] : 'b0;

endmodule
