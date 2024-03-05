`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 21:26:20
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
//    input [4:0] read_reg_num1,
//    input [4:0] read_reg_num2,
//    input [4:0] write_reg,
//    input [31:0] write_data,
    input [31:0] pc_reg,
//    input wb_en,
//    input [31:0] wr_back_data,
    output reg [31:0] read_data1,
    output reg [31:0] read_data2,
    output reg [4:0]  write_reg,
    //input regwrite,
    input clk,
    input reset
    );
    
    wire [4:0] read_reg_num1;
    wire [4:0] read_reg_num2;
    reg  [0:31] reg_memory [31:0]; 
    
    assign read_reg_num1 = pc_reg[19:15];
    assign read_reg_num2 = pc_reg[24:20];
    
//    always @(posedge clk)
//    begin
//         reg_memory[0]  = 32'h0;
//         reg_memory[1]  = 32'h1;
//         reg_memory[2]  = 32'h2;
//         reg_memory[3]  = 32'h3;
//         reg_memory[4]  = 32'h4;
//         reg_memory[5]  = 32'h5;
//         reg_memory[6]  = 32'h6;
//         reg_memory[7]  = 32'h7;
//         reg_memory[8]  = 32'h8;
//         reg_memory[9]  = 32'h9;
//         reg_memory[10] = 32'h10;
//         reg_memory[11] = 32'h11;
//         reg_memory[12] = 32'h12;
//         reg_memory[13] = 32'h13;
//         reg_memory[14] = 32'h14;
//         reg_memory[15] = 32'h15;
//         reg_memory[16] = 32'h16;
//         reg_memory[17] = 32'h17;
//         reg_memory[18] = 32'h18;
//         reg_memory[19] = 32'h19;
//         reg_memory[20] = 32'h20;
//         reg_memory[21] = 32'h21;
//         reg_memory[22] = 32'h22;
//         reg_memory[23] = 32'h23;
//         reg_memory[24] = 32'h24;
//         reg_memory[25] = 32'h25;
//		 reg_memory[26] = 32'h26;
//         reg_memory[27] = 32'h27;
//         reg_memory[28] = 32'h28;
//         reg_memory[29] = 32'h29;
//         reg_memory[30] = 32'h30;
//         reg_memory[31] = 32'h31;
//    end
    
    always @(posedge clk , negedge reset)
    begin
    if (!reset)
        begin
            read_data1 = 'b0;
            read_data2 = 'b0;
            write_reg  = 'b0;
        end
     
//     else if (wb_en)
//            reg_memory[pc_reg] = wr_back_data  ; 
     
     else       
        begin                                   
            read_data1 = reg_memory[read_reg_num1]; 
            read_data2 = reg_memory[read_reg_num2]; 
            write_reg  = pc_reg[11:7];   
                        
        end                                            
    end
    
    
//    assign reg_memory = wr_back_data;
     initial
     $display("..................Instruction_Decoder is executed.............................");
     
//     $monitor("@time=%0t,pc_reg = %0h,read_data1=%0h,read_data2=%0h,write_reg=%0h",$time,pc_reg,read_data1,read_data2,write_reg always @(posedge clk)
//    begin
//        if (regwrite) begin
//            reg_memory[write_reg] = write_data;
//        end     
//    end

endmodule

