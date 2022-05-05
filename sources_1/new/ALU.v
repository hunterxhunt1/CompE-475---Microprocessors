`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:12:15 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
input [31 : 0] ALUIn1, ALUIn2,   //ALUIn1 comes from RFRD1 and ALUIn2 comes from MUX
input [3 : 0] ALUSel,           //Operation Identifier 
input [4 : 0] shamt,            //Shift amount
output reg signed [31 : 0] ALUOut,
output reg Zero 
);
wire [32 : 0] temp;
reg [31 : 0] ALUResult;

assign temp = ALUIn1 - ALUIn2;  //This checks if ALUIn1 and ALUIn2 are the same values

always @(*) begin

//Zero gets sent to PCSel
if(temp == 0) begin
    Zero <= 1'b1;
   end

if(temp != 0) begin
    Zero <= 1'b0;
    end
   
   case(ALUSel)
    
    4'b0000: ALUResult <= ALUIn1 & ALUIn2;     //AND
    4'b0001: ALUResult <= ALUIn1 | ALUIn2;     //OR
    4'b0010: ALUResult <= ALUIn1 + ALUIn2;     //ADD
    4'b0011: ALUResult <= ALUIn2 << shamt;     //SLL
    4'b0100: ALUResult <= ALUIn2 >> shamt;     //SRL
    4'b0101: ALUResult <= ALUIn2 >>> shamt;   //ARITHMATIC SHIFT RIGHT
    4'b0110: ALUResult <= ALUIn1 - ALUIn2;     //SUBTRACTION
    4'b0111: begin     
             if(ALUIn1 < ALUIn2) begin
                ALUResult <= 1'b1;
             end
             else begin
                ALUResult <= 1'b0;
             end
    end
    4'b1000: ALUResult <= (ALUIn2 << ALUIn1);     //SLLV
    4'b1001: ALUResult <= ALUIn1 >> ALUIn2;       //SRLV
    4'b1010: ALUResult <= (ALUIn2 >>> ALUIn1);    //SRAV
    4'b1011: ALUResult <= ALUIn1 * ALUIn2;        //MULTIPLICATION
    
    default: ALUResult <= 32'h00000000;        //Default 0
   
   endcase
   
   ALUOut = ALUResult;
   
end //end of always



endmodule 
