`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:18:45 AM
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


always @(*) begin
    PCBranch <= (simm >> 2) + PCp1;
end

endmodule 

