`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 18:33:35
// Design Name: 
// Module Name: ALU_design
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


module ALU_design(

    // IO ports
        input clk,
        input reset,
       // input valid,
        input [31:0] read_data1,
        input [31:0] read_data2,
        input [2:0]  alu_control,
        input [1:0]  alu_sel,
        output reg [31:0] alu_result,
        output zero_flag,
        output reg bt
    );
    
    // ALU control symbolic representation
    localparam [2:0]
                ADD = 3'b000,
                SUB = 3'b001,
                OR  = 3'b010,
                AND = 3'b011,
                XOR = 3'b100;
    
    localparam [2:0]
                ADDI = 3'b000,
                SUBI = 3'b001;
                
    localparam [2:0]
                BEQ = 3'b000,
                BNQ = 3'b001,
                BLT = 3'b010,
                BGT = 3'b011;             
    // body
    always @ (posedge clk, negedge reset)
    begin
        if (~reset)
        begin 
            alu_result = 'b0;
           // zero_flag  = 'b0;
            bt         = 'b0;
        end
          
        else
            begin
                case (alu_sel)
                    2'b00: 
                    begin
                        bt = 'b0;
                        case(alu_control)
                    
                            ADD: alu_result = read_data1 + read_data2;         // BITWISE AND
                            
                            SUB: alu_result = read_data1 - read_data2;         // SUBTRACT
                            
                            OR:  alu_result = read_data1 | read_data2;         // BITWISE OR
                    
                            AND: alu_result = read_data1 & read_data2;         // ADD
                            
                            XOR: alu_result = read_data1 ^ read_data2;         // XOR
                            
                            default: alu_result = 32'b0;
                        
                        endcase
                    end
                    
                    2'b01: 
                    begin
                         bt = 'b0; 
                         case(alu_control)
                    
                            ADDI: alu_result =  read_data1 + 1;         // ADD IMEADIATE
                            
                            SUBI: alu_result =  read_data1 - 1;         // SUBTRACT IMMEDIATE
                            
                            default: alu_result = 32'b0;
                    
                          endcase
                    end
            
                    2'b10: 
                    begin
                         alu_result = 'b0; 
                         case(alu_control)
                    
                            BEQ: bt = (read_data1 == read_data2) ? 'b1 : 'b0;         // BRANCH EQUAL                  2'b00
                            BNQ: bt = (read_data1 != read_data2) ? 'b1 : 'b0;         // BRANCH NOT EQUAL              2'b01
                            BLT: bt = (read_data1 <  read_data2) ? 'b1 : 'b0;         // BRANCH LESS THAN              2'b10
                            BGT: bt = (read_data1 >  read_data2) ? 'b1 : 'b0;         // BRANCH GREATER THAN           2'b11
                            default: bt = 'b0;
                        
                          endcase
                    end
            
                    default : 
                    begin 
                         alu_result = 32'b0; 
                         bt = 'b0; 
                    end
                    
               endcase
             end
//          else 
//               begin 
//                  alu_result = 'b0;
//               // zero_flag  = 'b0;
//                  bt         = 'b0;
//               end
        end
   //end 
        assign zero_flag = (alu_result == 32'b0) ? 1'b1 : 1'b0;
    initial
     //$monitor("@time=%0t,read_data1=%0h,read_data2=%0h,alu_control=%0h,alu_sel=%0h,alu_result=%0h,zero_flag=%0h,bt=%0h",$time,read_data1,read_data2,alu_control,alu_sel,alu_result,zero_flag,bt);
    $display("..................ALU_Design is executed.............................");
    
endmodule
