`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2021 08:05:59 PM
// Design Name: 
// Module Name: SHIFT_LEFT
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


module SHIFT_LEFT(
input [31 : 0] simm,
output [31 : 0] simmSL
    );
    
    assign simmSL = simm << 2;
    
    
endmodule
