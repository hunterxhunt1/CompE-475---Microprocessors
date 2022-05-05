`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:18:17 AM
// Design Name: 
// Module Name: PC
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


/// PC ///
module PC(
input CLK,EN,
input [31 : 0] PCP,
output [31 : 0] PCOut //32-BIT INSTRUCTION THAT IS FETCHED INTO INSTRUCTION MEMORY
);

reg [31 : 0] next;

initial begin
    next = 32'h00000000;
end

always @(posedge CLK) begin
    if(EN == 1'b0)begin
    next <= PCP;        //Reads from PC' 
    end
    
end

assign PCOut = next;    //Fetch address assogned to PCOut

endmodule
