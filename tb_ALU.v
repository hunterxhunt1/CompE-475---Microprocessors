`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 01:18:14 AM
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU();

reg [31 : 0] ALUIn1,ALUIn2;
reg [3 : 0] ALUSel;
reg [5 : 0] shamt;

wire [31 : 0] ALUOut;
wire zero;

ALU TEST(ALUIn1,ALUIn2,ALUSel,shamt,ALUOut,zero);

initial begin

ALUSel = 4'b0010;
ALUIn1 <= 32'h00000001;
ALUIn2 <= 32'h00000001;
shamt <= 6'b000000;
#100;    

ALUSel = 4'b0000;
ALUIn1 <= 32'h00000001;
ALUIn2 <= 32'h00000002;
shamt <= 6'b000000;
#100;   

ALUSel = 4'b0001;
ALUIn1 <= 32'h00000001;
ALUIn2 <= 32'h00000002;
shamt <= 6'b000000;
#100;   

ALUSel = 4'b0111;
ALUIn1 <= 32'h00000001;
ALUIn2 <= 32'h00000002;
shamt <= 6'b000000;
#100;   

             //AND
   /*
   ALUSel = 4'b0001;#100;     //OR
   ALUSel <= 4'b0010;#100;     //ADD
   ALUSel <= 4'b0011;#100;     //DIVISION
   ALUSel <= 4'b0100;#100;     //MULTIPLICATION
    ALUSel <= 4'b0101;#100;   //ARITHMATIC SHIFT LEFT
    ALUSel <= 4'b0110;#100;     //SUBTRACTION
    ALUSel <= 4'b0111;#100;     //SHIFT LOGICAL LEFT
    ALUSel <= 4'b1000;#100;     //SHIFT LOGICAL RIGHT
    ALUSel <= 4'b1001;#100;    //LOGICAL VARIABLE SHIFT LEFT
    ALUSel <= 4'b1010;#100;    //LOGICAL VARIABLE SHIFT RIGHT
    ALUSel <= 4'b1011;#100;   //ARITHMATIC SHIFT RIGHT
    
   */
    
end





endmodule
