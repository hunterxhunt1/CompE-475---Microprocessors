`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 02:30:14 PM
// Design Name: 
// Module Name: RFRD1_MUX
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


module RFRD1_MUX(
input [31 : 0] RFRD1,
input [31 : 0] ALUOutM,
input ForwardAD,

output reg [31 : 0] RFMUX1
    );
    
    always @(*) begin
        if (ForwardAD == 1'b1) begin
         RFMUX1 <= ALUOutM;
         end
         
        else if (ForwardAD == 1'b0) begin
        RFMUX1 <= RFRD1;
        end
    end
    
    
    
    
    
endmodule
