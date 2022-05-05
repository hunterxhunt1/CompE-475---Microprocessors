`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 02:33:52 PM
// Design Name: 
// Module Name: RFRD2_MUX
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


module RFRD2_MUX(
input [31 : 0] RFRD2,
input [31 : 0] ALUOutM,
input ForwardBD,

output reg [31 : 0] RFMUX2
    );
    
    always @(*) begin
        if(ForwardBD == 1'b1) begin
        RFMUX2 <= ALUOutM;
        end
        
        else if(ForwardBD == 1'b0) begin
         RFMUX2 <= RFRD2;
         end
    end
    
endmodule
