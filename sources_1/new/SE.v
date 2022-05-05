`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:21:50 AM
// Design Name: 
// Module Name: SE
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



/// SIGN EXTEND ///
module SE(
input [15 : 0] imm, //16-bit signed offset is stored in the immediate
output [31 : 0] simm //this should be added to RFRD1 to find the EFFECTIVE ADDRESS to read from memory
);

assign simm = {{16{imm[15]}}, imm[15 : 0]};

endmodule

