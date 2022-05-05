`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 03:03:58 AM
// Design Name: 
// Module Name: WRITEBACK
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


module WRITEBACK(
input CLK,
input [31 : 0] ALUOutM,
input [31 : 0] DMOut,
input [4 : 0] rtdM,

input RFWEM,MtoRFSelM,JumpM,

output reg [31 : 0] ALUOutW,
output reg [31 : 0] DMOutW,
output reg [4 : 0] rtdW,

output reg RFWEW,MtoRFSelW,JumpW
    );
    
    initial begin
        ALUOutW <= 32'b0;
        DMOutW <= 32'b0;
        rtdW <= 5'b0;
        
        RFWEW <= 1'b0;
        MtoRFSelW <= 1'b0;
        JumpW <= 1'b0;
    end
    
    always @(posedge CLK) begin
        ALUOutW <= ALUOutM;
        DMOutW <= DMOut;
        rtdW <= rtdM;
        
        RFWEW <= RFWEM;
        MtoRFSelW <= MtoRFSelM;
        JumpW <= JumpM;
    end
    
    
endmodule
