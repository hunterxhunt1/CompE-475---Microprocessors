`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:30:33 AM
// Design Name: 
// Module Name: PCAdder
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


/// PCBranch Adder ///
module PCAdder(
input [31 : 0]simm, PCp1,
output reg [31 : 0] PCBranch
);

always @(simm,PCp1) begin
    PCBranch <= simm + PCp1;
end

endmodule 
