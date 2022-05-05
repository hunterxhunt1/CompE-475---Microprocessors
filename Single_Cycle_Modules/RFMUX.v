`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:27:30 AM
// Design Name: 
// Module Name: RFMUX
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


/// RF MUX ///
module RFMUX(
input RFDSel, 
input [4 : 0] rt,rd,
output reg [4 : 0] rtd //Connects to RFWA
);

always @(RFDSel,rt,rd)begin
    //RFDSel is 1 for R-TYPE instructions
    if(RFDSel == 1'b1)begin
        rtd <= rd;
    end
    
    //RFDSel is 0 for lw 
    else if(RFDSel == 1'b0) begin
        rtd <= rt;
    end

end

endmodule

