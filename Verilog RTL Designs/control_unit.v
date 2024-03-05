`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 22:23:26
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input clk,
    input reset,
    input [31:0] pc_reg,
    output reg [1:0] alu_sel,
    output reg [2:0] alu_control,
   // output wb_mux,
    output reg_write,
    output mem_write,
    output result_src
    );
    
    always @(posedge clk, negedge reset)
    begin
        if(!reset)
        begin 
            alu_control = 'b0;
            alu_sel = 'b0;
        end    
        
        else
        begin
            alu_control = pc_reg[14:12];
            case(pc_reg[6:0])
                7'b0110011: alu_sel = 2'b00; //REGISTER SELECTION
                7'b0010011: alu_sel = 2'b01; //IMMIDIATE SELECTION            
                7'b1100011: alu_sel = 2'b10; //BRANCH SELECTION
                default :   alu_sel = 'b0;      
            endcase    
        end
    end
    
      /*  reg [1:0]r_alu_sel;
        reg [2:0]r_alu_control;    
       
        
    always @(posedge clk, negedge reset)
    begin
        if(!reset)
        begin 
            r_alu_control = 'b0;
            r_alu_sel = 'b0;
        end    
        
        else
        begin
            r_alu_control = pc_reg[14:12];
            case(pc_reg[6:0])
                7'b0110011: r_alu_sel = 2'b00; //REGISTER SELECTION
                7'b0010011: r_alu_sel = 2'b01; //IMMIDIATE SELECTION            
                7'b1100011: r_alu_sel = 2'b10; //BRANCH SELECTION
                default :   r_alu_sel = 'b0;      
            endcase    
        end
    end
    
                                                             
    always @ (posedge clk, negedge reset)
    begin
        if(!reset)
        begin 
            alu_control <= 'b0;
            alu_sel     <= 'b0;
        end
        
        else
        begin
            alu_control <= r_alu_control;
            alu_sel     <= r_alu_sel;
        end   
    end  
    */
    //assign r_alu_control = pc_reg[14:12];
   // assign wb_mux     = (pc_reg[6:0] == 7'b0000011 | pc_reg[6:0] == 7'b0110011) ? 1'b1 : 1'b0 ;
    assign reg_write  = (pc_reg[6:0] == 7'b0000011 | pc_reg[6:0] == 7'b0110011) ? 1'b1 : 1'b0 ;
    assign mem_write  = (pc_reg[6:0] == 7'b0100011) ? 1'b1 : 1'b0 ;
    assign result_src = (pc_reg[6:0] == 7'b0000011) ? 1'b1 : 1'b0 ;
       
    initial
     $display("..................Control_Unit is executed.............................");
    // $monitor("@time=%0t,pc_reg = %0h,alu_sel=%0h,alu_control=%0h",$time,pc_reg,alu_sel,alu_control);
endmodule
