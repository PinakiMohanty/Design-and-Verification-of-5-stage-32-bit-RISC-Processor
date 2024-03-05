`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 00:09:08
// Design Name: 
// Module Name: tb_data_memory
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


module tb_data_memory();
   
    logic clk;
    logic reset;
    logic [31:0]addr;
    logic [31:0]write_data;    
    logic wr_en,rd_en;
    logic [31:0]read_data;
    
    data_memory dm(.*);
    
    initial
    begin
        {clk,reset,addr,write_data,rd_en,wr_en} = 'b0;
        #10 reset = 'b1;
            wr_en = 'b1;
            write_data = 'b1;
            
            #500 wr_en = 'b0;
            rd_en = 'b1;
        #1000 $finish();
//        #100
//            
//        #100
//            wr_en = 'b1;
//            rd_en = 'b0;        
//        #100
//            wr_en = 'b0;
//            rd_en = 'b1;        
    end
    
    
    always #5 clk   = ~clk;
    always #10 addr   = $urandom();
    //always #50 wr_en = $urandom();
    always #20 write_data = write_data + 1;

endmodule
