`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 23:09:55
// Design Name: 
// Module Name: RISCV_TOP
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

module RISCV_TOP(
//input [31:0] PC_in,
input clk,
input reset,
output zero_flag,
output [31:0]alu_result,
output [7:0]basys_alu_result,
output bt
);

wire [31:0]w_pc_out;
wire [31:0]w_pc_in;
//assign w_pc_out = PC_in;
program_counter pc (.clk(clk),
                    .reset(reset),
                    .PC_in(w_pc_out),
                    .PC_out(w_pc_in)
                    );

PC_adder pa(
                    .a(w_pc_in),
                    .c(w_pc_out)                  
                    );
                    
 wire [31:0]w_instr_out;
 instruction_memory im (.clk(clk),
                       .reset(reset),
                       .read_addr(w_pc_in),
                       .instr_out(w_instr_out)
                      );
   
 
// wire [31:0]w_instr_out;
//instruction_memory im (.clk(clk),
//                       .reset(reset),
//                       .read_addr(w_pc_in),
//                       .instr_out(w_instr_out)
//                      );
                      
                                         

wire [31:0]w_read_data1;
wire [31:0]w_read_data2;

Register_file rf(
                            .clk(clk),
                            .reset(reset),
                            .we3(reg_write), //  assign value for enable 
                            .write_data3(alu_result),
                            .a1(w_instr_out[19:15]),
                            .a2(w_instr_out[24:20]),
                            .a3(w_instr_out[11:7]),
                            .rd1(w_read_data1),
                            .rd2(w_read_data2)
                             );                       

 


//wire [4:0]w_write_reg;
//instruction_decoder id(
//                       .clk(clk),    
//                       .reset(reset),
//                       .pc_reg(w_instr_out),
//                       .read_data1(w_read_data1),
//                       .read_data2(w_read_data2),
//                       .write_reg(w_write_reg)
//                       .w_RegWriteData(wr_back_data),
//                       .w_wb_en(wb_en)
//                      );

    
wire [1:0]w_alu_sel;
wire [2:0]w_alu_control;
//wire w_wb_mux;
 control_unit ct(
                 .clk(clk),
                 .reset(reset),
                 .pc_reg(w_instr_out),
                 .alu_sel(w_alu_sel),
                 .alu_control(w_alu_control),
                // .wb_mux(wb_mux),    
                 .reg_write(reg_write),   
                 .mem_write(mem_write), 
                 .result_src(result_src) 
                 );
   
 wire [31:0]w_alu_result;
 ALU_design ad(
                  .clk(clk),  
                  .reset(reset),
                  .read_data1(w_read_data1),
                  .read_data2(w_read_data2),
                  .alu_control(w_alu_control),
                  .alu_sel(w_alu_sel),
                  .alu_result(w_alu_result),
                  .zero_flag(zero_flag),
                  .bt(bt)
                 );
 
 wire [31:0]w_read_data;
// assign w_alu_result = alu_result;
 data_memory dm(
    .clk(clk),
    .reset(reset),
    .addr(w_read_data2),
    .write_data(w_alu_result),    
    .wr_en(mem_write),
    .read_data(w_read_data)
    );
   
  mux mu(
          .a(w_alu_result),
          .b(w_read_data),
          .s(result_src),
          .c(alu_result) 
          );  
// wire [31:0]w_read_data; 
// wire w_RegWriteData; 
// wire w_wb_en; 
// write_back wr(
//  .alu_result(w_alu_result),
//  .MemoryData(w_read_data),
//  .wb_en(),       //w_wb_en
//  .clk(clk),
//  .reset(reset),
//  .RegWriteData() //w_RegWriteData
//);
    assign basys_alu_result = w_alu_result[7:0];
    
endmodule
