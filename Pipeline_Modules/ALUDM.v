`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:14:45 AM
// Design Name: 
// Module Name: ALUDM
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


/// ALUDM MUX /// 
/*
    MUX that outputs ALUDM and connects to RFWD in the Register File
    RF receives data from DM for lw 
    RF receives its data from the ALUOut for R-Type instructions
*/
module ALUDM(
input MtoRFSel,
input [31 : 0] ALUOut,DMOut,
output reg [31 : 0] ALUDMOut
);

always @(*) begin
    
    if(MtoRFSel == 1'b1) begin //R-Type
        ALUDMOut <= DMOut;
        end
  
    else if(MtoRFSel == 1'b0) begin
        ALUDMOut <= ALUOut;  //Load Word 
        end
    
end

endmodule