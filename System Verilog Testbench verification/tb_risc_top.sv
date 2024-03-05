`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 01:24:52
// Design Name: 
// Module Name: tb_risc_top
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


module tb_risc_top();

    logic [31:0] PC_in;
    logic clk;
    logic reset;
    //logic valid;
    logic zero_flag;
    logic [31:0]alu_result;
    logic [7:0]basys_alu_result;
    logic bt;

 RISCV_TOP DUT(.*);

    initial
    begin
    clk = 1;
    {PC_in,reset} = 'b0;
    #10     reset = 'b1;
            //valid = 'b1;
    
   /////////////////////////////////////////////////////////////////////////////// 
     //add
  /*           PC_in = 32'b0000_0000_0001_0000_1000_0101_0011_0011; //R type
        #50  PC_in = 32'b0000_0000_0011_0001_1000_0101_0011_0011; //R type
//      #50  PC_in = 32'b0000_0000_0111_0011_1000_0101_0011_0011; //R type
//      #50  PC_in = 32'b0000_0000_0001_0011_0000_0101_0011_0011; //R type
//      #50  PC_in = 32'b0000_0000_1010_0011_1000_0101_0011_0011; //R type
    
    //sub
        #60  PC_in = 32'b0000_0000_0001_0011_0001_0101_0011_0011; //R type
        #50  PC_in = 32'b0000_0000_0100_0100_1001_0101_0011_0011; //R type
//        #50  PC_in = 32'b0000_0000_1000_0100_0001_0101_0011_0011; //R type

      //or
         #50  PC_in = 32'b0000_0000_0100_0001_1010_0101_0011_0011; //R type
         #50  PC_in = 32'b0000_0000_1010_1010_1010_0101_0011_0011;
         
       //and   
        #50    PC_in = 32'b0000_0000_0011_0011_1011_0101_0011_0011;
        #50    PC_in = 32'b0000_0000_0010_0011_1011_0101_0011_0011;
        
        //xor
    #50    PC_in = 32'b0000_0000_0000_1111_1100_0101_0011_0011;
    #50    PC_in = 32'b0000_0001_0010_1001_1100_0101_0011_0011;



//    #100   PC_in = 32'b0000_0000_1010_1010_1001_0101_0011_0011;

  */  
    /////////////////////////////////////////////////////////////////////////////
    // IMMEDIATE type
    
    //ADDI
//    #50    PC_in = 32'b0000_0000_1010_0000_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0000_1000_0101_0001_0011;
//    #50    PC_in = 32'b0000_0000_1010_0001_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0001_1000_0101_0001_0011;      
//    #50    PC_in = 32'b0000_0000_1010_0010_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0010_1000_0101_0001_0011;  
//    #50    PC_in = 32'b0000_0000_1010_0011_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0011_1000_0101_0001_0011;  
//    #50    PC_in = 32'b0000_0000_1010_0100_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0100_1000_0101_0001_0011;  
//   #50    PC_in = 32'b0000_0000_1010_0101_0000_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0101_1000_0101_0001_0011;  
 
    // SUBI
//    #50    PC_in = 32'b0000_0000_1010_0000_0001_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0000_1001_0101_0001_0011;
//    #50    PC_in = 32'b0000_0000_1010_0001_0001_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0001_1001_0101_0001_0011;      
//    #50    PC_in = 32'b0000_0000_1010_0010_0001_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0010_1001_0101_0001_0011;  
//    #50    PC_in = 32'b0000_0000_1010_0011_0001_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0011_1001_0101_0001_0011;  
//    #50    PC_in = 32'b0000_0000_1010_0100_0001_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0100_1001_0101_0001_0011;  
//    #50    PC_in = 32'b0000_0000_1010_0101_0001_0101_0001_0011; 
//    #50    PC_in = 32'b0000_0000_1010_0101_1001_0101_0001_0011;  
 
  /*  
 //////////////////////////////////////////////////////////////////////////////////   
 //BRANCH TYPE
//   BEQ
    #50    PC_in = 32'b0000_0001_0101_1010_1000_0101_0110_0011; // B type
    #50    PC_in = 32'b0000_0001_0001_0100_1000_0101_0110_0011;   
   
   //BNQ
    #50    PC_in = 32'b0000_0001_1010_1010_1001_0101_0110_0011;
    #50    PC_in = 32'b0000_0000_1010_0101_0001_0101_0110_0011;
    
//   BLT
    #50    PC_in = 32'b0000_0000_0001_0111_1010_0101_0110_0011; 
    #50    PC_in = 32'b0000_0000_1010_0000_0010_0101_0110_0011;
   
   // BGT
    #50    PC_in = 32'b0000_0000_0001_0111_1011_0101_0110_0011; 
    #50    PC_in = 32'b0000_0000_1010_0000_0011_0101_0110_0011;
//////////////////////////////////////////////////////////////////////////

//    #50    PC_in = 32'b0000_0000_1010_1010_1011_0101_0110_0011;
//    #50    PC_in = 32'b0000_0000_1010_1010_1011_0101_0110_0011;     
//    #50    PC_in = 32'b0000_0000_1010_1010_1000_0101_0110_0011; 
//    #50    PC_in = 32'b0000_0000_1010_1010_1001_0101_0110_0011;
//    #50    PC_in = 32'b0000_0000_1010_1010_1010_0101_0110_0011;
//    #50    PC_in = 32'b0000_0000_1010_1010_1011_0101_0110_0011;
   
//    //add
//    #50    PC_in = 32'b0000_0000_1011_0011_1000_0101_0011_0011; 
//    #50    PC_in = 32'b1010_0100_1111_1001_1000_0101_0011_0011; 
//    #50    PC_in = 32'b0000_0110_0111_1011_1000_0101_0011_0011; 
//    #50    PC_in = 32'b0000_0000_1011_0011_1000_0101_0011_0011; 
       */  
    
    
    end
    
      always #5  clk   = clk + 1; 
     
//     always 
//     begin
//     #10;
//        valid = 1;
//      #1;
//        valid = 0;
//      #39;
//      end
    //always #10 valid = ~valid;
   // always #5 clk = ~clk;   
   // always #20 PC_in = PC_in + 1;  

  /*  */
  
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
        
    reg [1:0]w_alu_sel;
    reg [2:0]w_alu_control;
    reg [4:0]w_read_data1;
    reg [4:0]w_read_data2;
    reg [5:0]w_alu_result;
    reg w_bt;
    
     assign w_alu_control = PC_in[14:12];
     assign w_read_data1  = PC_in[19:15];
     assign w_read_data2  = PC_in[24:20];
   //assign w_alu_control = PC_in[14:12];
    
    always @*
    begin
        case(PC_in[6:0])
            7'b0110011: w_alu_sel = 2'b00; //REGISTER SELECTION
            7'b0010011: w_alu_sel = 2'b01; //IMMIDIATE SELECTION            
            7'b1100011: w_alu_sel = 2'b10; //BRANCH SELECTION
            //default :   alu_sel = 'bx;      
        endcase    
    end
    
    always @*
    begin
    //#50;
    //if (valid)
    case (w_alu_sel)
    2'b00: begin
        //bt = 'b0;
        case(w_alu_control)
    
            ADD: begin
                    w_alu_result = w_read_data1 + w_read_data2;         // BITWISE AND
                    #30 @(posedge clk);
                    if (w_alu_result == alu_result)
                        $display("@%0t, OUTPUT MATCHED FOR ADD",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR ADD",$time);

                 end
                    
            SUB: begin
                    w_alu_result = w_read_data1 - w_read_data2;         // BITWISE AND
                    #30 @(posedge clk);
                    if (w_alu_result == alu_result)
                        $display("@%0t, OUTPUT MATCHED FOR SUB",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR SUB",$time);

                 end
                 
            OR: begin
                    w_alu_result = w_read_data1 | w_read_data2;         // BITWISE AND
                    #30 @(posedge clk);
                    if (w_alu_result == alu_result)
                        $display("@%0t, OUTPUT MATCHED FOR OR",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR OR",$time);

                 end
                 
            AND: begin
                    w_alu_result = w_read_data1 & w_read_data2;         // ADD
                    #30 @(posedge clk);
                    if (w_alu_result == alu_result)
                        $display("@%0t, OUTPUT MATCHED FOR AND",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR AND",$time);

                 end
                 
            XOR: begin
                    w_alu_result = w_read_data1 ^ w_read_data2;           // XOR
                    #30 @(posedge clk);
                    if (w_alu_result == alu_result)
                        $display("@%0t, OUTPUT MATCHED FOR XOR",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR XOR",$time);

                 end
                 
            //default: alu_result = 32'b0;
        
        endcase
    end
    2'b01: begin
         //bt = 'b0; 
     case(w_alu_control)
    
            ADDI: begin
                    w_alu_result =  w_read_data1 + 1;         // ADD IMEADIATE
                    #30 @(posedge clk);
                    if (w_alu_result == alu_result)
                        $display("@%0t, OUTPUT MATCHED FOR ADDI",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR ADDI",$time);
                            
                  end
                    
            SUBI: begin
                    w_alu_result =  w_read_data1 - 1;         // SUBTRACT IMMEDIATE
                    #30 @(posedge clk);
                    if (w_alu_result == alu_result)
                        $display("@%0t, OUTPUT MATCHED FOR SUBI",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR SUBI",$time);

                  end
            //default: w_alu_result = 32'b0;
    
        endcase
    end
    
    2'b10: begin
        // w_alu_result = 'b0; 
     case(w_alu_control)
    
            BEQ: begin
                    w_bt = (w_read_data1 == w_read_data2) ? 'b1 : 'b0;         // BRANCH EQUAL                  2'b00
                    #30 @(posedge clk);
                    if (w_bt == bt)
                        $display("@%0t, OUTPUT MATCHED FOR BEQ",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR BEQ",$time);

                 end
            BNQ: begin
                    w_bt = (w_read_data1 != w_read_data2) ? 'b1 : 'b0;         // BRANCH NOT EQUAL              2'b01
                    #30 @(posedge clk);
                    if (w_bt == bt)
                        $display("@%0t, OUTPUT MATCHED FOR BNQ",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR BNQ",$time);

                 end
            BLT: begin
                    w_bt = (w_read_data1 <  w_read_data2) ? 'b1 : 'b0;         // BRANCH LESS THAN              2'b10
                    #30 @(posedge clk);
                    if (w_bt == bt)
                        $display("@%0t, OUTPUT MATCHED FOR BLT",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR BLT",$time);

                 end
            BGT: begin 
                    w_bt = (w_read_data1 >  w_read_data2) ? 'b1 : 'b0;         // BRANCH GREATER THAN           2'b11
                    #30 @(posedge clk);
                    if (w_bt == bt)
                        $display("@%0t, OUTPUT MATCHED FOR BGT",$time);
                    else
                        $display("@%0t, OUTPUT NOT MATCHED FOR BGT",$time);

                 end
           // default: bt = 'b0;
        
        endcase
    end
    
//    default : begin w_alu_result = 32'b0; 
//              bt = 'b0; end
    endcase
    end   
   
endmodule
