`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 23:08:49
// Design Name: 
// Module Name: instruction_memory
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

module instruction_memory(
    input clk,
    input reset,
    input [31:0] read_addr,
    output  [31:0] instr_out
    );
    
   // integer k=0;
    reg [31:0] Memory [255:0];
    assign instr_out = Memory[read_addr];
    
   // reg [15:0] frame[0:18432];
//    reg file_handler;
//    reg pixel;
//    integer i;
//    always@*
//    begin
//	   file_handler = $fopen ("hexadecimal.hex", "Memory");
//	   if(file_handler == 0) begin
//	   	$display("Failed to open file");
//	   	$stop;
//	   end

//	   for(i = 0; i < 5; i= i+1) begin
//	   	pixel = $fscanf(file_handler, "%h", Memory[i] );
//	   	$display("pixel read: %h", Memory[i]);
//	   end
//	end
//    always @(posedge clk, negedge reset)
//    begin
//    if(~reset)
//        Memory[k] = 'b0;
//    else
//        Memory[k] = read_addr ;
//       for(k=0;k<255;k=k+1)
//    begin
//    Memory[k] = k;
//    end
//    end
 
    initial begin
        $display("..................Instruction_Memory is executed.............................");
        //$readmemh("hexadecimal_3.hex",Memory);
        $readmemh("hex_all_instr.hex",Memory);
        $monitor("@%0t,......................Intruction is stored in instruction memory..............",$time);

      //  $readmemh("C:\Users\shiva\RISC FETCH\RISC FETCH.srcs\sim_1\new\hex.v",Memory);
        
    //  $monitor("@time=%0t,read_addr=%0h,instr_out=%0h",$time,read_addr,instr_out);
    end 
endmodule
