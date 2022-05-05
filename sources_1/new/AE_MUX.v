`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 01:32:08 AM
// Design Name: 
// Module Name: AE_MUX
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


module AE_MUX(
input [1 : 0] ForwardAE,
input [31 : 0] RFRD1E,
input [31 : 0] ALUDMOut,
input [31 : 0] ALUOutM,

output reg [31 : 0] ALUIn1E
    );
    
    always @(*)begin
        if(ForwardAE == 2'b00)begin
            ALUIn1E <= RFRD1E;
        end
        
        else if(ForwardAE == 2'b01)begin
            ALUIn1E <= ALUDMOut;
        end
        
        else if(ForwardAE == 2'b10)begin
            ALUIn1E <= ALUOutM;
        end
    
    end
    
    
    
endmodule
