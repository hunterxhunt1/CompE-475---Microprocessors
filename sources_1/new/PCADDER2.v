`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 11:43:16 AM
// Design Name: 
// Module Name: PCADDER2
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


module PCADDER2(
input [31 : 0] simmE,
input [31 : 0] PCp1E,

output reg [31 : 0] PCBranchE
    );
    
    always @(*) begin
        PCBranchE <= simmE + PCp1E;
    end
endmodule
