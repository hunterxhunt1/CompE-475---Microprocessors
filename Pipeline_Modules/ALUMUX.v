`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:15:30 AM
// Design Name: 
// Module Name: ALUMUX
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


///ALUIn2 MUX ///
module ALUMUX(
input [31 : 0] RFRD2,
input [31 : 0]simm, 
input ALUInSel,
output reg [31 : 0] ALUIn2
);

always @(*) begin
    
    if(ALUInSel == 1'b1) begin
        ALUIn2 <= simm;
        end
    
    else if (ALUInSel == 1'b0) begin
        ALUIn2 <= RFRD2;
        end
   
end

endmodule
