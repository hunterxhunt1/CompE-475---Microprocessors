`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:14:10 AM
// Design Name: 
// Module Name: ALU_Decoder
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

/// ALU DECODER ///
/*
    ALUOp = 00 is used for calculating the effectiveness address of the memory when executing lw and sw
    ALUOp = 01 is used when executing BRANCH instruction and SUBTRACTING rs from rt
*/
module ALU_Decoder(
input [1 : 0] ALUOp,
input [5 : 0] funct,
output reg [3 : 0] ALUSel
);

always @(*) begin
    case(ALUOp)
    
    2'b00: begin //LOAD WORD OR STORE WORD
        ALUSel <= 4'b0010; //ADD
    end
    
    2'b01: begin  //BEQ
        ALUSel <= 4'b0110; //SUBTRACT
    end
    
    2'b10: begin // LOOK AT FUNCT 1x
    
        case(funct)
        6'b100100: ALUSel <= 4'b0000;   //AND
        6'b100101: ALUSel <= 4'b0001;   //OR
        6'b100000: ALUSel <= 4'b0010;   //ADD
        6'b000000: ALUSel <= 4'b0011;   //SLL
        6'b000010: ALUSel <= 4'b0100;   //SRL
        6'b100010: ALUSel <= 4'b0110;   //SUBTRACT
        6'b101010: ALUSel <= 4'b0111;   //SLT
        6'b000100: ALUSel <= 4'b1000;   //SLLV
        6'b000110: ALUSel <= 4'b1001;   //SRLV
        6'b000111: ALUSel <= 4'b1010;   //SRAV
        6'b011000: ALUSel <= 4'b1011;   //MULTIPLICATION
        
        endcase //end case funct
           
    end 
    
    endcase

end//end always

endmodule