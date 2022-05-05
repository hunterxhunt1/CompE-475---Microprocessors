`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 01:40:51 AM
// Design Name: 
// Module Name: BE_MUX
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


module BE_MUX(
input [1 : 0] ForwardBE,
input [31 : 0] RFRD2E,
input [31 : 0] ALUDMOut,
input [31 : 0] ALUOutM,

output reg [31 : 0] DMdInE
    );
    
    always @(*)begin
        if(ForwardBE == 2'b00)begin
            DMdInE <= RFRD2E;
        end
        
        else if(ForwardBE == 2'b01)begin
            DMdInE <= ALUDMOut;
        end
        
        else if(ForwardBE == 2'b10)begin
            DMdInE <= ALUOutM;
        end
    
    end
    
    
endmodule
