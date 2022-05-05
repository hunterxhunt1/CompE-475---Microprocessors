`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:32:29 AM
// Design Name: 
// Module Name: PCSel
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


/// PCSel ///
module PCSel(
input Zero,Branch,
output reg PCSel
);

always @(*)begin
 
    if(Zero == 1'b1 && Branch == 1'b1)begin // AND gate output if branch and zero are 1
        PCSel <= 1'b1;
        end
    else begin
        PCSel <= 1'b0;
        end
end

endmodule