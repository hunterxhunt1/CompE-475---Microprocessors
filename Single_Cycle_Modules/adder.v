`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:20:24 AM
// Design Name: 
// Module Name: adder
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


/// PC ADDER /// **Outputs PCp1**
 /*
    After fetching an instruction, the address of the next instruction is incremented and new a
     address is written into PC on the NEXT rising edge of CLK
*/
module adder(
input [31 : 0] PCOut,
output reg [31 : 0] PCp1
);
always @(*) begin
    PCp1 <= PCOut + 1; 
    
end

endmodule
